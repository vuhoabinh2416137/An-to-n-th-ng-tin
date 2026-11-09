# BỘ ĐỀ THI GIỮA KỲ MÔN NHẬP MÔN AN TOÀN THÔNG TIN (IT4015) - ĐỊNH DẠNG 10 BÀI TOÁN TÍNH TOÁN TỰ LUẬN

> **Trường Đại học Bách khoa Hà Nội (HUST) – Trường Công nghệ Thông tin và Truyền thông (SoICT)**  
> **Học phần:** Nhập môn An toàn thông tin (IT4015 / IT4010E)  
> **Hình thức thi:** Tự luận điền đáp án và trình bày các bước tính toán ngắn gọn trực tiếp trên tờ đề thi.  
> **Thời gian làm bài:** 45 – 60 phút (Không sử dụng tài liệu, không sử dụng máy tính lập trình/điện thoại).  
> **Thang điểm:** 10 bài toán $\times$ 1,0 điểm/bài = 10,0 điểm.  
> **Yêu cầu của Bộ môn:** *"Viết sáng sủa và ngắn gọn; Không nháp vào bài thi."*

---

## MỤC LỤC NHANH
1. [Đề thi nguyên bản (Đề Chẵn & Đề Lẻ thực tế tại SoICT)](#phần-i-nguyên-bản-đề-thi-giữa-kỳ-10-bài-toán-đề-chẵn--đề-lẻ)
2. [Bài 1: Thuật toán Euclid mở rộng (Extended Euclidean Algorithm)](#bài-1-thuật-toán-euclid-mở-rộng-extended-euclidean-algorithm)
3. [Bài 2: Thuật toán tính lũy thừa nhanh (Square-and-Multiply)](#bài-2-thuật-toán-tính-lũy-thừa-nhanh-square-and-multiply--Định-lý-euler)
4. [Bài 3: Hàm Logarit rời rạc (Dlog) và Hàm Diffie-Hellman (DH)](#bài-3-hàm-logarit-rời-rạc-dlog-và-hàm-diffie-hellman-dh)
5. [Bài 4: Tính toán trên trường hữu hạn $\text{GF}(2^n)$ và $\text{GF}(p)$](#bài-4-tính-toán-trên-trường-hữu-hạn-gf2n-và-gfp)
6. [Bài 5: Đường cong Elliptic (ECC) và Giao thức ECDH](#bài-5-đường-cong-elliptic-ecc-và-giao-thức-ecdh)
7. [Bài 6: Giao thức trao đổi khóa Diffie-Hellman & Tấn công Man-in-the-Middle](#bài-6-giao-thức-trao-đổi-khóa-diffie-hellman--tấn-công-man-in-the-middle)
8. [Bài 7: Hệ mật khóa công khai RSA & Định lý phần dư Trung Hoa (CRT)](#bài-7-hệ-mật-khóa-công-khai-rsa--định-lý-phần-dư-trung-hoa-crt)
9. [Bài 8: Tấn công gặp nhau ở giữa (Meet-in-the-Middle Attack) trên 2DES](#bài-8-tấn-công-gặp-nhau-ở-giữa-meet-in-the-middle-attack-trên-2des--hệ-mã-khối-kép)
10. [Bài 9: Mật mã Vernam (One-Time Pad) & Chế độ vận hành mã khối (ECB, CBC, CFB, OFB, CTR)](#bài-9-one-time-pad-vernam-và-các-chế-độ-vận-hành-mã-khối-ecb-cbc-cfb-ofb-ctr)
11. [Bài 10: Hàm băm (Hash), Mã xác thực thông điệp (MAC/CBC-MAC/HMAC) & Chữ ký số](#bài-10-hàm-băm-hash-mã-xác-thực-thông-điệp-mac--cbc-mac--hmac-và-chữ-ký-số)

---

## PHẦN I: NGUYÊN BẢN ĐỀ THI GIỮA KỲ 10 BÀI TOÁN (ĐỀ CHẴN & ĐỀ LẺ)

Dưới đây là cấu trúc nguyên văn tờ đề thi giữa kỳ kinh điển của môn **IT4015 – Nhập môn An toàn thông tin** tại SoICT HUST (dạng đề làm trực tiếp trên giấy in sẵn các khung trống):

### ĐỀ CA 1 (ĐỀ LẺ - MÃ ĐỀ A)
*Họ và tên sinh viên: .................................................... MSSV: ................................. Lớp: ........................*  
*(Lưu ý: Viết sáng sủa và ngắn gọn; Không nháp vào bài thi)*

- **Bài 1 (1,0 điểm):** Áp dụng thuật toán Euclid mở rộng để tính:
  a) $18^{-1} \pmod{799}$  
  b) $18^{-1} \pmod{75}$ và $28^{-1} \pmod{75}$
- **Bài 2 (1,0 điểm):** Áp dụng thuật toán bình phương và nhân (Square-and-Multiply) để tính:
  a) $9763^{532} \pmod{11413}$  
  b) $779^{280001} \pmod{11413}$, biết $11413 = 101 \times 113$.
- **Bài 3 (1,0 điểm):** Xét nhóm nhân $\mathbb{Z}_{19}^*$ với $g = 3$ là phần tử sinh (căn nguyên thủy). Hãy tính:
  a) $\text{Dlog}_3(15)$  
  b) Hàm Diffie-Hellman $\text{DH}_3(7, 15)$ trong $\mathbb{Z}_{19}^*$.
- **Bài 4 (1,0 điểm):** Trên trường hữu hạn:
  a) Trong $\text{GF}(2^4)$ với đa thức tối giản $m(x) = x^4 + x + 1$, hãy tính $(x^3 + x^2 + 1) + (x^2 + x + 1)$, $(x^3 + x^2 + 1) \cdot (x^2 + x + 1) \pmod{m(x)}$ và tìm nghịch đảo $(x^3 + x^2 + 1)^{-1} \pmod{m(x)}$.  
  b) Trong $\text{GF}(2^8)$ của chuẩn AES với $m(x) = x^8 + x^4 + x^3 + x + 1$, hãy tính $\{57\} \cdot \{83\}$.
- **Bài 5 (1,0 điểm):** Xét đường cong Elliptic $E: y^2 = x^3 + 2x + 2 \pmod{17}$ trên trường $\mathbb{Z}_{17}$ và điểm cơ sở $P = (5, 1)$ có cấp $n = 19$.
  a) Tính tọa độ các điểm $2P, 3P$.  
  b) Trong giao thức trao đổi khóa ECDH với điểm sinh $P=(5,1)$, Alice chọn khóa bí mật $a = 6$. Hãy tính khóa công khai $A = aP$ của Alice. Nếu Bob gửi cho Alice điểm công khai $B = bP = (10, 11)$, hãy xác định khóa chung $K = abP$ giữa Alice và Bob.
- **Bài 6 (1,0 điểm):** Cho giao thức trao đổi khóa Diffie-Hellman với số nguyên tố $p = 23$, phần tử sinh $g = 5$. Alice chọn $a = 6$, Bob chọn $b = 15$.
  a) Tính khóa công khai của Alice, Bob và khóa phiên chung $K$.  
  b) Nếu kẻ tấn công chủ động Eve đứng giữa (Man-in-the-Middle) chọn $e_1 = 4$ (với Alice) và $e_2 = 9$ (với Bob), hãy mô tả luồng bản tin và các khóa thiết lập được. Nêu giải pháp khắc phục.
- **Bài 7 (1,0 điểm):** Trong hệ mật RSA, Bob chọn hai số nguyên tố $p = 101$ và $q = 113$.
  a) Tính mô-đun $n$, hàm $\phi(n)$ và tìm khóa giải mã $d$ biết số mũ mã hóa công khai $e = 3533$.  
  b) Mã hóa bản rõ $M = 779$ và trình bày cách giải mã nhanh bản mã $C$ bằng Định lý phần dư Trung Hoa (CRT).
- **Bài 8 (1,0 điểm):** Xét hệ mã khối kép (như 2DES) $C = E_{K_2}(E_{K_1}(P))$ với chiều dài mỗi khóa là $k$ bit ($k = 56$ trong DES).
  a) Trình bày nguyên lý tấn công Gặp nhau ở giữa (Meet-in-the-Middle Attack) khi biết cặp bản rõ - bản mã $(P_1, C_1)$.  
  b) Tính độ phức tạp bộ nhớ, độ phức tạp thời gian và số cặp $(P, C)$ cần thiết để xác định duy nhất cặp khóa $(K_1, K_2)$ khi kích thước khối là $b = 64$ bit.
- **Bài 9 (1,0 điểm):**
  a) Mã hóa One-Time Pad (Vernam): Cho bản mã $c = 01010011_2$ và khóa $k = 00110001_2$. Tìm bản rõ $m$. Điều gì xảy ra nếu dùng lại khóa $k$ để mã hóa hai bản rõ $P_1, P_2$?  
  b) Trong các chế độ vận hành mã khối ECB, CBC, CFB, OFB và CTR: Nếu 1 bit của khối bản mã $C_i$ bị đảo trên đường truyền thì có bao nhiêu khối bản rõ $P$ bị ảnh hưởng khi giải mã?
- **Bài 10 (1,0 điểm):**
  a) Phân biệt ngắn gọn mục đích an toàn và đầu vào/đầu ra của Hàm băm (Hash/MDC), Mã xác thực thông điệp (MAC) và Chữ ký số (Digital Signature).  
  b) Xét CBC-MAC với $IV = 0$ dùng để xác thực thông điệp. Chứng minh rằng nếu kẻ tấn công biết thẻ xác thực $T = \text{MAC}_K(M_1)$ của thông điệp 1 khối $M_1$, hắn có thể giả mạo thẻ xác thực hợp lệ cho thông điệp 2 khối $M' = M_1 \parallel (M_1 \oplus T)$ mà không cần biết khóa $K$.

### ĐỀ CA 2 (ĐỀ CHẴN - MÃ ĐỀ B - CÁC BIẾN THỂ SỐ LIỆU)
- **Bài 1 (Biến thể B):** Tính $15^{-1} \pmod{799}$ bằng thuật toán Euclid mở rộng.
- **Bài 2 (Biến thể B):** Tính $97^{6353} \pmod{11413}$ bằng thuật toán bình phương và nhân.
- **Bài 5 (Biến thể B):** Trên $E: y^2 = x^3 + 2x + 2 \pmod{17}$, nếu điểm cơ sở được chọn là $G = (16, 13)$, Alice chọn $a = 4$, Bob gửi $B = (3, 1)$, tìm khóa chung $abG$.

---

## PHẦN II: LỜI GIẢI CHI TIẾT TỪNG BƯỚC (STEP-BY-STEP) CHO 10 BÀI TOÁN

---

### BÀI 1: THUẬT TOÁN EUCLID MỞ RỘNG (EXTENDED EUCLIDEAN ALGORITHM)

#### 1. Cơ sở lý thuyết và Công thức lập bảng chuẩn HUST
Để tìm nghịch đảo nhân của $b$ theo mô-đun $a$ (tức tính $b^{-1} \pmod{a}$, với $a > b$), ta tìm $\gcd(a, b)$ và cặp hệ số Bézout $(s, t)$ sao cho:
$$a \cdot s + b \cdot t = \gcd(a, b)$$
Nếu $\gcd(a, b) = 1$, lấy mô-đun $a$ hai vế ta có:
$$b \cdot t \equiv 1 \pmod{a} \implies b^{-1} \pmod{a} = t \bmod a = \begin{cases} t & \text{nếu } t > 0 \\ t + a & \text{nếu } t < 0 \end{cases}$$

**Quy tắc truy hồi lập bảng (6 cột hoặc 5 cột):**
- Khởi tạo hai dòng đầu tiên:
  - Dòng $i = -1$: $r_{-1} = a, \quad s_{-1} = 1, \quad t_{-1} = 0$
  - Dòng $i = 0$: $r_0 = b, \quad s_0 = 0, \quad t_0 = 1$
