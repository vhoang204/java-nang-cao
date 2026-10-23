package sach;

import java.util.ArrayList;

public class sachdao {
    public ArrayList<sach> getSach() throws Exception{
    	ArrayList<sach> ds= new ArrayList<sach>();
    	//String masach, String tensach, String tacgia, Long gia, Long soluong, String anh, String maloai
    	ds.add(new sach("s1", "CSDL", "Hung",(long)10000,(long)3,"b1.jpg", "l1"));
    	ds.add(new sach("s2", "CSDL1", "Hung",(long)10000,(long)3,"b2.jpg", "l1"));
    	ds.add(new sach("s3", "CSDL2", "Hung",(long)10000,(long)3,"b3.jpg", "l1"));
    	ds.add(new sach("s4", "CSDL3", "Hung",(long)10000,(long)3,"b4.jpg", "l1"));
    	ds.add(new sach("s5", "CSDL4", "Hung",(long)10000,(long)3,"b5.jpg", "l2"));
    	ds.add(new sach("s6", "CSDL5", "Hung",(long)10000,(long)3,"b6.jpg", "l2"));
    	return ds;
    	
    }
}
