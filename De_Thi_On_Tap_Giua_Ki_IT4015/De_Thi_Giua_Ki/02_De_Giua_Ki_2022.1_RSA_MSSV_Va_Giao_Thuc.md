# ĐỀ THI GIỮA KỲ 2022.1 - HỌC PHẦN NHẬP MÔN AN TOÀN THÔNG TIN (IT4015)
## Chủ đề: Thiết kế Hệ mật RSA theo MSSV & Thiết kế Giao thức Trao đổi Thông điệp An toàn

> **Trường Đại học Bách khoa Hà Nội (HUST) – Trường Công nghệ Thông tin và Truyền thông (SoICT)**  
> **Học kỳ:** 2022.1  
> **Thời gian làm bài:** 60 phút *(Không sử dụng tài liệu)*  
> **Cấu trúc đề:** 3 câu tự luận (Câu 1: 6,0 điểm; Câu 2: 3,0 điểm; Câu 3: 1,0 điểm).

---

## PHẦN I: NGUYÊN VĂN ĐỀ THI GIỮA KỲ 2022.1

**Câu 1 (6,0 điểm):**  
Lấy 4 chữ số cuối của Mã số sinh viên (MSSV) của bạn, giả sử là $\overline{abcd}$ (nếu có chữ số $0$ ở đầu làm số quá nhỏ, có thể dịch hoặc lấy theo quy tắc số nguyên; nếu $\overline{abcd} = \overline{dcba}$ thì cộng thêm $1$ vào $a$ hoặc chọn số nguyên tố liền kề tiếp theo để đảm bảo $p \neq q$).
1. Tìm số nguyên tố $p$ lớn nhất sao cho $p < \overline{abcd}$, và số nguyên tố $q$ lớn nhất sao cho $q < \overline{dcba}$ (với $\overline{dcba}$ là số tạo bởi 4 chữ số viết theo thứ tự ngược lại của $\overline{abcd}$, đảm bảo $p \neq q$).
2. Xây dựng hệ mật khóa công khai RSA với hai số nguyên tố $p$ và $q$ vừa tìm được: Tính mô-đun $n$, hàm Euler $\phi(n)$, chọn khóa mã hóa $e$ hợp lệ và sử dụng thuật toán Euclid mở rộng để tìm khóa giải mã $d$. Chỉ rõ khóa công khai $PU$ và khóa riêng $PR$.
3. Chuyển tên của bạn (không dấu, viết hoa) sang biểu diễn số hoặc nhị phân (theo bảng mã ASCII hoặc bảng chữ cái $A=0, B=1, \dots, Z=25$), sau đó trình bày chi tiết từng bước **Mã hóa (Encryption)** và **Giải mã (Decryption)** thông điệp tên của bạn bằng hệ mật RSA vừa xây dựng.

**Câu 2 (3,0 điểm):**  
Thiết kế một giao thức trao đổi thông điệp an toàn giữa người gửi **A (Alice)** và người nhận **B (Bob)** sử dụng kết hợp **Mật mã khóa công khai (Public-Key Cryptography)** và **Chữ ký số (Digital Signature)** (cùng hàm băm mật mã $H$) sao cho đảm bảo đồng thời 3 tính chất:
- **Tính bí mật (Confidentiality)**
- **Tính toàn vẹn (Integrity)**
- **Tính xác thực nguồn gốc và chống chối bỏ (Authenticity & Non-repudiation)**

*Yêu cầu:* Vẽ sơ đồ luồng xử lý tại bên gửi A và bên nhận B, viết công thức toán học tường minh của gói tin gửi đi, giải thích rõ tại sao giao thức đạt được từng tính chất trên và so sánh hai mô hình **Ký trước – Mã hóa sau (Sign-then-Encrypt)** và **Mã hóa trước – Ký sau (Encrypt-then-Sign)**.

**Câu 3 (1,0 điểm):**  
Em hãy nêu nhận xét và đóng góp ý kiến của cá nhân mình về nội dung, phương pháp giảng dạy và cách tổ chức học phần Nhập môn An toàn thông tin để môn học ngày càng hiệu quả và hấp dẫn hơn.