- Tại mỗi bước $i \ge 1$ (chừng nào $r_{i-1} \neq 0$):
  - Thương nguyên: $q_i = \lfloor r_{i-2} / r_{i-1} \rfloor$
  - Số dư: $r_i = r_{i-2} - q_i \cdot r_{i-1} = r_{i-2} \bmod r_{i-1}$
  - Hệ số $s_i$: $s_i = s_{i-2} - q_i \cdot s_{i-1}$
  - Hệ số $t_i$: $t_i = t_{i-2} - q_i \cdot t_{i-1}$
- Dừng khi $r_k = 0$. Khi đó tại dòng $k-1$: $\gcd(a, b) = r_{k-1}$ và $a \cdot s_{k-1} + b \cdot t_{k-1} = r_{k-1}$.

---

#### 2. Biến thể A: Tính $18^{-1} \pmod{799}$
Đặt $a = 799, b = 18$. Ta tìm $18^{-1} \pmod{799}$ thông qua hệ số $t$ của $b = 18$.

**Các phép chia Euclid liên tiếp:**
1. $799 = 44 \times 18 + 7 \implies q_1 = 44, r_1 = 7$
2. $18 = 2 \times 7 + 4 \implies q_2 = 2, r_2 = 4$
3. $7 = 1 \times 4 + 3 \implies q_3 = 1, r_3 = 3$
4. $4 = 1 \times 3 + 1 \implies q_4 = 1, r_4 = 1$
5. $3 = 3 \times 1 + 0 \implies q_5 = 3, r_5 = 0$

**Bảng thuật toán Euclid mở rộng:**

| Bước $i$ | Thương $q_i = \lfloor r_{i-2}/r_{i-1}\rfloor$ | Số dư $r_i = r_{i-2} - q_i r_{i-1}$ | Hệ số $s_i = s_{i-2} - q_i s_{i-1}$ | Hệ số $t_i = t_{i-2} - q_i t_{i-1}$ | Kiểm tra $799 s_i + 18 t_i = r_i$ |
| :---: | :---: | :---: | :---: | :---: | :--- |
| $-1$ | — | $799$ | $1$ | $0$ | $799(1) + 18(0) = 799$ |
| $0$ | — | $18$ | $0$ | $1$ | $799(0) + 18(1) = 18$ |
| $1$ | $44$ | $7$ | $1 - 44(0) = 1$ | $0 - 44(1) = -44$ | $799(1) + 18(-44) = 799 - 792 = 7$ |
| $2$ | $2$ | $4$ | $0 - 2(1) = -2$ | $1 - 2(-44) = 89$ | $799(-2) + 18(89) = -1598 + 1602 = 4$ |
| $3$ | $1$ | $3$ | $1 - 1(-2) = 3$ | $-44 - 1(89) = -133$ | $799(3) + 18(-133) = 2397 - 2394 = 3$ |
| **$4$** | **$1$** | **$1$** | **$-2 - 1(3) = -5$** | **$89 - 1(-133) = 222$** | **$799(-5) + 18(222) = -3995 + 3996 = 1$** |
| $5$ | $3$ | $0$ | $3 - 3(-5) = 18$ | $-133 - 3(222) = -799$ | Dừng thuật toán ($r_5 = 0$) |

**Kết luận (Trình bày vào bài thi):**
- Từ dòng $i = 4$, ta có $\gcd(799, 18) = r_4 = 1$, thỏa mãn đẳng thức Bézout:
  $$799 \times (-5) + 18 \times 222 = 1$$
- Lấy mô-đun $799$ hai vế: $18 \times 222 \equiv 1 \pmod{799}$.
- Vậy:
  $$\boxed{18^{-1} \pmod{799} = 222}$$

---

#### 3. Biến thể B: Tính $15^{-1} \pmod{799}$
Đặt $a = 799, b = 15$.

**Các phép chia Euclid liên tiếp:**
1. $799 = 53 \times 15 + 4 \implies q_1 = 53, r_1 = 4$
2. $15 = 3 \times 4 + 3 \implies q_2 = 3, r_2 = 3$
3. $4 = 1 \times 3 + 1 \implies q_3 = 1, r_3 = 1$
4. $3 = 3 \times 1 + 0 \implies q_4 = 3, r_4 = 0$

**Bảng thuật toán Euclid mở rộng:**

| Bước $i$ | Thương $q_i$ | Số dư $r_i$ | Hệ số $s_i$ | Hệ số $t_i$ | Giải thích bước tính $t_i = t_{i-2} - q_i t_{i-1}$ |
| :---: | :---: | :---: | :---: | :---: | :--- |
| $-1$ | — | $799$ | $1$ | $0$ | Khởi tạo $t_{-1} = 0$ |
| $0$ | — | $15$ | $0$ | $1$ | Khởi tạo $t_0 = 1$ |
| $1$ | $53$ | $4$ | $1$ | $-53$ | $t_1 = 0 - 53 \times 1 = -53$ |
| $2$ | $3$ | $3$ | $-3$ | $160$ | $t_2 = 1 - 3 \times (-53) = 160$ |
| **$3$** | **$1$** | **$1$** | **$4$** | **$-213$** | **$t_3 = -53 - 1 \times 160 = -213$** |
| $4$ | $3$ | $0$ | $-15$ | $799$ | Dừng thuật toán ($r_4 = 0$) |

**Kết luận:**
- Tại dòng $i = 3$, $\gcd(799, 15) = r_3 = 1$ và:
  $$799 \times 4 + 15 \times (-213) = 1$$
- Do $t_3 = -213 < 0$, ta chuẩn hóa về tập thặng dư dương $\{0, 1, \dots, 798\}$:
  $$15^{-1} \pmod{799} = -213 \bmod 799 = 799 - 213 = 586$$
- Kiểm tra lại: $15 \times 586 = 8790 = 11 \times 799 + 1 \equiv 1 \pmod{799}$ (Đúng).
- Vậy:
  $$\boxed{15^{-1} \pmod{799} = 586}$$

---

#### 4. Biến thể C: Tính $18^{-1} \pmod{75}$ và $28^{-1} \pmod{75}$

##### Ý 1: Xét $18^{-1} \pmod{75}$
Thực hiện thuật toán Euclid cho $a = 75, b = 18$:
- $75 = 4 \times 18 + 3 \implies r_1 = 3$
- $18 = 6 \times 3 + 0 \implies r_2 = 0$

Ta thấy số dư cuối cùng khác $0$ là $r_1 = \gcd(75, 18) = 3 \neq 1$.
- **Kết luận:** Vì $\gcd(18, 75) = 3 \neq 1$ ($18$ và $75$ không nguyên tố cùng nhau), nên **không tồn tại** nghịch đảo nhân $18^{-1} \pmod{75}$.

##### Ý 2: Xét $28^{-1} \pmod{75}$
Đặt $a = 75, b = 28$.

| Bước $i$ | Thương $q_i$ | Số dư $r_i$ | Hệ số $s_i$ | Hệ số $t_i$ | Chi tiết phép tính |
| :---: | :---: | :---: | :---: | :---: | :--- |
| $-1$ | — | $75$ | $1$ | $0$ | Khởi tạo |
| $0$ | — | $28$ | $0$ | $1$ | Khởi tạo |
| $1$ | $2$ | $19$ | $1$ | $-2$ | $75 = 2 \times 28 + 19$; $t_1 = 0 - 2(1) = -2$ |
| $2$ | $1$ | $9$ | $-1$ | $3$ | $28 = 1 \times 19 + 9$; $t_2 = 1 - 1(-2) = 3$ |
| **$3$** | **$2$** | **$1$** | **$3$** | **$-8$** | **$19 = 2 \times 9 + 1$; $t_3 = -2 - 2(3) = -8$** |
| $4$ | $9$ | $0$ | $-28$ | $75$ | $9 = 9 \times 1 + 0$ (Dừng) |

- Tại dòng $i = 3$: $\gcd(75, 28) = 1$ và $75 \times 3 + 28 \times (-8) = 1$.
- Chuyển về số dư dương theo mô-đun $75$:
  $$28^{-1} \pmod{75} = (-8) \bmod 75 = 75 - 8 = 67$$
- Kiểm tra: $28 \times 67 = 1876 = 25 \times 75 + 1 \equiv 1 \pmod{75}$ (Đúng).
- Vậy:
  $$\boxed{28^{-1} \pmod{75} = 67}$$

---

### BÀI 2: THUẬT TOÁN TÍNH LŨY THỪA NHANH (SQUARE-AND-MULTIPLY) & ĐỊNH LÝ EULER

#### 1. Cơ sở lý thuyết
Để tính $a^b \pmod{n}$ với số mũ $b$ lớn:
1. **Bước 1 (Giảm số mũ bằng Định lý Fermat nhỏ hoặc Định lý Euler nếu có thể):**
   - Nếu $n = p$ là số nguyên tố và $\gcd(a, p) = 1$: $a^{p-1} \equiv 1 \pmod{p} \implies a^b \equiv a^{b \bmod (p-1)} \pmod{p}$.
   - Nếu $n$ là hợp số (ví dụ $n = p \cdot q$ với $p, q$ nguyên tố) và $\gcd(a, n) = 1$:
     $$\phi(n) = (p-1)(q-1), \quad a^{\phi(n)} \equiv 1 \pmod{n} \implies a^b \equiv a^{b \bmod \phi(n)} \pmod{n}$$
2. **Bước 2 (Biểu diễn nhị phân của số mũ $b$):**
   Viết $b$ dưới dạng nhị phân từ bit trọng số cao nhất (MSB) đến thấp nhất (LSB):
   $$b = (b_k b_{k-1} \dots b_1 b_0)_2 = \sum_{i=0}^{k} b_i 2^i \quad (\text{với } b_k = 1)$$
3. **Bước 3 (Thuật toán Bình phương và Nhân - Quét từ trái sang phải MSB $\to$ LSB):**
   - Khởi tạo: $f = 1$ (hoặc khởi tạo tại bit đầu tiên $b_k = 1 \implies f = a \bmod n$).
   - Duyệt $i$ từ $k$ xuống $0$:
     - **Bình phương (Square):** $f \leftarrow f^2 \bmod n$
     - **Nhân (Multiply) nếu $b_i = 1$:** Nếu $b_i = 1$ thì $f \leftarrow (f \cdot a) \bmod n$; nếu $b_i = 0$ thì giữ nguyên $f$.

---

#### 2. Biến thể A: Tính $9763^{532} \pmod{11413}$

> **Lưu ý đặc biệt về đề thi thực tế tại SoICT:**  
> Trong đề thi gốc của thầy Nguyễn Khanh Văn, hai câu lũy thừa nhanh thường có dạng nối tiếp các chữ số `9`, `7`, `6`, `3`, `5`, `3`, `2`, cụ thể là:
> - **Đề A:** Tính $9763^{532} \pmod{11413}$ (hoặc $976^{3532} \pmod{11413}$)
> - **Đề B:** Tính $97^{6353} \pmod{11413}$  
> Dưới đây trình bày bảng tính đầy đủ của $9763^{532} \pmod{11413}$ và giải thích cả trường hợp nếu đề in $976^{3532} \pmod{11413}$.

##### Giải chi tiết cho $9763^{532} \pmod{11413}$:
- **Đổi số mũ $b = 532$ sang nhị phân:**
  Ta có: $532 = 512 + 16 + 4 = 2^9 + 2^4 + 2^2$.
  Do đó:
  $$532 = (1000010100)_2 \quad (\text{gồm } 10 \text{ bit, từ } b_9 \text{ đến } b_0)$$
- **Lập bảng tính từng bước (Quét bit từ trái sang phải, khởi tạo $f = 1$):**

