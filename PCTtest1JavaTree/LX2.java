package lx2;

public class LX2 {
public static void main(String[] args)
{
	int[][] arr={{78,12,35,25},{68,54,24,15},{17,18,82,65},{35,28,65,41}};
	int[] t=new int[4];
	for(int i=0;i<4;i++)
	{
		for(int j=i+1;j<4;j++)
		{
			if(arr[i][2]>arr[j][2])
			{
				t=arr[i];
				arr[i]=arr[j];
				arr[j]=t;
			}
		}
	}
	for(int i=0;i<4;i++)
	{
		String ss="";
		for(int j=0;j<4;j++)
		{
			ss=ss+Integer.toString(arr[i][j])+" ";
		}
		System.out.println(ss);
	}
}
}