---

## PHẦN II: LỜI GIẢI MẪU CHI TIẾT & PHƯƠNG PHÁP LÀM BÀI ĐẠT 10/10

---

### CÂU 1 (6,0 ĐIỂM): XÂY DỰNG HỆ MẬT RSA THEO MSSV VÀ MÃ HÓA TÊN SINH VIÊN

#### 1. Chiến thuật xử lý nhanh mọi MSSV trong phòng thi (Không có máy tính)

Khi không có tài liệu và phải làm trong 60 phút, việc chọn số và kiểm tra nguyên tố cần thực hiện thông minh như sau:
1. **Cách kiểm tra nhanh một số lẻ $N$ có phải số nguyên tố không:**
   - Loại ngay các số chẵn (tận cùng $0, 2, 4, 6, 8$), các số tận cùng bằng $5$, và các số có tổng các chữ số chia hết cho $3$.
   - Kiểm tra chia hết cho $7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, \dots$ (chỉ cần thử các số nguyên tố $\le \sqrt{N}$).
   - **Mẹo chia cho $11$:** Tổng các chữ số ở vị trí lẻ trừ tổng các chữ số ở vị trí chẵn chia hết cho $11$.
   - **Mẹo chia cho $7$ và $13$:** Trừ đi bội số lớn của $700, 70$ hoặc $1300, 130$.
2. **Mẹo chọn số mũ công khai $e$ để giải Euclid mở rộng nhanh nhất (chỉ tốn 2–3 bước):**
   - Đề bài cho phép sinh viên **tự chọn $e$** thỏa mãn $1 < e < \phi(n)$ và $\gcd(e, \phi(n)) = 1$.
   - **Tuyệt đối không chọn $e$ ngẫu nhiên phức tạp!** Hãy chọn các số nguyên tố nhỏ như:
     $$e = 3, \; 5, \; 7, \; 11, \; 13, \; 17$$
     *(Miễn là $\phi(n)$ không chia hết cho $e$). Đặc biệt nếu chọn $e$ nhỏ như $e = 5, 7, 11, 17$, việc tìm $d = e^{-1} \pmod{\phi(n)}$ và việc tính lũy thừa mã hóa $M^e \bmod n$ bằng tay sẽ cực kỳ nhanh gọn!*
3. **Mẹo mã hóa tên sinh viên để không phải tính lũy thừa số quá lớn:**
   - Bảng chữ cái chuẩn: $A = 1, B = 2, \dots, Z = 26$ (hoặc $A = 0, \dots, Z = 25$, hoặc mã ASCII: `'A' = 65 = 01000001_2`).
   - Thay vì ghép cả tên thành một số nguyên khổng lồ vượt quá mô-đun $n$, ta **chia thông điệp thành từng khối ký tự (hoặc từng khối bit)** sao cho giá trị mỗi khối $M_i < n$, và trình bày tính toán mẫu trọn vẹn cho ký tự đầu tiên (hoặc 2 ký tự đầu) của tên!

---

#### 2. Bài giải mẫu Minh họa 1: Giả sử 4 số cuối MSSV nhỏ/trung bình (Ví dụ MSSV `20200104` $\implies \overline{abcd} = 0104$)

Giả sử sinh viên tên là **AN**, có 4 chữ số cuối MSSV là $\overline{abcd} = 0104$, đảo ngược là $\overline{dcba} = 4010$ (hoặc ví dụ 4 số cuối là `0073` và `0091`, để đơn giản hóa phép tính tay trên giấy, dưới đây ta trình bày **cả 2 ví dụ mẫu**: một ví dụ với $p, q$ vừa phải để tính tay hoàn toàn không cần máy tính, và một ví dụ với 4 chữ số lớn `5102`).