| Bước | Vị trí bit | Giá trị bit $b_i$ | Số mũ tích lũy $c$ | Bình phương: $f \leftarrow f^2 \bmod 11413$ | Nhân (nếu $b_i = 1$): $f \leftarrow (f \cdot 9763) \bmod 11413$ | Kết quả $f$ sau bước |
| :---: | :---: | :---: | :---: | :--- | :--- | :---: |
| Khởi tạo | — | — | $0$ | — | — | $1$ |
| $1$ | $b_9$ | $1$ | $1$ | $1^2 \bmod 11413 = 1$ | $(1 \times 9763) \bmod 11413 = 9763$ | **$9763$** |
| $2$ | $b_8$ | $0$ | $2$ | $9763^2 = 95316169 \equiv 6206 \pmod{11413}$ | *(Giữ nguyên vì $b_8 = 0$)* | **$6206$** |
| $3$ | $b_7$ | $0$ | $4$ | $6206^2 = 38514436 \equiv 6974 \pmod{11413}$ | *(Giữ nguyên vì $b_7 = 0$)* | **$6974$** |
| $4$ | $b_6$ | $0$ | $8$ | $6974^2 = 48636676 \equiv 5883 \pmod{11413}$ | *(Giữ nguyên vì $b_6 = 0$)* | **$5883$** |
| $5$ | $b_5$ | $0$ | $16$ | $5883^2 = 34609689 \equiv 5473 \pmod{11413}$ | *(Giữ nguyên vì $b_5 = 0$)* | **$5473$** |
| $6$ | $b_4$ | $1$ | $33$ | $5473^2 = 29953729 \equiv 6017 \pmod{11413}$ | $(6017 \times 9763) = 58743971 \equiv 1260$ | **$1260$** |
| $7$ | $b_3$ | $0$ | $66$ | $1260^2 = 1587600 \equiv 1193 \pmod{11413}$ | *(Giữ nguyên vì $b_3 = 0$)* | **$1193$** |
| $8$ | $b_2$ | $1$ | $133$ | $1193^2 = 1423249 \equiv 8037 \pmod{11413}$ | $(8037 \times 9763) = 78465231 \equiv 856$ | **$856$** |
| $9$ | $b_1$ | $0$ | $266$ | $856^2 = 732736 \equiv 2304 \pmod{11413}$ | *(Giữ nguyên vì $b_1 = 0$)* | **$2304$** |
| **$10$** | **$b_0$** | **$0$** | **$532$** | **$2304^2 = 5308416 \equiv 1371 \pmod{11413}$** | *(Giữ nguyên vì $b_0 = 0$)* | **$1371$** |

> **Mẹo tính tay nhanh ở Bước 1:** Vì $9763 \equiv -1650 \pmod{11413}$, khi bình phương ở Bước 2 ta chỉ cần tính $(-1650)^2 = 2722500 = 238 \times 11413 + 6206$, nhỏ hơn rất nhiều so với tính $9763^2 = 95316169$!

- **Kết luận:**
  $$\boxed{9763^{532} \pmod{11413} = 1371}$$
  *(Lưu ý thêm: Một số tài liệu giải cũ chép nhầm kết quả trung gian dẫn đến con số $3109$, nhưng kết quả toán học chính xác tuyệt đối của $9763^{532} \bmod 11413$ là **$1371$**. Khi đi thi, chấm điểm dựa trên bảng thuật toán đúng quy trình từng bit).*

---

#### 3. Biến thể B: Tính $97^{6353} \pmod{11413}$

- **Đổi số mũ $b = 6353$ sang nhị phân:**
  Ta phân tích:
  $$6353 = 4096 + 2048 + 128 + 64 + 16 + 1 = 2^{12} + 2^{11} + 2^7 + 2^6 + 2^4 + 2^0$$
  Do đó biểu diễn nhị phân của $6353$ (gồm 13 bit từ $b_{12}$ đến $b_0$) là:
  $$6353 = (1100011010001)_2$$

- **Bảng thuật toán Bình phương và Nhân cho $97^{6353} \pmod{11413}$:**

| Bước | Vị trí bit | Bit $b_i$ | Số mũ $c$ | Bình phương: $f^2 \bmod 11413$ | Nhân với $a = 97$ (nếu $b_i = 1$): $(f^2 \cdot 97) \bmod 11413$ | Giá trị $f$ cuối bước |
| :---: | :---: | :---: | :---: | :--- | :--- | :---: |
| Khởi tạo | — | — | $0$ | — | — | $1$ |
| $1$ | $b_{12}$ | $1$ | $1$ | $1^2 \bmod 11413 = 1$ | $1 \times 97 \bmod 11413 = 97$ | **$97$** |
| $2$ | $b_{11}$ | $1$ | $3$ | $97^2 = 9409$ | $9409 \times 97 = 912673 = 79 \times 11413 + 11046$ | **$11046$** |
| $3$ | $b_{10}$ | $0$ | $6$ | $11046^2 \equiv (-367)^2 = 134689 \equiv 9146$ | *(Giữ nguyên vì $b_{10} = 0$)* | **$9146$** |
| $4$ | $b_9$ | $0$ | $12$ | $9146^2 \equiv (-2267)^2 = 5139289 \equiv 3439$ | *(Giữ nguyên vì $b_9 = 0$)* | **$3439$** |
| $5$ | $b_8$ | $0$ | $24$ | $3439^2 = 11826721 \equiv 2853$ | *(Giữ nguyên vì $b_8 = 0$)* | **$2853$** |
| $6$ | $b_7$ | $1$ | $49$ | $2853^2 = 8139609 \equiv 2140$ | $2140 \times 97 = 207580 = 18 \times 11413 + 2146$ | **$2146$** |
| $7$ | $b_6$ | $1$ | $99$ | $2146^2 = 4605316 \equiv 5877$ | $5877 \times 97 = 570069 = 49 \times 11413 + 10832$ | **$10832$** |
| $8$ | $b_5$ | $0$ | $198$ | $10832^2 \equiv (-581)^2 = 337561 \equiv 6584$ | *(Giữ nguyên vì $b_5 = 0$)* | **$6584$** |
| $9$ | $b_4$ | $1$ | $397$ | $6584^2 = 43349056 \equiv 2482$ | $2482 \times 97 = 240754 = 21 \times 11413 + 1081$ | **$1081$** |
| $10$ | $b_3$ | $0$ | $794$ | $1081^2 = 1168561 \equiv 4435$ | *(Giữ nguyên vì $b_3 = 0$)* | **$4435$** |
| $11$ | $b_2$ | $0$ | $1588$ | $4435^2 = 19669225 \equiv 4626$ | *(Giữ nguyên vì $b_2 = 0$)* | **$4626$** |
| $12$ | $b_1$ | $0$ | $3176$ | $4626^2 = 21399876 \equiv 501$ | *(Giữ nguyên vì $b_1 = 0$)* | **$501$** |
| **$13$** | **$b_0$** | **$1$** | **$6353$** | **$501^2 = 251001 \equiv 11328$** | **$11328 \times 97 \equiv (-85) \times 97 = -8245 \equiv 3168$** | **$3168$** |

- **Kết luận:**
  $$\boxed{97^{6353} \pmod{11413} = 3168}$$

---

#### 4. Biến thể C: Tính $779^{280001} \pmod{11413}$ biết $11413 = 101 \times 113$

Đây là bài toán kiểm tra khả năng kết hợp **Định lý Euler** trước khi dùng thuật toán lũy thừa nhanh:
1. **Bước 1: Tính hàm Euler $\phi(11413)$:**
   Vì $p = 101$ và $q = 113$ đều là các số nguyên tố:
   $$\phi(11413) = \phi(101 \times 113) = (101 - 1) \times (113 - 1) = 100 \times 112 = 11200$$
2. **Bước 2: Kiểm tra điều kiện nguyên tố cùng nhau:**
   Ta có $779 = 19 \times 41$, không chia hết cho $101$ và không chia hết cho $113$, nên:
   $$\gcd(779, 11413) = 1$$
3. **Bước 3: Áp dụng Định lý Euler $a^{\phi(n)} \equiv 1 \pmod{n}$:**
   $$779^{11200} \equiv 1 \pmod{11413}$$
   Chia số mũ $b = 280001$ cho $\phi(n) = 11200$:
   $$280001 = 25 \times 11200 + 1 \implies 280001 \bmod 11200 = 1$$
4. **Bước 4: Rút gọn biểu thức lũy thừa:**
   $$779^{280001} \pmod{11413} = \left(779^{11200}\right)^{25} \cdot 779^1 \pmod{11413} \equiv 1^{25} \cdot 779 \equiv 779 \pmod{11413}$$

- **Kết luận:**
  $$\boxed{779^{280001} \pmod{11413} = 779}$$

---

### BÀI 3: HÀM LOGARIT RỜI RẠC (DLOG) VÀ HÀM DIFFIE-HELLMAN (DH)

#### 1. Cơ sở lý thuyết
Cho nhóm nhân tuần hoàn $\mathbb{Z}_p^* = \{1, 2, \dots, p-1\}$ với $p$ nguyên tố và $g$ là phần tử sinh (generator / primitive root) của $\mathbb{Z}_p^*$.
- **Hàm Logarit rời rạc (Discrete Logarithm):** Với mọi $y \in \mathbb{Z}_p^*$, tồn tại duy nhất số nguyên $x \in \{0, 1, \dots, p-2\}$ (hoặc $\{1, \dots, p-1\}$) sao cho:
  $$g^x \equiv y \pmod{p} \iff x = \text{Dlog}_{g, p}(y) \text{ (viết gọn là } \text{Dlog}_g(y)\text{)}$$
- **Hàm Diffie-Hellman (DH):**
  Trong các tài liệu giảng dạy tại SoICT HUST, có **hai cách ký hiệu** hàm Diffie-Hellman tùy theo slide của từng giảng viên. Sinh viên cần ghi rõ cả hai khi làm bài tự luận để tuyệt đối không mất điểm:
  - **Định nghĩa 1 (Chuẩn lý thuyết độ phức tạp & Slide thầy Văn / Boneh-Shoup):** Hàm $\text{DH}_g(X, Y)$ nhận đầu vào là hai **khóa công khai** $X = g^a \bmod p$ và $Y = g^b \bmod p$, trả về khóa chung:
    $$\text{DH}_g(X, Y) = \text{DH}_g(g^a, g^b) = g^{a \cdot b} \bmod p = X^{\text{Dlog}_g(Y)} \bmod p = Y^{\text{Dlog}_g(X)} \bmod p$$
  - **Định nghĩa 2 (Ký hiệu theo số mũ ở một số bài chữa):** Một số tài liệu ký hiệu $\text{DH}_g(a, b) = g^{a \cdot b} \bmod p$.

---

#### 2. Lời giải chi tiết trên nhóm $\mathbb{Z}_{19}^*$ với phần tử sinh $g = 3$

##### Bảng lũy thừa của $g = 3$ trong $\mathbb{Z}_{19}^*$ (Tính lần lượt $3^k \bmod 19$):

| $k$ | $1$ | $2$ | $3$ | $4$ | $5$ | $6$ | $7$ | $8$ | $9$ | $10$ | $11$ | $12$ | $13$ | $14$ | $15$ | $16$ | $17$ | $18$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $3^k \bmod 19$ | $3$ | $9$ | $8$ | $5$ | **$15$** | **$7$** | $2$ | $6$ | $18$ | $16$ | $10$ | $11$ | $14$ | $4$ | $12$ | $17$ | $13$ | $1$ |

*(Cách tính nhẩm nhanh: $3^1 = 3$; $3^2 = 9$; $3^3 = 27 \equiv 8$; $3^4 \equiv 3 \times 8 = 24 \equiv 5$; $3^5 \equiv 3 \times 5 = 15$; $3^6 \equiv 3 \times 15 = 45 = 2 \times 19 + 7 \equiv 7 \pmod{19}$).*

##### Câu a) Tính $\text{Dlog}_3(15)$ trong $\mathbb{Z}_{19}^*$
- Cần tìm $x \in \{1, 2, \dots, 18\}$ sao cho $3^x \equiv 15 \pmod{19}$.
- Từ các bước lũy thừa:
  - $3^1 \equiv 3 \pmod{19}$
  - $3^2 \equiv 9 \pmod{19}$
  - $3^3 = 27 \equiv 8 \pmod{19}$
  - $3^4 \equiv 8 \times 3 = 24 \equiv 5 \pmod{19}$
  - $3^5 \equiv 5 \times 3 = 15 \pmod{19}$
- Vậy:
  $$\boxed{\text{Dlog}_3(15) = 5}$$

##### Câu b) Tính hàm Diffie-Hellman $\text{DH}_3(7, 15)$ trong $\mathbb{Z}_{19}^*$
Để bài làm đạt điểm tuyệt đối với mọi đáp án chấm của bộ môn, ta trình bày rõ cả 2 cách hiểu ký hiệu:

