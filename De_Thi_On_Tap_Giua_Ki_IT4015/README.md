# 📚 TỔNG HỢP ĐỀ THI & ĐỀ ÔN TẬP GIỮA KỲ MÔN NHẬP MÔN AN TOÀN THÔNG TIN (IT4015 / IT4010E) - HUST

Chào mừng bạn đến với kho lưu trữ toàn bộ **Đề thi Giữa kỳ, Đề bài tập Tự luận, Đề kiểm tra MOOC (`soict.daotao.ai`), Ngân hàng Quiz trắc nghiệm, Tờ tóm tắt kiến thức A4 và Công cụ giải toán mật mã tự động** của học phần **IT4015 – Nhập môn An toàn thông tin** (Trường Công nghệ Thông tin và Truyền thông – SoICT, Đại học Bách khoa Hà Nội), biên soạn bám sát chương trình và đề ra của **PGS.TS. Nguyễn Khanh Văn**, **PGS.TS. Nguyễn Linh Giang**, **TS. Trần Vĩnh Đức** và **ThS. Bùi Trọng Tùng**.

---

## 📂 CẤU TRÚC THƯ MỤC & DANH MỤC TÀI LIỆU

### 1. 📝 Bộ Đề Thi & Đề Kiểm Tra Giữa Kỳ (`De_Thi_Giua_Ki/`)
| STT | Tên File | Loại Đề & Học Kỳ | Nội Dung Trọng Tâm |
| :-: | :--- | :--- | :--- |
| **01** | [`01_De_Giua_Ki_10_Bai_Toan_Mat_Ma_Kinh_Dien.md`](./De_Thi_Giua_Ki/01_De_Giua_Ki_10_Bai_Toan_Mat_Ma_Kinh_Dien.md) | **Đề viết trực tiếp vào đề (10 bài x 1đ)**<br>*(Đề Chẵn & Đề Lẻ kinh điển SoICT)* | **10 dạng toán cốt lõi:**<br>1. Thuật toán Euclid mở rộng ($18^{-1}, 15^{-1} \bmod 799$; $18^{-1}, 28^{-1} \bmod 75$)<br>2. Lũy thừa nhanh Square-and-Multiply ($9763^{532}, 97^{6353}, 779^{280001} \bmod 11413$)<br>3. Logarit rời rạc $\text{Dlog}_3(15)$ & hàm $\text{DH}_3(7,15)$ trong $\mathbb{Z}_{19}^*$<br>4. Trường hữu hạn $\text{GF}(2^4)$ và $\text{GF}(2^8)$ trong AES ($\{57\} \cdot \{83\}$)<br>5. Đường cong Elliptic $E: y^2 = x^3 + 2x + 2 \pmod{17}$ & ECDH<br>6. Giao thức Diffie-Hellman & Tấn công Man-in-the-Middle<br>7. Hệ mật RSA ($p=101, q=113, n=11413$) & giải mã nhanh CRT<br>8. Tấn công gặp nhau ở giữa (Meet-in-the-Middle) trên 2DES<br>9. One-Time Pad (Vernam) & các chế độ khối ECB, CBC, CFB, OFB, CTR<br>10. Hàm băm, MAC, CBC-MAC (tấn công giả mạo) & HMAC |
| **02** | [`02_De_Giua_Ki_2022.1_RSA_MSSV_Va_Giao_Thuc.md`](./De_Thi_Giua_Ki/02_De_Giua_Ki_2022.1_RSA_MSSV_Va_Giao_Thuc.md) | **Đề thi Giữa kỳ 2022.1 (60 phút)**<br>*(Đề tự luận tính theo MSSV)* | - **Câu 1 (6đ):** Sinh số nguyên tố $p, q$ từ 4 số cuối MSSV ($\overline{abcd}$ và $\overline{dcba}$), thiết kế hệ mã RSA, mã hóa & giải mã chuỗi tên sinh viên.<br>- **Câu 2 (3đ):** Thiết kế giao thức giữa A và B dùng mật mã công khai + chữ ký số đảm bảo Bảo mật, Toàn vẹn, Xác thực (Sign-then-Encrypt vs Encrypt-then-Sign).<br>- **Câu 3 (1đ):** Mẫu câu trả lời khảo sát & đóng góp môn học đạt điểm tối đa. |
| **03** | [`03_De_Giua_Ki_2025.2_Tinh_Huong_CIA_Va_Tu_Luan.md`](./De_Thi_Giua_Ki/03_De_Giua_Ki_2025.2_Tinh_Huong_CIA_Va_Tu_Luan.md) | **Đề kiểm tra Giữa kỳ 2025.2 (70 phút)**<br>*(Đề tự luận tình huống & mật mã)* | - **Câu 1 (2đ):** Phân tích tình huống niêm phong túi bài thi tốt nghiệp THPT theo mô hình CIA và nguyên tắc Saltzer & Schroeder (Separation of Privilege / Dual Control, Tamper-Evident).<br>- **Câu 2–5 (8đ):** Nguyên lý Kerckhoffs, so sánh SKC vs PKC, mật mã Vernam (OTP), chế độ CBC vs CTR, xác thực mật khẩu với Salt. |
| **04** | [`04_De_Tu_Luan_2022.1_Giao_Thuc_PRT_AU_Loi_Giai_Chi_Tiet.md`](./De_Thi_Giua_Ki/04_De_Tu_Luan_2022.1_Giao_Thuc_PRT_AU_Loi_Giai_Chi_Tiet.md) | **Đề Tự Luận Giao Thức An Toàn 2022.1**<br>*(Giải trọn vẹn 4 tổ hợp MSSV $(X,Y)$)* | Giải chi tiết bài tập lớn / giữa kỳ của thầy Nguyễn Khanh Văn về phân tích giao thức xác thực `PRT_AU`, các bản cải tiến `PROT_00` (An), `PROT_01` (Chi), `PROT_10` (Bình), `PROT_11` (Dũng) và tìm lỗ hổng + sửa bước 5 trong giao thức trao đổi khóa phiên 5 bước của sinh viên Đạt. |
| **05** | [`05_De_Kiem_Tra_Giua_Ki_MOOC_2024.2_Chu_Ky_Dien_Tu_Va_Ham_Bam.md`](./De_Thi_Giua_Ki/05_De_Kiem_Tra_Giua_Ki_MOOC_2024.2_Chu_Ky_Dien_Tu_Va_Ham_Bam.md) | **Đề Kiểm Tra Giữa Kỳ MOOC 2024.2 / 2025.1**<br>*(Hệ thống `soict.daotao.ai`)* | - Bài toán đầu tư chip phần cứng băm **Scorpion-$i$** theo $X = \text{MSSV} \bmod 100, Y = X \bmod 4$ ($4\text{ GB/giờ}$, gói $512\text{B} \implies 2330.17\text{ băm/giây}$).<br>- Hàm Euler $\phi(p^2 q^2)$, số khóa hệ mật **Affine** tiếng Anh ($m=26$) & tiếng Việt ($m=29$).<br>- Tính toán RSA, Chữ ký số RSA, Nghịch lý Ngày sinh (Birthday Paradox) & lý thuyết Hàm băm/MAC. |
| **06** | [`De_Tu_Luan_2022.1_Giao_Thuc_An_Toan_Thay_VanNK.docx`](./De_Thi_Giua_Ki/De_Tu_Luan_2022.1_Giao_Thuc_An_Toan_Thay_VanNK.docx) | **File Word `.docx` gốc** | Bản gốc đề tự luận Giao thức an toàn và ứng dụng (2022.1) của thầy Nguyễn Khanh Văn. |