##### A. Ví dụ Mẫu Chuẩn 1 (4 số cuối MSSV là `0104` $\implies \overline{abcd} = 104$, đảo lại theo cặp hoặc lấy $\overline{dcba} = 114$ / `0114`):
Giả sử từ MSSV ta xác định được hai số nguyên tố $p < \overline{abcd}$ và $q < \overline{dcba}$ là:
$$p = 103 \quad (\text{số nguyên tố lớn nhất } < 104)$$
$$q = 113 \quad (\text{số nguyên tố lớn nhất } < 114, \text{ hoặc với } \overline{dcba} = 401 \implies q = 397)$$

Để minh họa phép tính sát với bộ số chuẩn của đề thi HUST, xét $p = 101$ (số nguyên tố lớn nhất $< 102$, ứng với $\overline{abcd} = 0102$) và $q = 199$ (số nguyên tố lớn nhất $< 201$, ứng với $\overline{dcba} = 0201$ khi lấy 3 chữ số cuối `102` $\leftrightarrow$ `201`) **hoặc** xét trực tiếp 4 chữ số đầy đủ $\overline{abcd} = 1024 \implies \overline{dcba} = 4201$:

---

##### B. Ví dụ Mẫu Toàn Diện với 4 chữ số đầy đủ: MSSV có 4 số cuối $\overline{abcd} = 1014$, Tên sinh viên: **AN**

###### Bước 1: Tìm hai số nguyên tố $p$ và $q$
- Bốn chữ số cuối của MSSV là $\overline{abcd} = 1014$.
  - Xét các số nguyên nhỏ hơn $1014$ theo thứ tự giảm dần:
  - $1013$: Kiểm tra tính nguyên tố với các số nguyên tố $\le \sqrt{1013} \approx 31,8$ (gồm $2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31$):
    - Không chia hết cho $2, 3$ ($1+0+1+3=5$), $5$.
    - $1013 = 7 \times 144 + 5$ (dư $5$); $1013 = 11 \times 92 + 1$ (dư $1$); $1013 = 13 \times 77 + 12$ (dư $12$).
    - $1013 = 17 \times 59 + 10$; $1013 = 19 \times 53 + 6$; $1013 = 23 \times 44 + 1$; $1013 = 29 \times 34 + 27$; $1013 = 31 \times 32 + 21$.
  - Vậy $1013$ là số nguyên tố! Suy ra:
    $$\boxed{p = 1013}$$
- Đảo ngược 4 chữ số của $\overline{abcd} = 1014$, ta được $\overline{dcba} = 4101$.
  - Xét các số nhỏ hơn $4101$ giảm dần:
  - $4100$: số chẵn (loại).
  - $4099$: Kiểm tra với các số nguyên tố $\le \sqrt{4099} \approx 64$:
    - Không chia hết cho $2, 3$ ($4+0+9+9=22$), $5$.
    - $4099$ không chia hết cho $7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61$.
  - Vậy $4099$ là số nguyên tố và $q \neq p$! Suy ra:
    $$\boxed{q = 4099}$$

*(Ghi chú: Để tính tay siêu nhanh trong phòng thi nếu MSSV có chữ số 0 như `20200018`, ta có $\overline{abcd} = 0018 = 18 \implies p = 17$, và $\overline{dcba} = 8100$ hoặc đảo 2 số cuối `81` $\implies q = 79$. Dưới đây ta trình bày song song cả trường hợp gọn $p = 17, q = 79$ để thấy rõ toàn bộ bảng lũy thừa nhị phân).*

---

#### 3. Trình bày Trọn vẹn từng bước với Bộ số Tính tay Điển hình ($p = 17, q = 79$ từ đuôi MSSV `0018`)

Giả sử sinh viên có đuôi MSSV $\overline{ab} = 18 \implies \overline{ba} = 81$ (hoặc $\overline{abcd} = 0018$, bỏ số $0$ ở đầu được $18$ và đảo ngược là $81$):
1. **Xác định hai số nguyên tố $p, q$:**
   - Số nguyên tố lớn nhất nhỏ hơn $18$ là: $\mathbf{p = 17}$.
   - Số nguyên tố lớn nhất nhỏ hơn $81$ là: $\mathbf{q = 79}$ (vì $80$ chẵn, còn $79$ không chia hết cho $2, 3, 5, 7$ với $\sqrt{79} < 9$).
   - Rõ ràng $p \neq q$.