- **Cách 1 (Chuẩn định nghĩa $\text{DH}_g(X, Y)$ với $X = 7, Y = 15$ là hai giá trị công khai trong $\mathbb{Z}_{19}^*$):**
  - Ta đã có $Y = 15 \equiv 3^5 \pmod{19} \implies b = \text{Dlog}_3(15) = 5$.
  - Tìm $a = \text{Dlog}_3(7)$: Ta có $3^6 \equiv 3 \times 3^5 \equiv 3 \times 15 = 45 = 2 \times 19 + 7 \equiv 7 \pmod{19} \implies a = \text{Dlog}_3(7) = 6$.
  - Theo định nghĩa hàm Diffie-Hellman:
    $$\text{DH}_3(7, 15) = \text{DH}_3(3^6, 3^5) = 3^{6 \times 5} \bmod 19 = 3^{30} \bmod 19$$
  - Hoặc tính trực tiếp không cần qua $a$:
    $$\text{DH}_3(7, 15) = X^b \bmod 19 = 7^5 \bmod 19$$
    Ta có: $7^2 = 49 = 2 \times 19 + 11 \equiv 11 \pmod{19}$; $7^4 \equiv 11^2 = 121 = 6 \times 19 + 7 \equiv 7 \pmod{19}$;
    $$7^5 \equiv 7^4 \times 7 \equiv 7 \times 7 = 49 \equiv 11 \pmod{19}$$
    *(Kiểm tra lại bằng Định lý Fermat nhỏ: $3^{18} \equiv 1 \pmod{19} \implies 3^{30} \equiv 3^{30 \bmod 18} = 3^{12} \equiv 11 \pmod{19}$).*
  - Kết quả theo Định nghĩa 1: $\boxed{\text{DH}_3(7, 15) = 11}$.

- **Cách 2 (Nếu đề bài ký hiệu $\text{DH}_g(a, b) = g^{ab} \bmod p$ với $a = 7, b = 15$ là số mũ):**
  $$\text{DH}_3(7, 15) = 3^{7 \times 15} \bmod 19 = 3^{105} \bmod 19$$
  Vì $105 = 5 \times 18 + 15 \implies 105 \bmod 18 = 15$:
  $$3^{105} \equiv 3^{15} \equiv 12 \pmod{19}$$
  - Kết quả theo Định nghĩa 2: $\boxed{12}$.

---

### BÀI 4: TÍNH TOÁN TRÊN TRƯỜNG HỮU HẠN $\text{GF}(2^n)$ VÀ $\text{GF}(p)$

#### 1. Cơ sở lý thuyết về trường mở rộng $\text{GF}(2^n)$
Các phần tử của trường $\text{GF}(2^n)$ được biểu diễn dưới dạng đa thức bậc nhỏ hơn $n$ với hệ số trong $\text{GF}(2) = \{0, 1\}$:
$$A(x) = a_{n-1}x^{n-1} + \dots + a_1 x + a_0 \leftrightarrow (a_{n-1}\dots a_1 a_0)_2$$
Với đa thức tối giản (bất khả quy) bậc $n$ là $m(x)$:
- **Phép cộng và phép trừ trong $\text{GF}(2^n)$:** Tương đương phép cộng hệ số theo mô-đun $2$ (phép **XOR** từng bit):
  $$A(x) + B(x) = A(x) - B(x) = A(x) \oplus B(x) \quad (\text{vì } 1 + 1 \equiv 0 \pmod 2, \; -1 \equiv 1 \pmod 2)$$
- **Phép nhân trong $\text{GF}(2^n)$:** Nhân hai đa thức trên $\text{GF}(2)[x]$ (cộng các số mũ cùng cơ số bằng phép XOR), sau đó chia lấy phần dư cho đa thức tối giản $m(x)$.
- **Tìm nghịch đảo nhân $A(x)^{-1} \pmod{m(x)}$:** Dùng thuật toán Euclid mở rộng cho đa thức trên $\text{GF}(2)[x]$ sao cho:
  $$m(x) \cdot S(x) + A(x) \cdot T(x) = 1 \implies A(x)^{-1} \pmod{m(x)} = T(x)$$

---

#### 2. Phần A: Tính toán trong $\text{GF}(2^4)$ với $m(x) = x^4 + x + 1$
Cho $A(x) = x^3 + x^2 + 1$ (nhị phân `1101`, thập lục phân `{D}`) và $B(x) = x^2 + x + 1$ (nhị phân `0111`, thập lục phân `{7}`).

##### a1) Phép cộng $A(x) + B(x)$:
$$A(x) + B(x) = (x^3 + x^2 + 1) + (x^2 + x + 1) = x^3 + (1\oplus 1)x^2 + x + (1\oplus 1) = x^3 + x$$
*(Dạng bit: $1101_2 \oplus 0111_2 = 1010_2 = \{A\}$).*
$$\boxed{A(x) + B(x) = x^3 + x}$$

##### a2) Phép nhân $A(x) \cdot B(x) \pmod{x^4 + x + 1}$:
- Nhân đa thức trên $\text{GF}(2)[x]$:
  $$\begin{aligned}
  P(x) &= (x^3 + x^2 + 1)(x^2 + x + 1) \\
  &= x^3(x^2 + x + 1) + x^2(x^2 + x + 1) + 1(x^2 + x + 1) \\
  &= (x^5 + x^4 + x^3) + (x^4 + x^3 + x^2) + (x^2 + x + 1) \\
  &= x^5 + (1\oplus 1)x^4 + (1\oplus 1)x^3 + (1\oplus 1)x^2 + x + 1 \\
  &= x^5 + x + 1
  \end{aligned}$$
- Chia $P(x) = x^5 + x + 1$ cho $m(x) = x^4 + x + 1$ (hoặc dùng quan hệ $x^4 \equiv x + 1 \implies x^5 \equiv x^2 + x \pmod{m(x)}$):
  $$x^5 + x + 1 \equiv (x^2 + x) + x + 1 = x^2 + (1\oplus 1)x + 1 = x^2 + 1 \pmod{x^4 + x + 1}$$
$$\boxed{A(x) \cdot B(x) \pmod{x^4 + x + 1} = x^2 + 1}$$

##### a3) Tìm nghịch đảo $(x^3 + x^2 + 1)^{-1} \pmod{x^4 + x + 1}$ bằng Euclid mở rộng:
Đặt $r_{-1}(x) = m(x) = x^4 + x + 1$ và $r_0(x) = A(x) = x^3 + x^2 + 1$.
1. **Bước $i = 1$:** Chia $x^4 + x + 1$ cho $x^3 + x^2 + 1$:
   - Thương: $q_1(x) = x + 1$ vì $(x+1)(x^3 + x^2 + 1) = (x^4 + x^3 + x) + (x^3 + x^2 + 1) = x^4 + x^2 + x + 1$.
   - Số dư: $r_1(x) = (x^4 + x + 1) - (x^4 + x^2 + x + 1) = x^2$.
   - Hệ số $t_1(x) = t_{-1}(x) - q_1(x)t_0(x) = 0 + (x + 1)\cdot 1 = x + 1$.
2. **Bước $i = 2$:** Chia $r_0(x) = x^3 + x^2 + 1$ cho $r_1(x) = x^2$:
   - Thương: $q_2(x) = x + 1$ vì $(x+1)x^2 = x^3 + x^2$.
   - Số dư: $r_2(x) = (x^3 + x^2 + 1) - (x^3 + x^2) = 1$.
   - Hệ số $t_2(x) = t_0(x) + q_2(x)t_1(x) = 1 + (x + 1)(x + 1) = 1 + (x^2 + 1) = x^2$.

**Bảng Euclid mở rộng cho đa thức trong $\text{GF}(2^4)$:**

| Bước $i$ | Thương $q_i(x)$ | Số dư $r_i(x)$ | Hệ số $s_i(x)$ | Hệ số $t_i(x)$ |
| :---: | :---: | :---: | :---: | :---: |
| $-1$ | — | $x^4 + x + 1$ | $1$ | $0$ |
| $0$ | — | $x^3 + x^2 + 1$ | $0$ | $1$ |
| $1$ | $x + 1$ | $x^2$ | $1$ | $x + 1$ |
| **$2$** | **$x + 1$** | **$1$** | **$x + 1$** | **$x^2$** |

- Kiểm tra lại: $(x^3 + x^2 + 1) \cdot x^2 = x^5 + x^4 + x^2 \equiv (x^2 + x) + (x + 1) + x^2 = 1 \pmod{x^4 + x + 1}$ (Đúng!).
- Vậy:
  $$\boxed{(x^3 + x^2 + 1)^{-1} \pmod{x^4 + x + 1} = x^2}$$

---

#### 3. Phần B: Nhân trong $\text{GF}(2^8)$ của chuẩn AES với $m(x) = x^8 + x^4 + x^3 + x + 1$
**Đề bài:** Tính $\{57\} \cdot \{83\}$ trong trường $\text{GF}(2^8)$ với đa thức tối giản AES $m(x) = x^8 + x^4 + x^3 + x + 1$ (nhị phân `1 0001 1011` hay `{11B}`).

##### Cách 1: Biểu diễn đa thức và rút gọn mô-đun $m(x)$
- Chuyển từ Hex sang nhị phân và đa thức:
  - $\{57\} = 0101\,0111_2 \leftrightarrow A(x) = x^6 + x^4 + x^2 + x + 1$
  - $\{83\} = 1000\,0011_2 \leftrightarrow B(x) = x^7 + x + 1$
- Nhân hai đa thức trên $\text{GF}(2)[x]$:
  $$\begin{aligned}
  A(x) \cdot B(x) &= (x^6 + x^4 + x^2 + x + 1)(x^7 + x + 1) \\
  &= x^7(x^6 + x^4 + x^2 + x + 1) \\
  &\quad \oplus x(x^6 + x^4 + x^2 + x + 1) \\
  &\quad \oplus 1(x^6 + x^4 + x^2 + x + 1) \\
  &= (x^{13} + x^{11} + x^9 + x^8 + x^7) \oplus (x^7 + x^5 + x^3 + x^2 + x) \oplus (x^6 + x^4 + x^2 + x + 1) \\
  &= x^{13} + x^{11} + x^9 + x^8 + x^6 + x^5 + x^4 + x^3 + 1
  \end{aligned}$$
- Thực hiện phép chia đa thức $P(x) = x^{13} + x^{11} + x^9 + x^8 + x^6 + x^5 + x^4 + x^3 + 1$ cho $m(x) = x^8 + x^4 + x^3 + x + 1$:
  - Khử $x^{13}$ (nhân $m(x)$ với $x^5$): $m(x)\cdot x^5 = x^{13} + x^9 + x^8 + x^6 + x^5$.
    Lấy $P(x) \oplus m(x)x^5$:
    $$P_1(x) = x^{11} + x^4 + x^3 + 1$$
  - Khử $x^{11}$ (nhân $m(x)$ với $x^3$): $m(x)\cdot x^3 = x^{11} + x^7 + x^6 + x^4 + x^3$.
    Lấy $P_1(x) \oplus m(x)x^3$:
    $$R(x) = x^7 + x^6 + 1$$
- Chuyển $R(x) = x^7 + x^6 + 1$ về dạng nhị phân và Hex:
  $$x^7 + x^6 + 1 \leftrightarrow 1100\,0001_2 = \{C1\}$$

