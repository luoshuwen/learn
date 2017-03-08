package lx;
import java.util.*;

public class LX {
    static String[] names=new String[200];
    static int[][] nodes=new int[200][4];
    static int pname=0,pnode=0;
    static String Ans2="";
static void digui(int stt)
{
	if(nodes[stt][0]==-1)return;
	Ans2=Ans2+names[nodes[stt][0]]+" ";
	if(nodes[stt][2]!=-1)
	{
		digui(nodes[stt][2]);
	}
	if(nodes[stt][3]!=-1)
	{
		digui(nodes[stt][3]);
	}
}

public static void main(String[] args)
{
	Scanner sc=new Scanner(System.in);
	int n=sc.nextInt();
	String temp=sc.nextLine();



    for(int i=0;i<200;i++)
    	for(int j=0;j<4;j++)
    		nodes[i][j]=-1;
    for(int i=0;i<n;i++)
    {
    	temp=sc.nextLine();
    	String temp1=temp.trim().split(" |\\t|\\n")[0];
    	String temp2=temp.trim().split(" |\\t|\\n")[1];
    	

    	if(i==0)
    	{
    		names[pname++]=temp1;
    		names[pname++]=temp2;
    		nodes[0][0]=0;
    		nodes[0][2]=1;
    		nodes[1][0]=1;
    		nodes[1][1]=0;
    		pnode=2;
    	    continue;
    	}
    	

    	int flag1=-1;
    	for(int j=0;j<pname;j++)
    	{
    		int bb=0;
    		for(int k=0;k<(temp1.length()<names[j].length()?temp1.length():names[j].length());k++)
    		{
    			if(temp1.charAt(k)!=names[j].charAt(k))
    			{
    				bb=1;
    				break;
    			}
    		}
    		if(bb==0)
    		{
    			flag1=j;
    		}
    	}

    	

    	int flag2=-1;
    	for(int j=0;j<pname;j++)
    	{
    		int bb=0;
    		for(int k=0;k<(temp2.length()<names[j].length()?temp2.length():names[j].length());k++)
    		{
    			if(temp2.charAt(k)!=names[j].charAt(k))
    			{
    				bb=1;
    				break;
    			}
    		}
    		if(bb==0)
    		{
    			flag2=j;
    		}
    	}
    	
    	if(flag1==-1&&flag2==-1)
    	{

          continue;          
     	}



    	
    	if(flag1!=-1&&flag2==-1)
    	{
    		names[pname++]=temp2;
    		      
    		nodes[pnode++][0]=pname-1;
    		int tt=-1;
    		for(int j=0;j<pnode;j++)
    		{
    			if(nodes[j][0]==flag1)
    			{
    				tt=j;
    				break;
    			}
    		}
    		
    		if(nodes[tt][2]==-1)
    		{
        		nodes[tt][2]=pname-1;
    		}
    		else
    		{
    			nodes[tt][3]=pname-1;
    		}
    		nodes[pnode-1][1]=tt;
    	}    		
    }

    int m=0;
    m=sc.nextInt();
    temp=sc.nextLine();
    String Ans="";
    for(int i=0;i<m;i++)
    {
    	temp=sc.nextLine();
    	String temp1=temp.trim().split(" |\\t|\\n")[0];
    	String temp2=temp.trim().split(" |\\t|\\n")[2];
        if(temp.trim().split(" |\\t|\\n")[1].charAt(0)=='c')
    	{    		

    		int flag1=-1,flag2=-1;
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp1.length()<names[j].length()?temp1.length():names[j].length());k++)
    			{
    				if(temp1.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag1=j;
    				break;
    			}
    		}
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp2.length()<names[j].length()?temp2.length():names[j].length());k++)
    			{
    				if(temp2.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag2=j;
    				break;
    			}
    		}
    		
    		if(flag1==-1||flag2==-1)
    		{
    			Ans+="F ";
    			break;
    		}
    		
    		for(int j=0;j<pnode;j++)
    		{
    			if(nodes[j][0]==flag1)
    			{
    				if(nodes[j][1]==flag2)
    				{
    					Ans+="T ";
    	    			break;
    				}
    				else
    				{
    					Ans+="F ";
    	    			break;
    				}
    			}
    		}
    	}
    	if(temp.trim().split(" |\\t|\\n")[1].charAt(0)=='p')
    	{

    		int flag1=-1,flag2=-1;
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp1.length()<names[j].length()?temp1.length():names[j].length());k++)
    			{
    				if(temp1.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag1=j;
    				break;
    			}
    		}
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp2.length()<names[j].length()?temp2.length():names[j].length());k++)
    			{
    				if(temp2.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag2=j;
    				break;
    			}
    		}
    		
    		if(flag1==-1||flag2==-1)
    		{
    			Ans+="F ";
    			break;
    		}
    		
    		for(int j=0;j<pnode;j++)
    		{
    			if(nodes[j][0]==flag2)
    			{
    				if(nodes[j][1]==flag1)
    				{
    					Ans+="T ";
    	    			break;
    				}
    				else
    				{
    					Ans+="F ";
    	    			break;
    				}
    			}
    		}
    	}
    	if(temp.trim().split(" |\\t|\\n")[1].charAt(0)=='s')
    	{

    		int flag1=-1,flag2=-1;
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp1.length()<names[j].length()?temp1.length():names[j].length());k++)
    			{
    				if(temp1.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag1=j;
    				break;
    			}
    		}
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp2.length()<names[j].length()?temp2.length():names[j].length());k++)
    			{
    				if(temp2.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag2=j;
    				break;
    			}
    		}
    		
    		if(flag1==-1||flag2==-1)
    		{
    			Ans+="F ";
    			break;
    		}
    		
    		for(int j=0;j<pnode;j++)
    		{
    			if(nodes[j][2]==flag1)
    			{
    				if(nodes[j][3]==flag2)
    				{
    					Ans+="T ";
    	    			break;
    				}
    				else
    				{
    					Ans+="F ";
    	    			break;
    				}
    			}
    			if(nodes[j][3]==flag1)
    			{
    				if(nodes[j][2]==flag2)
    				{
    					Ans+="T ";
    	    			break;
    				}
    				else
    				{
    					Ans+="F ";
    	    			break;
    				}
    			}
    		}
    	}
    	if(temp.trim().split(" |\\t|\\n")[1].charAt(0)=='a')
    	{

    		int flag1=-1,flag2=-1;
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp1.length()<names[j].length()?temp1.length():names[j].length());k++)
    			{
    				if(temp1.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag1=j;
    				break;
    			}
    		}
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp2.length()<names[j].length()?temp2.length():names[j].length());k++)
    			{
    				if(temp2.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag2=j;
    				break;
    			}
    		}
    		
    		if(flag1==-1||flag2==-1)
    		{
    			Ans+="F ";
    			break;
    		}
    		
    		int st=-1;
    		for(int j=0;j<pnode;j++)
    		{
    			if(nodes[j][0]==flag2)
    			{
    				st=j;
    				break;
    			}
    		}
    		
    		while(true)
    		{
    			if(nodes[st][1]==flag1)
    			{
    				Ans+="T ";
    				break;
    			}
    			else
    			{
    				if(nodes[st][1]==0)
    				{
    					Ans+="F ";
    					break;
    				}
    				else
    				{
        				st=nodes[st][1];
    				}
    			}
    		}
    	}
    	if(temp.trim().split(" |\\t|\\n")[1].charAt(0)=='d')
    	{

    		int flag1=-1,flag2=-1;
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp1.length()<names[j].length()?temp1.length():names[j].length());k++)
    			{
    				if(temp1.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag1=j;
    				break;
    			}
    		}
    		for(int j=0;j<pname;j++)
    		{
    			int aa=0;
    			for(int k=0;k<(temp2.length()<names[j].length()?temp2.length():names[j].length());k++)
    			{
    				if(temp2.charAt(k)!=names[j].charAt(k))
    				{
    					aa=1;
    					break;
    				}
    			}
    			if(aa==0)
    			{
    				flag2=j;
    				break;
    			}
    		}
    		
    		if(flag1==-1||flag2==-1)
    		{
    			Ans+="F ";
    			break;
    		}
    		
    		int st=-1;
    		for(int j=0;j<pnode;j++)
    		{
    			if(nodes[j][0]==flag1)
    			{
    				st=j;
    				break;
    			}
    		}
    		
    		while(true)
    		{
    			if(nodes[st][1]==flag2)
    			{
    				Ans+="T ";
    				break;
    			}
    			else
    			{
    				if(nodes[st][1]==0)
    				{
    					Ans+="F ";
    					break;
    				}
    				else
    				{
        				st=nodes[st][1];
    				}
    			}
    		}
    	}
    }
    System.out.println(Ans);
    digui(0);
    System.out.println(Ans2);
}
}
