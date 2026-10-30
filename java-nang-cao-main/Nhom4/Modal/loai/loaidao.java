package loai;
import java.util.ArrayList;

public class loaidao {
   public ArrayList<loai> getloai() throws Exception{
	   ArrayList<loai> ds= new ArrayList<loai>();
	   ds.add(new loai("l1", "Loai 1"));
	   ds.add(new loai("l2", "Loai 2"));
	   ds.add(new loai("l3", "Loai 3"));
	   ds.add(new loai("l4", "Loai 4"));
	   return ds;
   }
}
