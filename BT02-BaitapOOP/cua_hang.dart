import 'dien_thoai.dart';
import 'hoa_don.dart';

class CuaHang {
  // Thuộc tính private
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai;
  List<HoaDon> _danhSachHoaDon;

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi)
      : _danhSachDienThoai = [],
        _danhSachHoaDon = [];

  // Các phương thức quản lý điện thoại
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  void capNhatDienThoai(DienThoai dienThoai) {
    var index = _danhSachDienThoai.indexWhere((d) => d.maDienThoai == dienThoai.maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index] = dienThoai;
    }
  }

  void ngungKinhDoanhDienThoai(String maDienThoai) {
    var dienThoai = _danhSachDienThoai.firstWhere((d) => d.maDienThoai == maDienThoai);
    if (dienThoai != null) {
      dienThoai.trangThai = false;
    }
  }

  List<DienThoai> timKiemDienThoai(String keyword) {
    return _danhSachDienThoai
        .where((d) => d.maDienThoai.contains(keyword) || d.tenDienThoai.contains(keyword) || d.hangSanXuat.contains(keyword))
        .toList();
  }

  void hienThiDanhSachDienThoai() {
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
    }
  }

  // Các phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    _danhSachHoaDon.add(hoaDon);
  }

  void hienThiDanhSachHoaDon() {
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTin();
    }
  }
}