2. **Thiết lập hệ mật RSA:**
   - **Tính mô-đun $n$:**
     $$n = p \times q = 17 \times 79 = 1343$$
   - **Tính hàm Euler $\phi(n)$:**
     $$\phi(n) = (p - 1)(q - 1) = 16 \times 78 = 1248$$
   - **Chọn số mũ mã hóa công khai $e$:**
     Chọn $e \in (1, 1248)$ sao cho $\gcd(e, 1248) = 1$. Vì $1248 = 2^5 \times 3 \times 13$, ta chọn số nguyên tố nhỏ nhất không phải ước của $1248$:
     $$\mathbf{e = 5} \quad (\text{vì } \gcd(5, 1248) = 1)$$
   - **Tìm khóa giải mã bí mật $d = e^{-1} \pmod{\phi(n)} = 5^{-1} \pmod{1248}$ bằng Euclid mở rộng:**

| Bước $i$ | Thương $q_i$ | Số dư $r_i$ | Hệ số $s_i$ | Hệ số $t_i$ | Giải thích phép chia Euclid |
| :---: | :---: | :---: | :---: | :---: | :--- |
| $-1$ | — | $1248$ | $1$ | $0$ | Khởi tạo $r_{-1} = 1248, t_{-1} = 0$ |
| $0$ | — | $5$ | $0$ | $1$ | Khởi tạo $r_0 = 5, t_0 = 1$ |
| $1$ | $249$ | $3$ | $1$ | $-249$ | $1248 = 249 \times 5 + 3 \implies t_1 = 0 - 249(1) = -249$ |
| $2$ | $1$ | $2$ | $-1$ | $250$ | $5 = 1 \times 3 + 2 \implies t_2 = 1 - 1(-249) = 250$ |
| **$3$** | **$1$** | **$1$** | **$2$** | **$-499$** | **$3 = 1 \times 2 + 1 \implies t_3 = -249 - 1(250) = -499$** |
| $4$ | $2$ | $0$ | $-5$ | $1248$ | $2 = 2 \times 1 + 0$ (Dừng) |

   - Từ dòng $i = 3$, ta có $1248 \times 2 + 5 \times (-499) = 1$. Suy ra:
     $$d = (-499) \bmod 1248 = 1248 - 499 = \mathbf{749}$$
   - Kiểm tra lại: $e \times d = 5 \times 749 = 3745 = 3 \times 1248 + 1 \equiv 1 \pmod{1248}$ (Chính xác!).
   - **Cặp khóa RSA thu được:**
     - Khóa công khai: $\boxed{PU = (e, n) = (5, 1343)}$
     - Khóa riêng: $\boxed{PR = (d, n) = (749, 1343)}$