##### Cách 2: Dùng phép toán `xtime` (Nhân liên tiếp với $x$ trong AES - Cực nhanh và tránh nhầm lẫn)
Quy tắc `xtime(b)`: Dịch trái 1 bit (`b << 1`). Nếu bit cao nhất (bit thứ 7, tức $x^7$) trước khi dịch bằng `1`, ta XOR kết quả dịch trái (8 bit thấp) với `0001 1011` (`{1B}`).
Ta tính lần lượt $\{57\} \cdot x^k \pmod{m(x)}$:
- $\{57\} \cdot 1 = 0101\,0111_2$ (bit $7 = 0$)
- $\{57\} \cdot x = 1010\,1110_2 = \{AE\}$ (bit $7 = 1$)
- $\{57\} \cdot x^2 = 0101\,1100_2 \oplus 0001\,1011_2 = 0100\,0111_2 = \{47\}$ (bit $7 = 0$)
- $\{57\} \cdot x^3 = 1000\,1110_2 = \{8E\}$ (bit $7 = 1$)
- $\{57\} \cdot x^4 = 0001\,1100_2 \oplus 0001\,1011_2 = 0000\,0111_2 = \{07\}$ (bit $7 = 0$)
- $\{57\} \cdot x^5 = 0000\,1110_2 = \{0E\}$ (bit $7 = 0$)
- $\{57\} \cdot x^6 = 0001\,1100_2 = \{1C\}$ (bit $7 = 0$)
- $\{57\} \cdot x^7 = 0011\,1000_2 = \{38\}$

Do $\{83\} = x^7 + x + 1$, ta chỉ việc XOR ba giá trị ứng với $x^7, x^1, 1$:
$$\{57\} \cdot \{83\} = (\{57\} \cdot x^7) \oplus (\{57\} \cdot x) \oplus (\{57\} \cdot 1) = 0011\,1000_2 \oplus 1010\,1110_2 \oplus 0101\,0111_2 = 1100\,0001_2 = \{C1\}$$

- **Kết luận:**
  $$\boxed{\{57\} \cdot \{83\} = x^7 + x^6 + 1 = 11000001_2 = \{C1\}}$$

---

### BÀI 5: ĐƯỜNG CONG ELLIPTIC (ECC) VÀ GIAO THỨC ECDH

#### 1. Cơ sở lý thuyết phép cộng điểm trên đường cong Elliptic $E(\mathbb{Z}_p)$
Cho đường cong Elliptic $E: y^2 \equiv x^3 + ax + b \pmod{p}$ (với $4a^3 + 27b^2 \not\equiv 0 \pmod{p}$) và hai điểm $P = (x_1, y_1), Q = (x_2, y_2) \in E(\mathbb{Z}_p)$:
1. **Điểm đối xứng:** $-P = (x_1, -y_1 \bmod p) = (x_1, p - y_1)$.
2. **Nếu $x_1 = x_2$ và $y_1 + y_2 \equiv 0 \pmod{p}$ (tức $Q = -P$):** $P + Q = \mathcal{O}$ (điểm vô cực).
3. **Nếu $P \neq \pm Q$ (Phép cộng hai điểm phân biệt $x_1 \neq x_2$):**
   $$\lambda = (y_2 - y_1) \cdot (x_2 - x_1)^{-1} \bmod p$$
4. **Nếu $P = Q$ và $y_1 \neq 0$ (Phép nhân đôi điểm $2P$):**
   $$\lambda = (3x_1^2 + a) \cdot (2y_1)^{-1} \bmod p$$
5. **Tọa độ điểm tổng $R = P + Q = (x_3, y_3)$:**
   $$\begin{cases}
   x_3 = (\lambda^2 - x_1 - x_2) \bmod p \\
   y_3 = (\lambda(x_1 - x_3) - y_1) \bmod p
   \end{cases}$$

---

#### 2. Bảng nghịch đảo nhanh trong $\mathbb{Z}_{17}^*$ và Bảng toàn bộ 19 điểm của $E: y^2 = x^3 + 2x + 2 \pmod{17}$

Để tính toán nhanh trên $\mathbb{Z}_{17}$, ta ghi nhớ bảng nghịch đảo $z^{-1} \bmod 17$:

| $z \bmod 17$ | $1$ | $2$ | $3$ | $4$ | $5$ | $6$ | $7$ | $8$ | $9$ | $10$ | $11$ | $12$ | $13$ | $14$ | $15$ | $16$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $z^{-1} \bmod 17$ | $1$ | $9$ | $6$ | $13$ | $7$ | $3$ | $5$ | $15$ | $2$ | $12$ | $14$ | $10$ | $4$ | $11$ | $8$ | $16$ |

##### Hướng dẫn tính tay chi tiết các điểm đầu tiên từ $P = (5, 1)$ (với $a = 2, b = 2, p = 17$):
- **Tính $2P = P + P$ với $P = (5, 1)$:**
  - Hệ số góc $\lambda$:
    $$\lambda = (3x_1^2 + a) \cdot (2y_1)^{-1} \bmod 17 = (3 \cdot 5^2 + 2) \cdot (2 \cdot 1)^{-1} \bmod 17 = 77 \cdot 2^{-1} \bmod 17$$
    Ta có $77 = 4 \times 17 + 9 \equiv 9 \pmod{17}$ và $2^{-1} \equiv 9 \pmod{17}$ (vì $2 \times 9 = 18 \equiv 1$).
    $$\implies \lambda = 9 \times 9 \bmod 17 = 81 \bmod 17 = 13$$
  - Tọa độ $(x_2, y_2)$ của $2P$:
    $$x_2 = (\lambda^2 - 2x_1) \bmod 17 = (13^2 - 10) \bmod 17 = 159 \bmod 17 = 6 \quad (\text{vì } 159 = 9 \times 17 + 6)$$
    $$y_2 = (\lambda(x_1 - x_2) - y_1) \bmod 17 = (13(5 - 6) - 1) \bmod 17 = -14 \bmod 17 = 3$$
  - Vậy **$2P = (6, 3)$**.

- **Tính $3P = 2P + P = (6, 3) + (5, 1)$:**
  - Hệ số góc $\lambda$:
    $$\lambda = (y_2 - y_1)(x_2 - x_1)^{-1} \bmod 17 = (3 - 1)(6 - 5)^{-1} \bmod 17 = 2 \cdot 1^{-1} = 2$$
  - Tọa độ $(x_3, y_3)$ của $3P$:
    $$x_3 = (2^2 - 6 - 5) \bmod 17 = -7 \bmod 17 = 10$$
    $$y_3 = (2(6 - 10) - 3) \bmod 17 = -11 \bmod 17 = 6$$
  - Vậy **$3P = (10, 6)$**.

- **Tính $4P = 3P + P = (10, 6) + (5, 1)$:**
  - $\lambda = (1 - 6)(5 - 10)^{-1} = (-5)(-5)^{-1} \equiv 1 \pmod{17}$
  - $x_4 = (1^2 - 10 - 5) \bmod 17 = -14 \equiv 3 \pmod{17}$
  - $y_4 = (1(10 - 3) - 6) \bmod 17 = 1 \pmod{17} \implies \mathbf{4P = (3, 1)}$.

##### Bảng tra cứu đầy đủ 19 điểm $kP$ ($1P \to 19P$) trên $E: y^2 = x^3 + 2x + 2 \pmod{17}$:

> **Mẹo đối xứng cực hay:** Vì cấp của nhóm là $n = 19$, ta luôn có $(19 - k)P = -kP = (x_k, 17 - y_k)$. Do đó chỉ cần tính từ $1P$ đến $9P$ là suy ra ngay từ $10P$ đến $18P$!

| $k$ | Điểm $kP$ | Hệ số $\lambda$ (khi cộng $+P$) | Đối xứng $(19-k)P = -kP$ | Điểm $(19-k)P$ |
| :---: | :---: | :---: | :---: | :---: |
| **$1$** | **$1P = (5, 1)$** | — | $18P = -1P = (5, 17-1)$ | **$18P = (5, 16)$** |
| **$2$** | **$2P = (6, 3)$** | $\lambda = 13$ | $17P = -2P = (6, 17-3)$ | **$17P = (6, 14)$** |
| **$3$** | **$3P = (10, 6)$** | $\lambda = 2$ | $16P = -3P = (10, 17-6)$ | **$16P = (10, 11)$** |
| **$4$** | **$4P = (3, 1)$** | $\lambda = 1$ | $15P = -4P = (3, 17-1)$ | **$15P = (3, 16)$** |
| **$5$** | **$5P = (9, 16)$** | $\lambda = 0$ | $14P = -5P = (9, 17-16)$ | **$14P = (9, 1)$** |
| **$6$** | **$6P = (16, 13)$** | $\lambda = 8$ | $13P = -6P = (16, 17-13)$ | **$13P = (16, 4)$** |
| **$7$** | **$7P = (0, 6)$** | $\lambda = 15$ | $12P = -7P = (0, 17-6)$ | **$12P = (0, 11)$** |
| **$8$** | **$8P = (13, 7)$** | $\lambda = 16$ | $11P = -8P = (13, 17-7)$ | **$11P = (13, 10)$** |
| **$9$** | **$9P = (7, 6)$** | $\lambda = 5$ | $10P = -9P = (7, 17-6)$ | **$10P = (7, 11)$** |
| **$19$** | **$19P = \mathcal{O}$ (Vô cực)** | $(5, 16) + (5, 1) = \mathcal{O}$ | — | — |

---

#### 3. Giải bài toán giao thức ECDH thực tế trong đề thi

##### Biến thể 1: Điểm sinh $P = (5, 1)$, Alice chọn $a = 6$, Bob gửi $B = bP = (10, 11)$
1. **Khóa công khai của Alice:**
   $$A = aP = 6P = (16, 13)$$
   *(Nếu không lập toàn bộ bảng, sinh viên tính nhanh: $P=(5,1) \to 2P=(6,3) \to 3P=(10,6) \to 6P = 2(3P)$ bằng công thức nhân đôi điểm $(10,6)$: $\lambda = (3\cdot 10^2 + 2)(2\cdot 6)^{-1} = 302 \cdot 12^{-1} \equiv 13 \cdot 10 = 130 \equiv 11 \pmod{17}$; $x_6 = 11^2 - 20 = 101 \equiv 16$; $y_6 = 11(10 - 16) - 6 = -72 \equiv 13 \implies 6P = (16, 13)$).*
2. **Tìm khóa chung $K = abP = aB$:**
   - **Cách 1 (Tính trực tiếp $K = aB = 6 \times (10, 11)$ như Alice thực hiện):**
     - $B = (10, 11)$
     - $2B$: $\lambda = (3\cdot 10^2 + 2)(2\cdot 11)^{-1} = 302 \cdot 5^{-1} \equiv 13 \times 7 = 91 \equiv 6 \pmod{17}$.
       $x_{2B} = (6^2 - 20) \bmod 17 = 16$; $y_{2B} = (6(10 - 16) - 11) \bmod 17 = -47 \equiv 4 \implies 2B = (16, 4)$.
     - $3B = 2B + B = (16, 4) + (10, 11)$:
       $\lambda = (11 - 4)(10 - 16)^{-1} = 7 \cdot (-6)^{-1} \equiv 7 \cdot 11^{-1} = 7 \times 14 = 98 \equiv 13 \pmod{17}$.
       $x_{3B} = (13^2 - 16 - 10) \bmod 17 = 143 \equiv 7$; $y_{3B} = (13(16 - 7) - 4) \bmod 17 = 113 \equiv 11 \implies 3B = (7, 11)$.
     - $6B = 2(3B) = 2 \times (7, 11)$:
       $\lambda = (3\cdot 7^2 + 2)(2\cdot 11)^{-1} = 149 \cdot 5^{-1} \equiv 13 \times 7 = 91 \equiv 6 \pmod{17}$.
       $x_{6B} = (6^2 - 14) \bmod 17 = 22 \equiv 5$; $y_{6B} = (6(7 - 5) - 11) \bmod 17 = 1 \implies 6B = (5, 1)$.
   - **Cách 2 (Nhận diện nhanh từ bảng điểm của $P = (5, 1)$):**
     Ta thấy $3P = (10, 6) \implies B = (10, 11) = (10, 17 - 6) = -3P = 16P$ (tức khóa bí mật của Bob là $b = 16$).
     Do đó khóa chung là:
     $$K = abP = (6 \times 16)P = 96P = (5 \times 19 + 1)P = 1P = (5, 1)$$
- **Kết luận Biến thể 1:**
  $$\boxed{\text{Khóa công khai của Alice } A = (16, 13); \quad \text{Khóa chung } K = abP = (5, 1)}$$

