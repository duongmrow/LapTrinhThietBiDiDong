class DienThoai {
  // Thuộc tính private
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  // Constructor đầy đủ tham số
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThai);

  // Getter và Setter với validation
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String value) {
    if (value.isEmpty || !RegExp(r"^DT-\d{3}$").hasMatch(value)) {
      throw Exception('Mã điện thoại không hợp lệ.');
    }
    _maDienThoai = value;
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isEmpty) throw Exception('Tên điện thoại không được để trống.');
    _tenDienThoai = value;
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isEmpty) throw Exception('Hãng sản xuất không được để trống.');
    _hangSanXuat = value;
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value <= 0) throw Exception('Giá nhập phải lớn hơn 0.');
    _giaNhap = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value <= 0) throw Exception('Giá bán phải lớn hơn 0.');
    if (value <= _giaNhap) throw Exception('Giá bán phải lớn hơn giá nhập.');
    _giaBan = value;
  }

  int get soLuongTon => _soLuongTon;
  set soLuongTon(int value) {
    if (value < 0) throw Exception('Số lượng tồn không thể nhỏ hơn 0.');
    _soLuongTon = value;
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return (_giaBan - _giaNhap) * _soLuongTon;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn kho: $_soLuongTon');
    print('Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
  }

  // Phương thức kiểm tra có thể bán không
  bool kiemTraBan() {
    return _soLuongTon > 0 && _trangThai;
  }
}