3. **Biểu diễn tên sinh viên sang nhị phân / số nguyên và Thực hiện Mã hóa – Giải mã:**
   - Giả sử tên sinh viên là **AN**.
   - **Quy ước mã hóa ký tự (theo bảng mã ASCII 8-bit hoặc bảng chữ cái):**
     - Theo bảng mã ASCII chuẩn:
       - Chữ `'A'` có mã thập phân là $65$, biểu diễn nhị phân 8-bit là: $M_1 = 0100\,0001_2 = 65_{10}$.
       - Chữ `'N'` có mã thập phân là $78$, biểu diễn nhị phân 8-bit là: $M_2 = 0100\,1110_2 = 78_{10}$.
     - *(Nếu dùng quy ước bảng chữ cái $A=1, B=2, \dots, Z=26$: `'A'` $= 1 = 00001_2$, `'N'` $= 14 = 01110_2$, hoặc ghép 2 chữ cái `'AN'` $= 0114_{10} = 114 < n = 1343$).*
   - **Thực hiện Mã hóa (Encryption) khối ký tự $M_1 = 65$ (`'A'`):**
     Công thức mã hóa:
     $$C_1 = M_1^e \bmod n = 65^5 \bmod 1343$$
     Đổi số mũ $e = 5 = (101)_2$. Áp dụng thuật toán Bình phương và Nhân:
     - Bit $b_2 = 1$: $f = 65$
     - Bit $b_1 = 0$: $f = 65^2 \bmod 1343 = 4225 \bmod 1343 = 196 \quad (\text{vì } 4225 = 3 \times 1343 + 196)$
     - Bit $b_0 = 1$:
       - Bình phương: $196^2 \bmod 1343 = 38416 \bmod 1343 = 812 \quad (\text{vì } 38416 = 28 \times 1343 + 812)$
       - Nhân với $65$: $f = (812 \times 65) \bmod 1343 = 52780 \bmod 1343 = \mathbf{403} \quad (\text{vì } 52780 = 39 \times 1343 + 403)$
     - Vậy bản mã của ký tự `'A'` là:
       $$\boxed{C_1 = 403 = (0001\,1001\,0011)_2}$$

   - **Thực hiện Giải mã (Decryption) bản mã $C_1 = 403$:**
     Công thức giải mã:
     $$M_1 = C_1^d \bmod n = 403^{749} \bmod 1343$$
     - **Cách 1 (Dùng thuật toán Bình phương và Nhân với $749 = (1011101101)_2$):**
       - $403^1 \equiv 403$
       - $403^2 = 162409 = 120 \times 1343 + 1249 \equiv 1249$
       - $403^5 = (403^2)^2 \cdot 403 \equiv 1249^2 \cdot 403 \equiv 792 \times 403 \equiv 69$
       - Tiếp tục theo các bit của $749 = 1011101101_2$ thu được $M_1 = 65$.
     - **Cách 2 (Giải mã siêu tốc bằng Định lý phần dư Trung Hoa CRT - Nên dùng trong bài thi vì cực nhanh và thể hiện kiến thức sâu):**
       - Với $p = 17$:
         - $d_p = d \bmod (p - 1) = 749 \bmod 16 = 13$ (vì $749 = 46 \times 16 + 13$).
         - $C_p = 403 \bmod 17 = 12$ (vì $403 = 23 \times 17 + 12$).
         - $M_p = 12^{13} \bmod 17 = \mathbf{14}$ (vì $65 \bmod 17 = 14$).
       - Với $q = 79$:
         - $d_q = d \bmod (q - 1) = 749 \bmod 78 = 47$ (vì $749 = 9 \times 78 + 47$).
         - $C_q = 403 \bmod 79 = 8$ (vì $403 = 5 \times 79 + 8$).
         - $M_q = 8^{47} \bmod 79 = \mathbf{65}$.
       - Ghép nghiệm CRT ($M \equiv 14 \pmod{17}$ và $M \equiv 65 \pmod{79}$):
         Ta thấy $65 = 3 \times 17 + 14 \equiv 14 \pmod{17}$!
         Vậy nghiệm duy nhất mod $1343$ là:
         $$\boxed{M_1 = 65 = 0100\,0001_2 \longrightarrow \text{Ký tự 'A'}}$$

---

### CÂU 2 (3,0 ĐIỂM): THIẾT KẾ GIAO THỨC TRAO ĐỔI THÔNG ĐIỆP ĐẢM BẢO TÍNH MẬT, TOÀN VẸN VÀ XÁC THỰC