##### Biến thể 2: Điểm cơ sở được chọn là $G = (16, 13)$, Alice chọn $a = 4$, Bob gửi $B = (3, 1)$
- Nhận xét: $G = (16, 13) = 6P$ và $B = (3, 1) = 4P$.
- Khóa công khai của Alice: $A = 4G = 4(6P) = 24P = 5P = (9, 16)$.
- Khóa chung của Alice và Bob:
  $$K = aB = 4B = 4 \times (3, 1) = 4(4P) = 16P = (10, 11)$$
  *(Tính trực tiếp từ $B = (3, 1)$: $2B = 2(3,1) = (13, 7)$; $4B = 2(13, 7) = (10, 11)$).*
- **Kết luận Biến thể 2:**
  $$\boxed{A = (9, 16); \quad K = (10, 11)}$$

---

### BÀI 6: GIAO THỨC TRAO ĐỔI KHÓA DIFFIE-HELLMAN & TẤN CÔNG MAN-IN-THE-MIDDLE

#### 1. Tính toán tham số trao đổi khóa Diffie-Hellman chuẩn
Cho tham số miền công khai: Số nguyên tố $p = 23$, phần tử sinh $g = 5$.
- Alice chọn khóa bí mật $a = 6 \in \{1, \dots, 21\}$:
  - Khóa công khai của Alice gửi cho Bob:
    $$A = g^a \bmod p = 5^6 \bmod 23$$
    *(Tính nhanh: $5^2 = 25 \equiv 2 \pmod{23} \implies 5^6 = (5^2)^3 \equiv 2^3 = 8 \pmod{23}$).*
    $$\implies \boxed{A = 8}$$
- Bob chọn khóa bí mật $b = 15 \in \{1, \dots, 21\}$:
  - Khóa công khai của Bob gửi cho Alice:
    $$B = g^b \bmod p = 5^{15} \bmod 23$$
    *(Tính nhanh: $5^{15} = (5^2)^7 \cdot 5 \equiv 2^7 \cdot 5 = 128 \times 5 \equiv 13 \times 5 = 65 = 2 \times 23 + 19 \equiv 19 \pmod{23}$).*
    $$\implies \boxed{B = 19}$$
- Khóa phiên chung $K$ thiết lập được:
  - Phía Alice tính: $K = B^a \bmod p = 19^6 \bmod 23 \equiv (-4)^6 \bmod 23 = 4096 \bmod 23 = 2 \quad (\text{vì } 4096 = 178 \times 23 + 2)$.
  - Phía Bob tính: $K = A^b \bmod p = 8^{15} \bmod 23 = (2^3)^{15} = 2^{45} \equiv (2^{22})^2 \cdot 2 \equiv 1^2 \cdot 2 = 2 \pmod{23}$.
  $$\implies \boxed{K = 2}$$

---

#### 2. Phân tích tấn công Người đứng giữa (Man-in-the-Middle Attack - MITM)
**Nguyên nhân cốt lõi:** Giao thức Diffie-Hellman cơ bản **không xác thực danh tính** chủ sở hữu của các giá trị công khai $A = g^a \bmod p$ và $B = g^b \bmod p$.

Giả sử kẻ tấn công chủ động **Eve** chặn đường truyền giữa Alice và Bob, chọn $e_1 = 4$ (để giao tiếp với Alice) và $e_2 = 9$ (để giao tiếp với Bob):
- Eve tính hai giá trị giả mạo:
  $$E_1 = g^{e_1} \bmod 23 = 5^4 \bmod 23 \equiv 2^2 = 4$$
  $$E_2 = g^{e_2} \bmod 23 = 5^9 \bmod 23 = (5^2)^4 \cdot 5 \equiv 2^4 \cdot 5 = 80 \equiv 11 \pmod{23}$$

**Sơ đồ kịch bản tấn công MITM:**
```
      ALICE (a = 6)                       EVE (e1 = 4, e2 = 9)                       BOB (b = 15)
  --------------------                 --------------------------                 ------------------
  1. Tính A = 5^6 mod 23 = 8
     -------- A = 8 ------------> [Chặn A=8, giữ lại]
                                  [Thay bằng E2 = 5^9 = 11] -------- E2 = 11 ---------> Nhận E2 = 11
                                                                                        (tưởng của Alice)
                                                                                   2. Tính B = 5^15 mod 23 = 19
     Nhận E1 = 4 <--------------- [Thay bằng E1 = 5^4 = 4]  <------- B = 19 ---------- Gửi B = 19
     (tưởng của Bob)              [Chặn B=19, giữ lại]

  3. Alice tính khóa:             Eve tính 2 khóa phiên riêng:                     Bob tính khóa:
     K_AE = E1^a mod 23           - Với Alice: K_AE = A^e1 = 8^4 mod 23 = 18       K_EB = E2^b mod 23
          = 4^6 mod 23 = 18       - Với Bob:   K_EB = B^e2 = 19^9 mod 23 = 5            = 11^15 mod 23 = 5
```

- **Hậu quả:**
  - Alice và Eve dùng chung khóa $K_{AE} = g^{a \cdot e_1} \bmod 23 = 8^4 \bmod 23 = 4096 \bmod 23 = 2$ (nếu $e_1 = e_2 = e$, Eve chỉ cần chọn 1 số $e=4 \implies E=4$, khi đó $K_{AE} = 4^6 \bmod 23 = 2$ và $K_{EB} = 19^4 \bmod 23 = (-4)^4 \bmod 23 = 256 \bmod 23 = 3$).
  - Khi Alice gửi bản mã $C = E_{K_{AE}}(M)$ cho Bob, Eve chặn lại, giải mã bằng $K_{AE}$ để đọc/sửa bản rõ $M \to M'$, rồi mã hóa lại bằng $K_{EB}$ gửi cho Bob mà cả hai không hề phát hiện!

- **Giải pháp khắc phục:**
  1. **Sử dụng Chữ ký số (Authenticated Diffie-Hellman / Giao thức STS - Station-to-Station):** Alice và Bob ký số lên giá trị công khai của mình trước khi gửi:
     $$A \to B: g^a \bmod p, \; \text{Sig}_{PR_A}(H(g^a \parallel ID_A \parallel ID_B))$$
  2. **Sử dụng Chứng chỉ số (Digital Certificate - PKI/CA):** Dùng chứng chỉ X.509 do CA cấp để gắn kết danh tính của Alice/Bob với khóa công khai DH hoặc khóa ký số của họ.

---

### BÀI 7: HỆ MẬT KHÓA CÔNG KHAI RSA & ĐỊNH LÝ PHẦN DƯ TRUNG HOA (CRT)

#### 1. Thiết lập khóa RSA với $p = 101, q = 113, e = 3533$
1. **Tính mô-đun $n$:**
   $$n = p \times q = 101 \times 113 = 11413$$
2. **Tính hàm Euler $\phi(n)$:**
   $$\phi(n) = (p - 1)(q - 1) = 100 \times 112 = 11200$$
3. **Kiểm tra điều kiện khóa mã hóa $e = 3533$ và tìm khóa giải mã $d = e^{-1} \pmod{\phi(n)}$:**
   Ta áp dụng thuật toán Euclid mở rộng với $a = \phi(n) = 11200$ và $b = e = 3533$:

| Bước $i$ | Thương $q_i = \lfloor r_{i-2}/r_{i-1}\rfloor$ | Số dư $r_i = r_{i-2} \bmod r_{i-1}$ | Hệ số $s_i$ | Hệ số $t_i = t_{i-2} - q_i t_{i-1}$ | Phép chia Euclid tương ứng |
| :---: | :---: | :---: | :---: | :---: | :--- |
| $-1$ | — | $11200$ | $1$ | $0$ | Khởi tạo |
| $0$ | — | $3533$ | $0$ | $1$ | Khởi tạo |
| $1$ | $3$ | $601$ | $1$ | $-3$ | $11200 = 3 \times 3533 + 601$ |
| $2$ | $5$ | $528$ | $-5$ | $16$ | $3533 = 5 \times 601 + 528$ |
| $3$ | $1$ | $73$ | $6$ | $-19$ | $601 = 1 \times 528 + 73$ |
| $4$ | $7$ | $17$ | $-47$ | $149$ | $528 = 7 \times 73 + 17$ |
| $5$ | $4$ | $5$ | $194$ | $-615$ | $73 = 4 \times 17 + 5$ |
| $6$ | $3$ | $2$ | $-629$ | $1994$ | $17 = 3 \times 5 + 2$ |
| **$7$** | **$2$** | **$1$** | **$1452$** | **$-4603$** | **$5 = 2 \times 2 + 1$** |
| $8$ | $2$ | $0$ | $-3533$ | $11200$ | $2 = 2 \times 1 + 0$ (Dừng) |

   - Từ dòng $i = 7$, ta có $\gcd(3533, 11200) = 1$ và $t_7 = -4603$.
   - Khóa bí mật $d$:
     $$d = 3533^{-1} \pmod{11200} = -4603 \bmod 11200 = 11200 - 4603 = 6597$$
   - **Kết luận cặp khóa:**
     - Khóa công khai: $\boxed{PU = (e, n) = (3533, 11413)}$
     - Khóa bí mật: $\boxed{PR = (d, n) = (6597, 11413)}$

*(Biến thể phụ nếu đề cho $e = 17$: Vì $11200 = 658 \times 17 + 14$; $17 = 1 \times 14 + 3$; $14 = 4 \times 3 + 2$; $3 = 1 \times 2 + 1$, ta tìm được $d = 17^{-1} \pmod{11200} = 8563$).*

---

#### 2. Mã hóa bản rõ $M = 779$ và Giải mã nhanh bằng Định lý phần dư Trung Hoa (CRT)

##### a) Mã hóa $M = 779$:
$$C = M^e \bmod n = 779^{3533} \bmod 11413$$
Áp dụng thuật toán Bình phương và Nhân với $3533 = (110111001101)_2$ (hoặc dùng CRT ngay cho phép lũy thừa):
- Tính theo mod $p = 101$:
  - $779 \bmod 101 = 72$ (vì $779 = 7 \times 101 + 72$).
  - Theo Fermat nhỏ: $72^{100} \equiv 1 \pmod{101}$, mà $3533 \bmod 100 = 33$.
  - $C_p = 72^{33} \bmod 101 = 69$.
- Tính theo mod $q = 113$:
  - $779 \bmod 113 = 101 \equiv -12 \pmod{113}$.
  - Theo Fermat nhỏ: $(-12)^{112} \equiv 1 \pmod{113}$, mà $3533 = 31 \times 112 + 61 \implies 3533 \bmod 112 = 61$.
  - $C_q = (-12)^{61} \bmod 113 = 7$.
- Ghép nghiệm CRT: $C = 9385 \pmod{11413}$.

##### b) Giải thích cơ chế tăng tốc giải mã RSA bằng Định lý phần dư Trung Hoa (CRT):
Khi người nhận (Bob) giải mã $M = C^d \bmod n$, vì Bob giữ bí mật hai thừa số nguyên tố $p$ và $q$, thay vì phải tính trực tiếp $C^{6597} \bmod 11413$ với số mũ và mô-đun lớn, Bob thực hiện theo 4 bước CRT:
1. **Rút gọn số mũ và cơ số theo từng số nguyên tố $p = 101, q = 113$:**
   - $d_p = d \bmod (p - 1) = 6597 \bmod 100 = 97$
   - $d_q = d \bmod (q - 1) = 6597 \bmod 112 = 101$
   - $C_p = C \bmod 101 = 9385 \bmod 101 = 93$; $\quad C_q = C \bmod 113 = 9385 \bmod 113 = 6$
2. **Tính hai lũy thừa trên mô-đun nhỏ:**
   - $M_p = C_p^{d_p} \bmod p = 93^{97} \bmod 101 = 72$
   - $M_q = C_q^{d_q} \bmod q = 6^{101} \bmod 113 = 101$
3. **Tính sẵn các hệ số cơ sở CRT (chỉ cần tính 1 lần khi sinh khóa):**
   - $M_1 = q = 113 \implies y_1 = q^{-1} \bmod p = 113^{-1} \bmod 101 = 12^{-1} \bmod 101 = 59$ (vì $12 \times 59 = 708 = 7 \times 101 + 1$).
   - $M_2 = p = 101 \implies y_2 = p^{-1} \bmod q = 101^{-1} \bmod 113 = (-12)^{-1} \bmod 113 = 47$ (vì $101 \times 47 = 4747 = 42 \times 113 + 1$).
