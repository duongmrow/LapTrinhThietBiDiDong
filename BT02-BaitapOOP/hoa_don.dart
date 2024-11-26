import 'dien_thoai.dart';

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _sdtKhachHang;

  // Constructor đầy đủ tham số
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._sdtKhachHang);

  // Getter và Setter với validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isEmpty || !RegExp(r"^HD-\d{3}$").hasMatch(value)) {
      throw Exception('Mã hóa đơn không hợp lệ.');
    }
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw Exception('Ngày bán không được sau ngày hiện tại.');
    }
    _ngayBan = value;
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value <= 0 || value > _dienThoai.soLuongTon) {
      throw Exception('Số lượng mua không hợp lệ.');
    }
    _soLuongMua = value;
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value <= 0) throw Exception('Giá bán thực tế phải lớn hơn 0.');
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isEmpty) throw Exception('Tên khách hàng không được để trống.');
    _tenKhachHang = value;
  }

  String get sdtKhachHang => _sdtKhachHang;
  set sdtKhachHang(String value) {
    if (!RegExp(r"^\d{10}$").hasMatch(value)) {
      throw Exception('Số điện thoại không hợp lệ.');
    }
    _sdtKhachHang = value;
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuan() {
    return (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Điện thoại: ${_dienThoai.tenDienThoai}');
    print('Số lượng: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Khách hàng: $_tenKhachHang');
    print('SĐT khách hàng: $_sdtKhachHang');
  }
}




