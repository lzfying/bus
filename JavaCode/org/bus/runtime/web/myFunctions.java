package org.bus.runtime.web;




import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class myFunctions 
{
	/*getSum_JunZhi_FangCha_BiaoZhenCha_ForInt(int i_Arr_data[])
	 * ���ܣ����㣺   ��ͣ�ƽ��ֵ�������׼��
	 * ������i_Arr_data:���ݹ�������תʱ�䣬��λ�ǣ����� 
	 * ����ֵ������һ�����飬���У���[0]��ƽ��ֵ[1]������[2]����׼��[3]������������u=ƽ��ֵ[1]����q�������꣬���ǲ���ֵ��=��׼��[3]��������������
	 */
	//����   ��ͣ�ƽ��ֵ�������׼��,����ֵ����[0]��ƽ��ֵ[1]������[2]����׼��[3]
	public double[] getSum_JunZhi_FangCha_BiaoZhenCha_ForInt(int i_Arr_data[])
	{
		double d_Return[]=new double[4];

		//int i = 0;
		int i_Num = 0;//��ЧԪ���ܸ���

		double d_Sum = 0.0d;// ���
		double d_avg = 0.0d;// ƽ��ֵ
		double d_FangCha=0.0d;// ����------------��׼��ͨ��������
		double d_BiaoZhunCha=0.0d;// ��׼��

		//System.out.println("str_Arr_data.length="+str_Arr_data.length);
		//1�� ���
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
		//2��ƽ��ֵ
		if(i_Num>0)
		{
			d_avg=d_Sum/i_Num;
		}

		//3:����
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
		//4:��׼��
		d_BiaoZhunCha=Math.sqrt(d_FangCha);

		//���ݹ������Ƿ��ӣ���˲���Ҫ��SecendToTime
		d_Return[0]=((int) d_Sum);// ���SecendToMinute
		d_Return[1]= ((int) d_avg) ;// ƽ��ֵ
		//NumberFormat nf = NumberFormat.getNumberInstance();
		//nf.setMaximumFractionDigits(2);
		d_Return[2]=d_FangCha ;// ����------------��׼��ͨ��������
		//nf.setMaximumFractionDigits(2);
		d_Return[3]=  d_BiaoZhunCha;// ��׼��

		return d_Return;

	}

	//���ʱ���-----------------------------------------------------------
	/*getDelta_T(String str_Begin,String str_End,String str_Format)//���ʱ���
	 * ���ܣ�����str_Begin��str_End������
	 * ������
	 * str_Begin��ʱ���1()
	 * str_End��ʱ���2
	 * str_Format����str_Format="yyyy-MM-dd HH:mm:ss"��������ʱ���ĸ�ʽ��hh��ʾ����12Сʱ�ƣ�HH����24Сʱ��"yyyy-MM-dd HH:mm:ss"
	 * ��str_Begin="2014-01-01 06:17:15";str_End="2014-01-01 06:17:30";��str_Format="yyyy-MM-dd HH:mm:ss";,����15��
	 * ��str_Begin="06:17:15";str_End="06:17:39";��str_Format="HH:mm:ss";,����15��
	 * �������ߵ�ʱ����������������>0��<0��=0
	 * ����ʽ�����򷵻�-1
	 */
	public static int getDelta_T(String str_Begin,String str_End,String str_Format)//���ʱ���
	{
		//String str1="06:17:15";
		//String str2="06:17:42";
		String str_Time1=str_Begin;
		String str_Time2=str_End;

		long i=-1;

		SimpleDateFormat df = new SimpleDateFormat(str_Format);//hh��ʾ����12Сʱ�ƣ�HH����24Сʱ��"yyyy-MM-dd HH:mm:ss"

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
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}

		return (int)i;
	}//end of ���ʱ���-----------------------------------------------------------

	/*
	 * getDay_week(Date date)�жϸ�����Ϊ�ܼ�
	 * ,���������ַ������硰2014-04-15�� 
	 * ����ֵ��
	 * ���з���ֵΪ����0,1,2,3,4,5,6
	 * 0���������ա���1��������һ�����Դ�����
	 */
	public static int getDay_week(Date date){
		int week=0;
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
		week=calendar.get(Calendar.DAY_OF_WEEK);
		return week-1;
	}
	/*
	 * getDay_week(String str_date)�жϸ�����Ϊ�ܼ�
	 * ,���������ַ������硰2014-04-15�� 
	 * ����ֵ��
	 * ���з���ֵΪ����0,1,2,3,4,5,6
	 * 0���������ա���1��������һ�����Դ�����
	 */
	public static int getDay_week(String str_date){
		int week=0;
		SimpleDateFormat formatYMD=new SimpleDateFormat("yyyy-MM-dd");//formatYMD��ʾ����yyyy-MM-dd��ʽ
		Date date = null;
		try{
			date=formatYMD.parse(str_date);//��String ת��Ϊ���ϸ�ʽ������
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
	 * ���ܣ�����ʱStr_Timeת����룬Str_Time�ĸ�ʽΪ2��11��12�������ݵĺ����ǡ� ��ʱ2Сʱ11����12�롰������ʱ��.�м���е�3����תʱ�䣨���С����С�ȫ�̣��õľ�����������
	 * ������
	 * Str_Time��Str_Time�ĸ�ʽΪ2��11��12�������ݵĺ����ǡ� ��ʱ2Сʱ11����12�롰������ʱ��
	 * ����ֵ����Ӧ��ʱ������,-1��ʾ����
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
	 * ������ת����ʱ���ʽ��XСʱX����X�룺2��11��12�������ݵĺ����ǡ� ��ʱ2Сʱ11����12�롰������ʱ��
	 * SecendNum������
	 * ����ֵ��
	 * �����򷵻�ʱ���ʽ
	 * ���򷵻� "0"
	 */
	public static String SecendToTime(int SecendNum)
	{
		//=3360;//��
		if(SecendNum<0) return "0";

		int timeNum= SecendNum;//��
		int Hour=timeNum/3600;
		timeNum=timeNum%3600;
		int Minute=timeNum/60;
		int Secend=timeNum%60;
		String s=Hour+":"+Minute+":"+Secend;
		return s;
	}

}
