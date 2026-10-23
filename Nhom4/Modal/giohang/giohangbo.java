package giohang;

import java.util.ArrayList;

public class giohangbo {
	ArrayList<giohang> ds=new ArrayList<giohang>();
   public void Them(String mahang, String tenhang, Long gia, Long soluong) throws Exception{
	  for(giohang h: ds)
		  if(h.getMahang().equals(mahang)) {
			  h.setSoluong(h.getSoluong()+ soluong);
			  return;
		  }
	   ds.add(new giohang(mahang, tenhang, gia, soluong));
   }
   public ArrayList<giohang> getDs() {
	    return ds;
	}
   public void xoa(String mahang) throws Exception{
	   for(giohang h: ds)
			  if(h.getMahang().equals(mahang)) {
				  ds.remove(h);
				  return;
			  }
   }
   public Long tong() throws Exception{
       long s=0;
	   for(giohang h: ds) s+=h.getThanhtien();
	   return s;
   }
   
}