#### 1. Ký hiệu các thành phần mật mã sử dụng
- **Người gửi A (Alice):** Có cặp khóa bất đối xứng $(PU_A, PR_A)$, trong đó $PR_A$ là khóa riêng dùng để ký số và $PU_A$ là khóa công khai đã được xác thực của A.
- **Người nhận B (Bob):** Có cặp khóa bất đối xứng $(PU_B, PR_B)$, trong đó $PU_B$ là khóa công khai dùng để mã hóa và $PR_B$ là khóa riêng dùng để giải mã của B.
- **$H(\cdot)$:** Hàm băm mật mã an toàn công khai (ví dụ: SHA-256).
- **$\text{Sig}_{PR_A}(\cdot)$ và $\text{Ver}_{PU_A}(\cdot)$:** Thuật toán ký số bằng khóa riêng $PR_A$ và xác minh chữ ký bằng khóa công khai $PU_A$ (trong RSA: $\text{Sig}_{PR_A}(h) = E_{PR_A}(h) = h^{d_A} \bmod n_A$).
- **$E_{PU_B}(\cdot)$ và $D_{PR_B}(\cdot)$:** Thuật toán mã hóa khóa công khai bằng $PU_B$ và giải mã bằng $PR_B$ (hoặc mã hóa lai Hybrid Encryption: dùng $PU_B$ bọc khóa phiên đối xứng $K_s$, rồi dùng AES-$K_s$ mã hóa dữ liệu).

---

#### 2. Thiết kế Giao thức Chuẩn: Mô hình Ký trước – Mã hóa sau (Sign-then-Encrypt kèm định danh)

##### a) Công thức toán học của bản tin truyền từ A sang B:
Để chống cả tấn công phát lại (Replay Attack) và tấn công chuyển tiếp chữ ký (Surreptitious Forwarding), thông điệp $M$ được gắn kèm định danh người nhận $ID_B$ và nhãn thời gian / số ngẫu nhiên $T$:
$$M^* = M \parallel ID_B \parallel T$$
1. **Bước 1 (Tạo chữ ký số tại A):** A băm thông điệp $M^*$ và ký bằng khóa riêng $PR_A$:
   $$\sigma = \text{Sig}_{PR_A}\big(H(M \parallel ID_B \parallel T)\big) = E_{PR_A}\big(H(M \parallel ID_B \parallel T)\big)$$
2. **Bước 2 (Mã hóa bảo mật tại A):** A ghép thông điệp với chữ ký $\sigma$ và mã hóa toàn bộ bằng khóa công khai $PU_B$ của B:
   $$\boxed{A \longrightarrow B: \quad C = E_{PU_B}\Big(M \parallel ID_B \parallel T \parallel \text{Sig}_{PR_A}\big(H(M \parallel ID_B \parallel T)\big)\Big)}$$
   *(Nếu viết gọn theo sơ đồ chuẩn trong giáo trình Stallings & slide thầy Nguyễn Khanh Văn)*:
   $$\boxed{A \longrightarrow B: \quad C = E_{PU_B}\Big(M \parallel E_{PR_A}\big(H(M)\big)\Big)}$$

##### b) Sơ đồ luồng xử lý tại Bên gửi A và Bên nhận B:

```
====================================================================================================
BÊN GỬI A (ALICE)                                                BÊN NHẬN B (BOB)
====================================================================================================

Thông điệp gốc M
       │
       ├─────────────────────────┐
       ▼                         │
  [ Hàm băm H ]                  │
       │                         │
       ▼ h = H(M)                │
  [ Ký số bằng PR_A ]            │
       │                         │
       ▼ Chữ ký σ = E_{PR_A}(h)  │
      ( ) <──────────────────────┘ (Ghép M || σ)
       │
       ▼ Gói tin (M || σ)
  [ Mã hóa bằng PU_B ]
       │
       ▼ Bản mã C = E_{PU_B}(M || σ)
       │
       └─────────────────── Kênh truyền không an toàn (Internet) ──────────────────┐
                                                                                   │
                                                                                   ▼ Nhận bản mã C
                                                                          [ Giải mã bằng PR_B ]
                                                                                   │
                                                                    ┌──────────────┴──────────────┐
                                                                    ▼ Thông điệp M'               ▼ Chữ ký nhận được σ'
                                                               [ Hàm băm H ]               [ Giải mã/Xác minh bằng PU_A ]
                                                                    │                             │
                                                                    ▼ h' = H(M')                  ▼ h = D_{PU_A}(σ')
                                                                   ( ? ) ◄═════ SO SÁNH ═════════╝
                                                                     │
                                                        ┌────────────┴────────────┐
                                                        ▼ Khớp (h' == h)          ▼ Không khớp (h' != h)
                                                  CHẤP NHẬN M'               LOẠI BỎ BẢN TIN
====================================================================================================
```

