package org.bus.runtime.web;




import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class myFunctions 
{
	/*getSum_JunZhi_FangCha_BiaoZhenCha_ForInt(int i_Arr_data[])
	 * 功能：计算：   求和，平均值，方差，标准差
	 * 参数：i_Arr_data:传递过来的周转时间，单位是：分钟 
	 * 返回值：返回一个数组，其中：和[0]，平均值[1]，方差[2]，标准差[3]，其中我们用u=平均值[1]，和q（西格玛，就是波动值）=标准差[3]，其他两个备用
	 */
	//计算   求和，平均值，方差，标准差,返回值：和[0]，平均值[1]，方差[2]，标准差[3]
	public double[] getSum_JunZhi_FangCha_BiaoZhenCha_ForInt(int i_Arr_data[])
	{
		double d_Return[]=new double[4];

		//int i = 0;
		int i_Num = 0;//有效元素总个数

		double d_Sum = 0.0d;// 求和
		double d_avg = 0.0d;// 平均值
		double d_FangCha=0.0d;// 方差------------标准差通过方差求
		double d_BiaoZhunCha=0.0d;// 标准差

		//System.out.println("str_Arr_data.length="+str_Arr_data.length);
		//1： 求和
		for (int i = 0; i < i_Arr_data.length; i++) 
		{

			try
			{
				d_Sum += (double)i_Arr_data[i];
				i_Num++;
			}
			catch(NumberFormatException e)
			{
				//System.out.println("null !NumberFormatException");
			}

		}
		//2：平均值
		if(i_Num>0)
		{
			d_avg=d_Sum/i_Num;
		}

		//3:方差
		double d_temp=0.0d;
		for (int i = 0; i < i_Arr_data.length; i++) 
		{

			try
			{
				//d_temp += (TimeToSecend(str_Arr_data[i])-d_avg)*(TimeToSecend(str_Arr_data[i])-d_avg);
				d_temp += (i_Arr_data[i]-d_avg)*(i_Arr_data[i]-d_avg);
			}
			catch(NumberFormatException e)
			{
				//System.out.println("null !NumberFormatException222");
			}

		}
		if(i_Num>0)
		{
			d_FangCha=d_temp/i_Num;
		}
		//4:标准差
		d_BiaoZhunCha=Math.sqrt(d_FangCha);

		//传递过来的是分钟，因此不需要再SecendToTime
		d_Return[0]=((int) d_Sum);// 求和SecendToMinute
		d_Return[1]= ((int) d_avg) ;// 平均值
		//NumberFormat nf = NumberFormat.getNumberInstance();
		//nf.setMaximumFractionDigits(2);
		d_Return[2]=d_FangCha ;// 方差------------标准差通过方差求
		//nf.setMaximumFractionDigits(2);
		d_Return[3]=  d_BiaoZhunCha;// 标准差

		return d_Return;

	}

	//获得时间差-----------------------------------------------------------
	/*getDelta_T(String str_Begin,String str_End,String str_Format)//获得时间差
	 * 功能：计算str_Begin到str_End的秒数
	 * 参数：
	 * str_Begin：时间点1()
	 * str_End：时间点2
	 * str_Format，如str_Format="yyyy-MM-dd HH:mm:ss"：即两个时间点的格式，hh表示的是12小时制，HH才是24小时制"yyyy-MM-dd HH:mm:ss"
	 * 若str_Begin="2014-01-01 06:17:15";str_End="2014-01-01 06:17:30";则str_Format="yyyy-MM-dd HH:mm:ss";,返回15秒
	 * 若str_Begin="06:17:15";str_End="06:17:39";则str_Format="HH:mm:ss";,返回15秒
	 * 返回两者的时间差的秒数，可能是>0、<0、=0
	 * 若格式不对则返回-1
	 */
	public static int getDelta_T(String str_Begin,String str_End,String str_Format)//获得时间差
	{
		//String str1="06:17:15";
		//String str2="06:17:42";
		String str_Time1=str_Begin;
		String str_Time2=str_End;

		long i=-1;

		SimpleDateFormat df = new SimpleDateFormat(str_Format);//hh表示的是12小时制，HH才是24小时制"yyyy-MM-dd HH:mm:ss"

		java.util.Date time1=null;
		java.util.Date time2=null;
		try {
			time1 = df.parse(str_Time1);
			time2 = df.parse(str_Time2);

			long L=time2.getTime()-time1.getTime();//getTime() Returns the number of milliseconds since January 1, 1970, 00:00:00 GMT 
			long day=L/(24*60*60*1000);
			long hour=(L/(60*60*1000)-day*24);
			long min=((L/(60*1000))-day*24*60-hour*60);
			long s=(L/1000-day*24*60*60-hour*60*60-min*60);

			i=s+min*60+hour*60*60+day*24*60*60;
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		return (int)i;
	}//end of 获得时间差-----------------------------------------------------------

	/*
	 * getDay_week(Date date)判断该日期为周几
	 * ,输入日期字符串，如“2014-04-15” 
	 * 返回值：
	 * 其中返回值为整数0,1,2,3,4,5,6
	 * 0：“星期日”；1：“星期一”，以此类推
	 */
	public static int getDay_week(Date date){
		int week=0;
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
		week=calendar.get(Calendar.DAY_OF_WEEK);
		return week-1;
	}
	/*
	 * getDay_week(String str_date)判断该日期为周几
	 * ,输入日期字符串，如“2014-04-15” 
	 * 返回值：
	 * 其中返回值为整数0,1,2,3,4,5,6
	 * 0：“星期日”；1：“星期一”，以此类推
	 */
	public static int getDay_week(String str_date){
		int week=0;
		SimpleDateFormat formatYMD=new SimpleDateFormat("yyyy-MM-dd");//formatYMD表示的是yyyy-MM-dd格式
		Date date = null;
		try{
			date=formatYMD.parse(str_date);//将String 转换为符合格式的日期
			//weekDay=formatD.format(d);
		}catch (Exception e){
			e.printStackTrace();
		}
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
		week=calendar.get(Calendar.DAY_OF_WEEK);
		return week-1;
	}
	
	
	/*TimeToSecend()
	 * 功能：在用时Str_Time转变成秒，Str_Time的格式为2：11：12，该数据的含义是” 用时2小时11分钟12秒“，不是时间.中间表中的3个周转时间（下行、上行。全程）用的就是这种数据
	 * 参数：
	 * Str_Time：Str_Time的格式为2：11：12，该数据的含义是” 用时2小时11分钟12秒“，不是时间
	 * 返回值：对应用时的秒数,-1表示错误
	 */
	public static int TimeToSecend(String Str_Time)
	{
		if(Str_Time.equals(""))  return -1;
		int i_Secend=0;
		String str_Split[]=Str_Time.split(":");

		if(str_Split.length!=3)  return -1;

		i_Secend=Integer.parseInt(str_Split[0])*3600+Integer.parseInt(str_Split[1])*60+Integer.parseInt(str_Split[2]);
		return i_Secend;
	}


	/*SecendToTime()
	 * 将秒数转换成时间格式，X小时X分钟X秒：2：11：12，该数据的含义是” 用时2小时11分钟12秒“，不是时间
	 * SecendNum：秒数
	 * 返回值：
	 * 正常则返回时间格式
	 * 否则返回 "0"
	 */
	public static String SecendToTime(int SecendNum)
	{
		//=3360;//秒
		if(SecendNum<0) return "0";

		int timeNum= SecendNum;//秒
		int Hour=timeNum/3600;
		timeNum=timeNum%3600;
		int Minute=timeNum/60;
		int Secend=timeNum%60;
		String s=Hour+":"+Minute+":"+Secend;
		return s;
	}

}
