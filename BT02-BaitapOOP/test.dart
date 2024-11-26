import 'dien_thoai.dart';
import 'hoa_don.dart';
import 'cua_hang.dart';

void main() {
  // Khởi tạo cửa hàng
  var cuaHang = CuaHang("Sai đẹp chiêu mobile", "123 Đường 456");

  // Thêm điện thoại
  var dt1 = DienThoai("DT01", "iPhone 16", "Apple", 20000, 25000, 100, true);
  cuaHang.themDienThoai(dt1);

  var dt2 = DienThoai("DT02", "Samsung Galaxy S23", "Samsung", 18000, 22000, 150, true);
  cuaHang.themDienThoai(dt2);

  // Hiển thị danh sách điện thoại
  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn
  var hoaDon = HoaDon("HD01", DateTime.now(), dt1, 2, 27000, "Nguyễn Tử Nam Dương", "0962999999");
  cuaHang.taoHoaDon(hoaDon);

  // Hiển thị hóa đơn
  cuaHang.hienThiDanhSachHoaDon();
}