---

### 2. 🎯 Ngân Hàng Câu Hỏi Trắc Nghiệm Quiz MOOC (`Ngan_Hang_Quiz_MOOC/`)
* **[`Ngan_Hang_Cau_Hoi_Trac_Nghiem_Quiz_1_Den_8_Giua_Ki_IT4015.md`](./Ngan_Hang_Quiz_MOOC/Ngan_Hang_Cau_Hoi_Trac_Nghiem_Quiz_1_Den_8_Giua_Ki_IT4015.md)**:
  * Tuyển tập **75 câu hỏi trắc nghiệm trọng tâm** từ Quiz 1 đến Quiz 8 trên hệ thống MOOC (`soict.daotao.ai`) kèm đáp án và lời giải thích tại sao đúng/sai cho từng phương án.
  * Bao phủ trọn vẹn 5 chuyên đề giữa kỳ: Tổng quan ATTT & CIA, Mật mã cổ điển & Đối xứng (DES/2DES/3DES/AES, Modes of Operation), Mật mã khóa công khai (RSA/DH/ECC/PKI), Hàm băm & Chữ ký số (MDC/MAC/HMAC), và Xác thực danh tính (Password, Salt, Rainbow Table, Challenge-Response, OTP).

---

### 3. 📄 Tờ Tóm Tắt Lý Thuyết & Công Thức A4 (`Tom_Tat_Ly_Thuyet_A4/`)
* **[`GK_ATTT_A4_Tom_Tat_Kien_Thuc_Trong_Tam_IT4015.md`](./Tom_Tat_Ly_Thuyet_A4/GK_ATTT_A4_Tom_Tat_Kien_Thuc_Trong_Tam_IT4015.md)**:
  * Thiết kế chuẩn **"GK ATTT A4"** cô đọng toàn bộ công thức tính nhanh, bảng đối sánh thuật toán (DES vs 3DES vs AES; ECB vs CBC vs CFB vs OFB vs CTR; SKC vs PKC; Hash vs MAC vs Digital Signature) và sơ đồ giao thức xác thực để ôn cấp tốc trước giờ thi.