4. **Tái tạo bản rõ $M$ (hoặc dùng công thức Garner):**
   $$\begin{aligned}
   M &= (M_p \cdot q \cdot y_1 + M_q \cdot p \cdot y_2) \bmod n \\
   &= (72 \times 113 \times 59 + 101 \times 101 \times 47) \bmod 11413 \\
   &= (480024 + 479447) \bmod 11413 = 959471 \bmod 11413 = \mathbf{779}
   \end{aligned}$$
- **Ý nghĩa tăng tốc:** Với RSA $n$-bit ($p, q$ có độ dài $n/2$ bit), phép nhân mô-đun có độ phức tạp $O((n/2)^2) = \frac{1}{4}O(n^2)$ và số bước lũy thừa giảm một nửa ($n/2$ bit), nên mỗi phép lũy thừa mod $p$ hoặc mod $q$ chỉ tốn $\frac{1}{8}$ thời gian so với tính trực tiếp mod $n$. Cộng cả hai nhánh $p$ và $q$, **giải mã RSA bằng CRT nhanh hơn khoảng $4$ lần** ($\frac{1}{8} + \frac{1}{8} = \frac{1}{4}$ thời gian).

---

### BÀI 8: TẤN CÔNG GẶP NHAU Ở GIỮA (MEET-IN-THE-MIDDLE ATTACK) TRÊN 2DES / HỆ MÃ KHỐI KÉP

#### 1. Mô hình hệ mã khối kép (Double Encryption / 2DES)
Xét hệ mã khối cơ sở $E_K(\cdot)$ có kích thước khối $b$ bit và chiều dài khóa $k$ bit (với DES: $b = 64$ bit, $k = 56$ bit).
Để tăng chiều dài khóa lên $2k$ bit ($112$ bit), người ta mã hóa liên tiếp qua hai khóa độc lập $K_1, K_2 \in \{0, 1\}^k$:
- **Mã hóa:** $X = E_{K_1}(P), \quad C = E_{K_2}(X) = E_{K_2}(E_{K_1}(P))$
- **Giải mã:** $X = D_{K_2}(C), \quad P = D_{K_1}(X) = D_{K_1}(D_{K_2}(C))$

Nếu vét cạn ngây thơ toàn bộ cặp khóa $(K_1, K_2)$, kẻ tấn công cần $2^{2k} = 2^{112}$ phép mã hóa. Tuy nhiên, Diffie và Hellman (1977) đã chứng minh 2DES bị bẻ gãy bởi **Tấn công gặp nhau ở giữa (Meet-in-the-Middle Attack - MITM)**.

---

#### 2. Nguyên lý thuật toán tấn công Meet-in-the-Middle (Known-Plaintext Attack)
Từ phương trình $C = E_{K_2}(E_{K_1}(P))$, tác động hàm giải mã $D_{K_2}$ vào hai vế, ta thu được phương trình điểm giữa $X$:
$$\boxed{E_{K_1}(P) = D_{K_2}(C) = X}$$

Giả sử kẻ tấn công thu thập được các cặp bản rõ – bản mã $(P_1, C_1), (P_2, C_2), \dots$:
1. **Pha 1 (Lập bảng từ phía Bản rõ $P_1$):**
   - Với mọi giá trị khả dĩ của khóa thứ nhất $K_1 \in \{0, 1\}^k$ (có $2^k$ giá trị):
     Tính giá trị trung gian $X = E_{K_1}(P_1)$.
   - Lưu toàn bộ $2^k$ cặp $(X, K_1)$ vào một bảng băm (Hash Table) hoặc danh sách được sắp xếp theo khóa tìm kiếm $X$.
2. **Pha 2 (Đối sánh từ phía Bản mã $C_1$):**
   - Với mỗi giá trị khả dĩ của khóa thứ hai $K_2 \in \{0, 1\}^k$ (tối đa $2^k$ giá trị):
     Tính giá trị giải mã ngược $Y = D_{K_2}(C_1)$.
   - Tra cứu $Y$ trong bảng ở Pha 1. Nếu tìm thấy $Y = X$ ứng với khóa $K_1$, thì cặp $(K_1, K_2)$ là một **ứng viên khóa (candidate key pair)**.
3. **Pha 3 (Loại bỏ báo động giả bằng cặp bản rõ – bản mã thứ hai $(P_2, C_2)$):**
   - Với mỗi cặp ứng viên $(K_1, K_2)$ tìm được ở Pha 2, kiểm tra xem $E_{K_2}(E_{K_1}(P_2)) \stackrel{?}{=} C_2$. Nếu đúng thì $(K_1, K_2)$ chính là khóa thật (với xác suất cực cao).

---

#### 3. Phân tích Độ phức tạp và Số lượng Báo động giả (False Alarms)
- **Độ phức tạp bộ nhớ (Space Complexity):**
  Cần lưu bảng gồm $2^k$ dòng, mỗi dòng chứa $(X, K_1)$ có kích thước $(b + k)$ bit:
  $$\text{Bộ nhớ} = O(2^k) \text{ ô nhớ} \quad (\text{Với 2DES: } 2^{56} \times (64 + 56) \text{ bit} \approx 2^{56} \times 15 \text{ bytes} \approx 10^6 \text{ TB})$$
- **Số lượng ứng viên khóa sai (False Alarms) sau cặp $(P_1, C_1)$ đầu tiên:**
  - Có tổng cộng $2^{2k}$ cặp khóa $(K_1, K_2)$, trong khi không gian giá trị trung gian $X$ có $2^b$ giá trị.
  - Xác suất hai giá trị $b$-bit ngẫu nhiên trùng nhau là $2^{-b}$. Do đó, số cặp khóa $(K_1, K_2)$ thỏa mãn $E_{K_1}(P_1) = D_{K_2}(C_1)$ trung bình là:
    $$N_{\text{candidates after 1st pair}} = \frac{2^{2k}}{2^b} = 2^{2k - b}$$
    *(Với 2DES: $k = 56, b = 64 \implies 2^{112 - 64} = 2^{48}$ cặp khóa ứng viên!).*
  - Khi kiểm tra tiếp trên cặp thứ hai $(P_2, C_2)$, số ứng viên sai còn lại là:
    $$N_{\text{false alarms after 2 pairs}} = \frac{2^{2k}}{2^{2b}} = 2^{2k - 2b}$$
    *(Với 2DES: $2^{112 - 128} = 2^{-16} \ll 1$, tức là chỉ cần **2 cặp $(P, C)$** là xác định duy nhất cặp khóa đúng với xác suất $1 - 2^{-16} \approx 99,9985\%$).*
  - Tổng quát, số cặp $(P, C)$ cần thiết là $t = \lceil 2k / b \rceil$.
- **Độ phức tạp thời gian (Time Complexity):**
  $$T \approx 2^k \text{ (Pha 1)} + 2^k \text{ (Pha 2)} + 2^{2k - b} \text{ (Pha 3)} = O(2^{k+1}) \quad (\text{Với 2DES: } \approx 2^{57} \text{ phép tính DES, chỉ gấp đôi 1DES!})$$

---

#### 4. Bài tập số minh họa cụ thể với khóa nhỏ (Thường ra trong đề tự luận)
**Đề bài:** Xét hệ mã khối thu nhỏ có kích thước khối $b = 4$ bit và khóa $k = 3$ bit ($K \in \{0, 1, \dots, 7\}$) với hàm mã hóa $E_K(P) = (P + K) \bmod 16$ (hoặc phép thế S-box cho trước). Giả sử phép mã hóa đơn được định nghĩa bởi $E_K(P) = (3P + K) \bmod 16$ (do $\gcd(3, 16) = 1$ và $3^{-1} \bmod 16 = 11$, hàm giải mã là $D_K(C) = 11(C - K) \bmod 16$).
Cho cặp bản rõ – bản mã $(P_1 = 2, C_1 = 9)$ của hệ mã kép $C = E_{K_2}(E_{K_1}(P))$ với $K_1, K_2 \in \{0, 1, 2, 3\}$. Hãy tìm các cặp ứng viên $(K_1, K_2)$.

**Lời giải:**
- **Pha 1:** Tính $X = E_{K_1}(P_1) = (3 \times 2 + K_1) \bmod 16 = (6 + K_1) \bmod 16$ với $K_1 \in \{0, 1, 2, 3\}$:
  - $K_1 = 0 \implies X = 6$
  - $K_1 = 1 \implies X = 7$
  - $K_1 = 2 \implies X = 8$
  - $K_1 = 3 \implies X = 9$
- **Pha 2:** Tính $Y = D_{K_2}(C_1) = 11(9 - K_2) \bmod 16$ với $K_2 \in \{0, 1, 2, 3\}$:
  - $K_2 = 0 \implies Y = 11 \times 9 = 99 \equiv 3 \pmod{16}$ (Không khớp)
  - $K_2 = 1 \implies Y = 11 \times 8 = 88 \equiv 8 \pmod{16}$ $\longrightarrow$ **Khớp với $X = 8$ tại $K_1 = 2$!**
  - $K_2 = 2 \implies Y = 11 \times 7 = 77 \equiv 13 \pmod{16}$ (Không khớp)
  - $K_2 = 3 \implies Y = 11 \times 6 = 66 \equiv 2 \pmod{16}$ (Không khớp)
- **Kết luận:** Cặp khóa tìm được là $\boxed{(K_1, K_2) = (2, 1)}$.

---

### BÀI 9: ONE-TIME PAD (VERNAM) VÀ CÁC CHẾ ĐỘ VẬN HÀNH MÃ KHỐI (ECB, CBC, CFB, OFB, CTR)

#### 1. Hệ mật One-Time Pad (OTP / Mật mã Vernam)

##### a) Công thức và Bài tập tính toán nhị phân
- **Mã hóa:** $C = P \oplus K$
- **Giải mã:** $P = C \oplus K$ (vì $C \oplus K = (P \oplus K) \oplus K = P \oplus (K \oplus K) = P \oplus 0 = P$).
- **Áp dụng số liệu đề bài:** Cho bản mã $c = 01010011_2$ và khóa $k = 00110001_2$. Bản rõ $m$ là:
  $$\begin{array}{rcc}
    c = & 0101\,0011_2 \\
  \oplus\; k = & 0011\,0001_2 \\
  \hline
    m = & \mathbf{0110\,0010_2} & (\text{ký tự ASCII } \text{'b'} = 98_{10} = \text{0x62})
  \end{array}$$
  $$\implies \boxed{m = 01100010_2}$$

##### b) Lỗ hổng chí mạng khi tái sử dụng khóa OTP (Two-Time Pad Attack)
Điều kiện để OTP đạt **Độ an toàn tuyệt đối (Perfect Secrecy theo định lý Shannon)** là:
1. Khóa $K$ phải thực sự ngẫu nhiên (phân bố đều).
2. Chiều dài khóa $|K| \ge |P|$ (bằng đúng chiều dài bản rõ).
3. **Khóa $K$ chỉ được phép sử dụng duy nhất 1 lần (One-Time).**

Nếu dùng lại cùng một khóa $K$ để mã hóa hai bản rõ $P_1$ và $P_2$:
$$C_1 = P_1 \oplus K \quad \text{và} \quad C_2 = P_2 \oplus K$$
Kẻ nghe lén lấy hai bản mã XOR với nhau sẽ triệt tiêu hoàn toàn khóa $K$:
$$\boxed{C_1 \oplus C_2 = (P_1 \oplus K) \oplus (P_2 \oplus K) = P_1 \oplus P_2}$$
- **Hậu quả:**
  - Nếu kẻ tấn công biết (hoặc đoán được một phần) bản rõ $P_1$ (ví dụ tiêu đề văn bản chuẩn), hắn tìm ra ngay bản rõ kia: $P_2 = C_1 \oplus C_2 \oplus P_1$ và tìm ra luôn khóa $K = C_1 \oplus P_1$.
  - Ngay cả khi không biết trước $P_1, P_2$, do ngôn ngữ tự nhiên có tính dư thừa cao, kẻ tấn công dùng kỹ thuật **Crib-dragging** (trượt một từ phổ biến như `" the "` dọc theo $P_1 \oplus P_2$) để khôi phục cả $P_1$ và $P_2$.
