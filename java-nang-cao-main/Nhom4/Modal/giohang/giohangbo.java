package giohang;

import java.util.ArrayList;
import java.util.Iterator;

public class giohangbo {
    private ArrayList<giohang> ds = new ArrayList<giohang>();

    public void Them(String mahang, String tenhang, Long gia, Long soluong) {
        if (mahang == null || tenhang == null || gia == null || soluong == null || gia < 0 || soluong < 1) return;
        for (giohang h : ds) {
            if (h.getMahang().equals(mahang)) {
                h.setSoluong(h.getSoluong() + soluong);
                return;
            }
        }
        ds.add(new giohang(mahang, tenhang, gia, soluong));
    }

    public ArrayList<giohang> getDs() { return ds; }

    public void xoa(String mahang) {
        Iterator<giohang> it = ds.iterator();
        while (it.hasNext()) {
            if (it.next().getMahang().equals(mahang)) { it.remove(); return; }
        }
    }

    public void xoaNhieu(String[] maHang) {
        if (maHang == null) return;
        for (String ma : maHang) xoa(ma);
    }

    public void xoaTatCa() { ds.clear(); }

    public void capNhatSoLuong(String maHang, long soLuong) {
        if (soLuong < 1) return;
        for (giohang h : ds) {
            if (h.getMahang().equals(maHang)) { h.setSoluong(soLuong); return; }
        }
    }

    public Long tong() {
        long s = 0;
        for (giohang h : ds) s += h.getThanhtien();
        return s;
    }
}