---

### 4. 🏆 Đề Thi Cuối Kỳ & Phân Tích Giao Thức Mở Rộng (`De_Thi_Cuoi_Ki_Tham_Khao/`)
* **[`05_Tong_Hop_De_Thi_Cuoi_Ki_Va_Phan_Tich_Giao_Thuc_IT4015.md`](./De_Thi_Cuoi_Ki_Tham_Khao/05_Tong_Hop_De_Thi_Cuoi_Ki_Va_Phan_Tich_Giao_Thuc_IT4015.md)**:
  * Tổng hợp các dạng câu hỏi tự luận phân tích giao thức trao đổi khóa qua bên thứ 3 (Needham–Schroeder, Denning–Sacco, Kerberos), phân tích 4 lỗ hổng chuẩn bảo mật mạng không dây WEP & cách khắc phục trên WPA/WPA2, tấn công Tràn bộ đệm (Stack Buffer Overflow), mô hình Kiểm soát truy nhập (DAC, MAC, RBAC, Bell–LaPadula, Biba) và Đề thi cuối kỳ mẫu 90 phút kèm lời giải.

---

### 5. ⚡ Công Cụ Giải Nhanh & In Bảng Từng Bước (`Cong_Cu_Giai_Nhanh/`)
* **[`giai_toan_mat_ma_it4015.ps1`](./Cong_Cu_Giai_Nhanh/giai_toan_mat_ma_it4015.ps1)**:
  * Công cụ viết bằng **PowerShell thuần** (chạy trực tiếp trên mọi máy Windows không cần cài đặt thêm thư viện), tự động xuất bảng trình bày từng bước cho 5 dạng toán lớn trong đề thi giữa kỳ:
    1. `Invoke-ExtendedEuclid` — Lập bảng Euclid mở rộng tìm nghịch đảo $a^{-1} \pmod m$.
    2. `Invoke-FastExp` — Đổi số mũ sang nhị phân và lập bảng Bình phương & Nhân tính $a^b \pmod n$.
    3. `Invoke-DlogAndDH` — Tính Logarit rời rạc $\text{Dlog}_g(y)$ và khóa chung Diffie-Hellman $\text{DH}_g(A, B) \pmod p$.
    4. `Invoke-EllipticCurve` — Liệt kê toàn bộ các điểm bội $kP$ trên đường cong Elliptic $y^2 = x^3 + ax + b \pmod p$ và cộng điểm $P+Q$.
    5. `Invoke-RSASolver` — Tự động tìm số nguyên tố $p, q$ từ 4 số cuối MSSV, tính $n, \phi(n), d$, mã hóa và giải mã RSA.
  * **Cách chạy kiểm thử tự động toàn bộ bài toán trong đề thi:**
    ```powershell
    powershell -ExecutionPolicy Bypass -File "D:\hust\An toàn thông tin\De_Thi_On_Tap_Giua_Ki_IT4015\Cong_Cu_Giai_Nhanh\giai_toan_mat_ma_it4015.ps1"
    ```