- **Lỗ hổng tính khả uốn (Malleability):** OTP không đảm bảo tính toàn vẹn. Nếu kẻ tấn công sửa bản mã $C \to C' = C \oplus \Delta$, người nhận sẽ giải mã ra $P' = C' \oplus K = P \oplus \Delta$ (đảo bit tại đúng vị trí kẻ tấn công muốn).

---

#### 2. Bảng tổng hợp 5 Chế độ vận hành mã khối (Block Cipher Modes of Operation) & Sự lan truyền lỗi (Error Propagation)

Giả sử trên đường truyền, **1 bit của khối bản mã $C_i$ bị lỗi (đảo bit)**, các khối bản mã khác giữ nguyên. Hỏi khi người nhận giải mã, có bao nhiêu khối bản rõ $P$ bị sai?

| Chế độ | Công thức Mã hóa | Công thức Giải mã | Ảnh hưởng khi hỏng 1 bit ở bản mã $C_i$ | Giải thích cơ chế lan truyền lỗi |
| :--- | :--- | :--- | :--- | :--- |
| **ECB**<br>*(Electronic Codebook)* | $C_j = E_K(P_j)$ | $P_j = D_K(C_j)$ | **Chỉ hỏng 1 khối $P_i$** (hỏng toàn bộ các bit của khối $P_i$ do hiệu ứng tuyết lở của $D_K$). | Mỗi khối độc lập hoàn toàn; $C_i$ chỉ dùng để tính $P_i = D_K(C_i)$. |
| **CBC**<br>*(Cipher Block Chaining)* | $C_j = E_K(P_j \oplus C_{j-1})$<br>$(C_0 = IV)$ | $P_j = D_K(C_j) \oplus C_{j-1}$ | **Hỏng 2 khối: $P_i$ và $P_{i+1}$:**<br>- Khối $P_i$ bị hỏng hoàn toàn (ngẫu nhiên hóa).<br>- Khối $P_{i+1}$ chỉ bị **hỏng đúng 1 bit** tại vị trí tương ứng với bit lỗi của $C_i$.<br>- Từ khối $P_{i+2}$ trở đi khôi phục bình thường (tự đồng bộ). | Vì $C_i$ xuất hiện ở hai công thức giải mã:<br>1) $P_i = D_K(\mathbf{C_i}) \oplus C_{i-1}$ ($C_i$ đi qua hàm giải mã khối $D_K$ làm hỏng cả khối $P_i$).<br>2) $P_{i+1} = D_K(C_{i+1}) \oplus \mathbf{C_i}$ ($C_i$ chỉ XOR trực tiếp vào đầu ra nên lỗi 1 bit ở $C_i$ chỉ làm đảo đúng 1 bit ở $P_{i+1}$). |
| **CFB** ($s$-bit)<br>*(Cipher Feedback - giả sử $s=b$ cả khối)* | $C_j = P_j \oplus E_K(C_{j-1})$ | $P_j = C_j \oplus E_K(C_{j-1})$ | **Hỏng 2 khối: $P_i$ và $P_{i+1}$:**<br>- Khối $P_i$ chỉ bị **hỏng đúng 1 bit** tương ứng.<br>- Khối $P_{i+1}$ bị **hỏng hoàn toàn** (ngẫu nhiên hóa). | Ngược với CBC:<br>1) $P_i = \mathbf{C_i} \oplus E_K(C_{i-1})$ (XOR trực tiếp $\to$ sai 1 bit).<br>2) $P_{i+1} = C_{i+1} \oplus E_K(\mathbf{C_i})$ ($C_i$ đi vào hàm mã khối $E_K$ $\to$ hỏng toàn bộ khối $P_{i+1}$). |
| **OFB**<br>*(Output Feedback)* | $O_j = E_K(O_{j-1})$<br>$C_j = P_j \oplus O_j$ | $O_j = E_K(O_{j-1})$<br>$P_j = C_j \oplus O_j$ | **Chỉ hỏng đúng 1 bit của khối $P_i$** (không lan sang bit khác của $P_i$ và không lan sang $P_{i+1}$). | Luồng khóa $O_j$ được sinh độc lập với bản mã $C_i$. Khi giải mã $P_i = C_i \oplus O_i$, lỗi 1 bit ở $C_i$ chỉ làm đảo đúng 1 bit đó ở $P_i$. |
| **CTR**<br>*(Counter Mode)* | $C_j = P_j \oplus E_K(\text{Ctr}_j)$ | $P_j = C_j \oplus E_K(\text{Ctr}_j)$ | **Chỉ hỏng đúng 1 bit của khối $P_i$** (không lan sang bit khác hay khối khác). | Tương tự OFB: Giải mã $P_i = C_i \oplus E_K(\text{Ctr}_i)$ chỉ dùng phép XOR trực tiếp với $C_i$, hoàn toàn có thể giải mã song song và truy cập ngẫu nhiên. |

---

### BÀI 10: HÀM BĂM (HASH), MÃ XÁC THỰC THÔNG ĐIỆP (MAC / CBC-MAC / HMAC) VÀ CHỮ KÝ SỐ

#### 1. Phân biệt Hàm băm (Hash / MDC), Mã xác thực thông điệp (MAC) và Chữ ký số (Digital Signature)

| Tiêu chí | Hàm băm mật mã (Cryptographic Hash / MDC) | Mã xác thực thông điệp (MAC / HMAC / CBC-MAC) | Chữ ký số (Digital Signature) |
| :--- | :--- | :--- | :--- |
| **Đầu vào** | Thông điệp $M$ có độ dài tùy ý (**Không dùng khóa**). | Thông điệp $M$ + **Khóa bí mật đối xứng $K$** chia sẻ giữa A và B. | Thông điệp $M$ (hoặc $H(M)$) + **Khóa riêng $PR_A$** của người ký A. |
| **Đầu ra** | Giá trị băm $h = H(M)$ có độ dài cố định. | Thẻ xác thực (Tag) $T = \text{MAC}_K(M)$ có độ dài cố định. | Chữ ký số $\sigma = \text{Sig}_{PR_A}(H(M))$ (xác minh bằng khóa công khai $PU_A$). |
| **Tính toàn vẹn (Integrity)** | Chỉ phát hiện thay đổi nếu giá trị băm $H(M)$ được lưu trữ trên kênh an toàn (nếu gửi $M \parallel H(M)$ trần qua mạng, kẻ tấn công sửa $M \to M'$ và tự tính lại $H(M')$). | **Đảm bảo tính toàn vẹn dữ liệu** (kẻ tấn công không có khóa $K$ không thể tính lại thẻ $\text{MAC}_K(M')$ hợp lệ). | **Đảm bảo tính toàn vẹn dữ liệu** (mọi thay đổi trên $M$ làm phép kiểm tra chữ ký thất bại). |
| **Tính xác thực nguồn gốc (Authentication)** | **Không** (bất kỳ ai cũng tính được $H(M)$). | **Có** (xác thực thông điệp đến từ bên nắm giữ khóa chung $K$). | **Có** (xác thực thông điệp do chính chủ thể giữ $PR_A$ ký). |
| **Tính chống chối bỏ (Non-repudiation)** | **Không**. | **Không** (Vì cả người gửi A và người nhận B đều biết cùng một khóa đối xứng $K$; B có thể tự tạo $\text{MAC}_K(M)$ rồi đổ lỗi cho A, hoặc A chối là do B tự tạo). | **Có (Đảm bảo chống chối bỏ)**: Chỉ duy nhất A biết $PR_A$, trong khi bên thứ ba (Tòa án/Trọng tài) đều có thể kiểm tra bằng $PU_A$. |

---

#### 2. Bài toán Tấn công giả mạo (Existential Forgery) trên CBC-MAC và Cách khắc phục

##### a) Định nghĩa CBC-MAC chuẩn (với $IV = 0^b$)
Cho thông điệp $M = M_1 \parallel M_2 \parallel \dots \parallel M_m$ (gồm $m$ khối $b$-bit). CBC-MAC dùng mã khối $E_K$ với vector khởi tạo cố định $IV = 0$:
$$X_1 = E_K(M_1 \oplus 0) = E_K(M_1)$$
$$X_i = E_K(M_i \oplus X_{i-1}) \quad \text{với } i = 2, \dots, m$$
Thẻ xác thực là khối đầu ra cuối cùng: $T = \text{CBC-MAC}_K(M) = X_m$.

##### b) Kịch bản tấn công giả mạo trên CBC-MAC với thông điệp độ dài thay đổi (Variable-Length Message Forgery)
**Đề bài:** Giả sử kẻ tấn công bắt được một thông điệp 1 khối $M_1$ cùng thẻ xác thực hợp lệ của nó là $T_1 = \text{CBC-MAC}_K(M_1) = E_K(M_1)$. Hãy chỉ ra cách kẻ tấn công tạo ra một thông điệp 2 khối $M'$ có thẻ xác thực hợp lệ mà không cần biết khóa $K$.

**Chứng minh từng bước:**
1. Kẻ tấn công chọn thông điệp giả mạo gồm 2 khối:
   $$M' = M_1 \parallel M_2' \quad \text{trong đó chọn khối thứ hai là } \mathbf{M_2' = M_1 \oplus T_1}$$
2. Khi hệ thống tính thẻ CBC-MAC cho thông điệp 2 khối $M' = M_1 \parallel (M_1 \oplus T_1)$:
   - Tại khối thứ nhất:
     $$X_1' = E_K(M_1) = T_1$$
   - Tại khối thứ hai:
     $$X_2' = E_K(M_2' \oplus X_1') = E_K\big((M_1 \oplus T_1) \oplus T_1\big) = E_K\big(M_1 \oplus (T_1 \oplus T_1)\big) = E_K(M_1) = T_1$$
3. Vậy thẻ CBC-MAC của thông điệp mới $M' = M_1 \parallel (M_1 \oplus T_1)$ chính bằng $\mathbf{T_1}$!
   Kẻ tấn công chỉ việc gửi cặp $\big(M' = M_1 \parallel (M_1 \oplus T_1), \; \text{Tag} = T_1\big)$ và bên nhận sẽ xác thực thành công 100%.

*(Mở rộng: Nếu kẻ tấn công biết hai cặp $(M_1, T_1)$ và $(M_2, T_2)$ bất kỳ, hắn tạo được thông điệp $M'' = M_1 \parallel (M_2 \oplus T_1)$ có thẻ xác thực hợp lệ chính bằng $T_2$, vì $X_1'' = T_1 \implies X_2'' = E_K((M_2 \oplus T_1) \oplus T_1) = E_K(M_2) = T_2$!).*

##### c) Ba giải pháp khắc phục chuẩn để CBC-MAC an toàn với thông điệp độ dài bất kỳ:
1. **Cách 1 (Mã hóa bước cuối bằng khóa độc lập $K_2$ - Chuẩn Encrypted CBC-MAC / EMAC và CMAC):**
   Ở khối cuối cùng, mã hóa thêm một lần nữa bằng khóa thứ hai $K_2$ độc lập với $K_1$:
   $$T = E_{K_2}(X_m)$$
2. **Cách 2 (Ghép độ dài thông điệp vào đầu thông điệp - Prepend Length):**
   Đưa khối chứa độ dài $|M|$ vào làm khối đầu tiên trước khi tính CBC-MAC: $M^* = \text{len}(M) \parallel M_1 \parallel \dots \parallel M_m$. *(Lưu ý: Ghép độ dài vào cuối thông điệp - Append Length - vẫn bị tấn công!).*
3. **Cách 3 (Sử dụng HMAC dựa trên hàm băm):**
   $$\text{HMAC}_K(M) = H\Big((K^+ \oplus \text{opad}) \parallel H\big((K^+ \oplus \text{ipad}) \parallel M\big)\Big)$$
   với $\text{ipad} = \text{0x3636...36}$ và $\text{opad} = \text{0x5C5C...5C}$ giúp chống hoàn toàn tấn công mở rộng độ dài (Length Extension Attack) trên cấu trúc hàm băm Merkle–Damgård.
