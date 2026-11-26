# FinVault – Quản lý tài sản tích lũy

Đề tài nhóm môn Lập trình trên thiết bị di động: app quản lý và theo dõi tài sản tích lũy cá nhân, viết bằng Flutter, phát hành trên Google Play.

## Chạy project lần đầu

1. Cài Flutter SDK và Android Studio (kèm plugin Flutter), tạo một máy ảo Android.
2. Clone repo và tải thư viện:
   ```bash
   git clone <link-repo>
   cd finvault_mobile
   flutter pub get
   ```
3. Mở máy ảo rồi chạy:
   ```bash
   flutter run
   ```
4. Chạy test:
   ```bash
   flutter test
   ```

## Cấu trúc thư mục

```
lib/
├── main.dart                 Điểm khởi động app
├── app.dart                  MaterialApp, theme, router
├── core/
│   ├── router/               Đường dẫn các màn hình (go_router)
│   ├── theme/                Màu sắc, kiểu chữ
│   └── utils/                Hàm dùng chung (định dạng tiền VND…)
├── data/
│   ├── models/               Lớp dữ liệu: tài sản, giao dịch, mục tiêu…   (TV2)
│   └── repositories/         Đọc/ghi Firestore                           (TV2)
├── features/
│   ├── auth/                 Đăng ký, đăng nhập, quên mật khẩu, xóa TK   (TV1)
│   ├── dashboard/            Tổng quan, biểu đồ, báo cáo                  (TV3)
│   ├── assets/               Tài sản, phân loại, nợ, sổ tiết kiệm         (TV2)
│   ├── transactions/         Giao dịch, lịch sử, tìm kiếm                 (TV2)
│   ├── goals/                Mục tiêu tích lũy                            (TV3)
│   ├── market/               Giá vàng, tỷ giá, crypto                     (TV4)
│   └── settings/             Hồ sơ, khóa app, thông báo, giao diện        (TV1, TV4)
└── shared/
    └── widgets/              Widget dùng chung nhiều màn hình
```

Mỗi người làm chủ yếu trong thư mục của mình để hạn chế xung đột khi gộp code. Sửa file dùng chung (`core/`, `shared/`, `pubspec.yaml`) thì báo nhóm trước.

## Quy trình Git

- `main` luôn phải chạy được. **Không push thẳng lên `main`.**
- Mỗi chức năng một nhánh riêng:
  ```bash
  git checkout main
  git pull
  git checkout -b feature/dang-nhap
  ```
- Đặt tên nhánh: `feature/<ten-chuc-nang>` cho chức năng mới, `fix/<mo-ta-loi>` cho sửa lỗi.
- Làm xong thì đẩy nhánh lên và mở Pull Request vào `main`:
  ```bash
  git add .
  git commit -m "Thêm màn hình đăng nhập"
  git push -u origin feature/dang-nhap
  ```
- Trưởng nhóm review rồi merge. Sau khi merge, mọi người `git checkout main && git pull` để cập nhật.
- Trước khi mở Pull Request: chạy `flutter analyze` và `flutter test`, không còn lỗi mới gửi.

## Thêm thư viện

Dùng lệnh thay vì gõ tay vào `pubspec.yaml`, để Flutter tự chọn phiên bản tương thích:

```bash
flutter pub add <ten-thu-vien>
```

Thêm thư viện mới thì nhắn nhóm, vì ai cũng phải chạy lại `flutter pub get`.

## Cấu hình Firebase (TV1)

1. Tạo project trên Firebase Console, bật Authentication (Email/Password, Google) và Cloud Firestore.
2. Cài công cụ và cấu hình:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   flutter pub add firebase_core firebase_auth cloud_firestore
   ```
3. Trong `main.dart`, khởi tạo Firebase trước `runApp`:
   ```dart
   import 'package:firebase_core/firebase_core.dart';
   import 'firebase_options.dart';

   Future<void> main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
     runApp(const FinVaultApp());
   }
   ```

## Lưu ý bảo mật

- **Tuyệt đối không commit file khóa ký app** (`*.jks`, `*.keystore`, `android/key.properties`). Mất hoặc lộ khóa này là rắc rối lớn khi cập nhật app trên Google Play. Người giữ khóa cất ở chỗ an toàn ngoài repo.
- Repo để chế độ **Private**.