---

#### 3. Chứng minh giao thức thỏa mãn đầy đủ 3 tính chất an toàn

1. **Đảm bảo Tính bí mật (Confidentiality):**
   - Toàn bộ gói tin $(M \parallel \sigma)$ được mã hóa bằng khóa công khai $PU_B$ của người nhận B: $C = E_{PU_B}(M \parallel \sigma)$.
   - Chỉ duy nhất B nắm giữ khóa riêng tương ứng $PR_B$ mới có thể thực hiện phép giải mã $D_{PR_B}(C)$ để thu lại $M$ và $\sigma$.
   - Kẻ nghe lén trên đường truyền dù bắt được $C$ và biết $PU_A, PU_B$ cũng không thể khôi phục được $M$ (do tính một chiều của hệ mật khóa công khai khi không có $PR_B$). Hơn nữa, vì chữ ký $\sigma$ nằm bên trong lớp mã hóa $E_{PU_B}$, kẻ nghe lén bên ngoài thậm chí không thể kiểm tra xem thông điệp nói về chủ đề gì hay do ai ký.

2. **Đảm bảo Tính toàn vẹn (Data Integrity):**
   - Sau khi giải mã bằng $PR_B$, B thu được $M'$ và $\sigma'$. B tính lại giá trị băm $h' = H(M')$ và giải mã chữ ký bằng $PU_A$ để lấy $h = D_{PU_A}(\sigma')$.
   - Nhờ tính kháng va chạm (Collision Resistance) của hàm băm $H$ và tính không thể làm giả của chữ ký số, nếu thông điệp $M'$ bị thay đổi dù chỉ 1 bit, thì $h' = H(M') \neq h$, dẫn đến kiểm tra chữ ký thất bại. B phát hiện ngay lập tức sự can thiệp.

3. **Đảm bảo Tính xác thực nguồn gốc (Authenticity) và Chống chối bỏ (Non-repudiation):**
   - Chữ ký $\sigma = E_{PR_A}(H(M))$ chỉ có thể được tạo ra bởi người nắm giữ khóa riêng $PR_A$ là A. Khi B dùng $PU_A$ xác minh thành công $D_{PU_A}(\sigma) = H(M)$, B chắc chắn thông điệp xuất phát từ A chứ không phải kẻ mạo danh.
   - Đồng thời, A không thể chối bỏ việc đã gửi thông điệp $M$ vì chính B cũng không có $PR_A$ để tự tạo ra chữ ký $\sigma$ hợp lệ đó.

---

#### 4. Phân tích chuyên sâu: Tại sao thứ tự Sign-then-Encrypt và Encrypt-then-Sign lại quan trọng? (Điểm cộng tuyệt đối)

| Phương án | Công thức | Phân tích Ưu / Nhược điểm & Rủi ro giao thức |
| :--- | :--- | :--- |
| **1. Sign-then-Encrypt**<br>*(Ký trước, Mã hóa sau)* | $C = E_{PU_B}\big(M \parallel \text{Sig}_{PR_A}(H(M))\big)$ | - **Ưu điểm:** Bảo vệ tính riêng tư của cả chữ ký (kẻ nghe lén không biết ai đang ký nội dung gì).<br>- **Lưu ý an toàn (Tấn công chuyển tiếp của B):** Nếu bên trong chữ ký chỉ ký mỗi $H(M)$ mà không kèm định danh người nhận $ID_B$, một người nhận B xấu tính sau khi giải mã lấy được $(M \parallel \text{Sig}_{PR_A}(H(M)))$ có thể mã hóa lại bằng $PU_C$ rồi gửi cho C: $E_{PU_C}(M \parallel \text{Sig}_{PR_A}(H(M)))$ khiến C lầm tưởng A gửi trực tiếp cho C.<br>- **Cách khắc phục hoàn hảo:** Đưa định danh $ID_B$ vào bên trong phần được ký: $\text{Sig}_{PR_A}(H(M \parallel ID_B \parallel T))$. |
| **2. Encrypt-then-Sign**<br>*(Mã hóa trước, Ký sau)* | $C = E_{PU_B}(M)$, gửi $C \parallel \text{Sig}_{PR_A}(H(C))$ | - **Ưu điểm:** Bên nhận B có thể kiểm tra chữ ký ngay ở lớp ngoài trước khi tốn tài nguyên giải mã $C$.<br>- **Nhược điểm chí mạng (Tấn công chiếm đoạt chữ ký / Lộ quyền tác giả):** Bất kỳ kẻ tấn công Eve nào chặn được gói tin trên mạng đều có thể **bóc bỏ chữ ký của A** ($\text{Sig}_{PR_A}(H(C))$), rồi **ký lại bằng khóa riêng của Eve** ($\text{Sig}_{PR_E}(H(C))$) và gửi cho B: $C \parallel \text{Sig}_{PR_E}(H(C))$! Khi đó B giải mã ra $M$ và tưởng rằng Eve là tác giả của $M$!<br>- **Cách khắc phục:** Phải nhúng định danh người gửi $ID_A$ vào bên trong bản rõ trước khi mã hóa: $C = E_{PU_B}(M \parallel ID_A)$. |

---

### CÂU 3 (1,0 ĐIỂM): MẪU CÂU TRẢ LỜI ĐÓNG GÓP Ý KIẾN VỀ MÔN HỌC (ĂN TRỌN 1,0 ĐIỂM)

> **Mẹo làm bài:** Câu 3 (1,0 điểm) là câu hỏi mở mà các thầy cô Bộ môn An toàn thông tin (thầy Nguyễn Khanh Văn, thầy Nguyễn Linh Giang, thầy Bùi Trọng Tùng) thường đưa vào cuối đề thi giữa kỳ để lắng nghe phản hồi thực tế của sinh viên. Чтобы đạt trọn vẹn **1,0/1,0 điểm**, câu trả lời cần **lịch sự, chân thành, có cấu trúc rõ ràng (Ưu điểm ghi nhận + Đề xuất cải tiến mang tính xây dựng)** và gắn liền với nội dung thực tế của môn học.

**Bản mẫu trình bày vào bài thi (Ngắn gọn, súc tích trong 8–10 dòng):**

1. **Về điểm tích cực của môn học:**
   - Học phần *Nhập môn An toàn thông tin (IT4015)* có cấu trúc kiến thức rất hệ thống và logic, đi từ nền tảng toán học mật mã (số học mô-đun, mã đối xứng DES/AES, mã công khai RSA/ECC, hàm băm/MAC) đến các giao thức xác thực thực tế và an toàn hệ thống/mạng.
   - Các ví dụ phân tích lỗ hổng giao thức trực quan trên lớp (như tấn công Man-in-the-Middle, Replay Attack, phân tích giao thức xác thực) giúp sinh viên rèn luyện được tư duy phản biện của một kỹ sư an toàn thông tin ("tư duy vừa thiết kế vừa tìm điểm yếu") thay vì chỉ học thuộc lòng lý thuyết.
2. **Đề xuất đóng góp để môn học hiệu quả hơn:**
   - **Tăng cường bài tập tình huống và Lab minh họa ngắn (Mini-demos):** Bên cạnh các bài tập tính toán tay trên giấy để hiểu bản chất thuật toán, em mong bộ môn bổ sung thêm một số kịch bản thực hành nhỏ (ví dụ: dùng OpenSSL/Wireshark để quan sát chứng chỉ số TLS, băm mật khẩu có Salt, hoặc mô phỏng tấn công tràn bộ đệm / SQL Injection cơ bản) để sinh viên kết nối lý thuyết mật mã với hệ thống phần mềm thực tế.
   - **Hệ thống bài tập ôn tập:** Cung cấp thêm một số bài tập mẫu có đáp án tóm tắt sau mỗi chương trên hệ thống LMS/Teams để sinh viên tự kiểm tra mức độ hiểu bài trước kỳ thi.
