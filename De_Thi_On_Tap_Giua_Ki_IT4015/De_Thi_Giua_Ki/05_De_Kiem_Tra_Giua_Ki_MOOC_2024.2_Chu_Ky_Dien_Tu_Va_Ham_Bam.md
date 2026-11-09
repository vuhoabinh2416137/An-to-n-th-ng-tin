# ĐỀ KIỂM TRA GIỮA KỲ MOOC IT4015 (2024.2 / 2025.1) — HỆ THỐNG SOICT.DAOTAO.AI
## Chủ đề: Mật Mã Cổ Điển, Lý Thuyết Số, Hàm Băm & Chữ Ký Điện Tử

> **Thông tin bài thi:**
> - **Học phần:** Nhập môn An toàn thông tin (`IT4015`) — Trường CNTT&TT (SoICT), ĐH Bách Khoa Hà Nội (HUST)
> - **Nền tảng thi:** Hệ thống LMS/MOOC `soict.daotao.ai`
> - **Thời gian làm bài:** 45 – 60 phút
> - **Cấu trúc đề:** Kết hợp **Câu hỏi tính toán điền đáp số cá nhân hóa theo MSSV** (Phần I) và **Câu hỏi trắc nghiệm lý thuyết chuyên sâu** (Phần II).

---

## PHẦN I: CÁC BÀI TOÁN TÍNH TOÁN CÁ NHÂN HÓA THEO MSSV (ĐIỀN SỐ)

### Câu 1 (Bài toán kinh điển): Tối ưu chi phí đầu tư chip băm phần cứng **Scorpion-$i$**

#### Đề bài chuẩn trên MOOC
Một công ty an ninh mạng cần triển khai hệ thống kiểm tra tính toàn vẹn cho luồng dữ liệu mạng tốc độ cao đi qua cổng Gateway. Hệ thống yêu cầu hàm băm mật mã có kích thước đầu ra phụ thuộc vào mã số sinh viên (MSSV) của bạn như sau:
- Gọi $X$ là **2 chữ số cuối của MSSV** (ví dụ MSSV `20225432` $\implies X = 32$).
- Đặt $Y = X \pmod 4$ (tức là số dư khi chia $X$ cho $4$, do đó $Y \in \{0, 1, 2, 3\}$).
- Kích thước giá trị băm yêu cầu là:
  $$L_{\text{hash}} = (Y + 2) \times 16 \text{ (bit)}$$

Luồng dữ liệu cần băm có lưu lượng trung bình là **$4\text{ GB/giờ}$** (tính theo chuẩn nhị phân: $1\text{ GB} = 2^{30}\text{ bytes}$). Trước khi đưa vào bộ băm, dữ liệu được cắt thành các gói tin (blocks/packets) có kích thước cố định là **$512\text{ bytes}$**, và **mỗi gói tin $512\text{ bytes}$ cần thực hiện đúng $1$ phép băm (1 hash operation)** độc lập. Hệ thống phải xử lý **theo thời gian thực (real-time)** mà không làm nghẽn cổ chai.

Hiện tại, nhà cung cấp phần cứng mật mã chào hàng dòng chip chuyên dụng **Scorpion-$i$** (với $i \in \{1, 2, 3, 4, 5\}$) có thông số kỹ thuật như sau:
1. **Độ dài đầu ra băm hỗ trợ tối đa:** Chip **Scorpion-$i$** hỗ trợ phần cứng cho các hàm băm có kích thước đầu ra tối đa là $16 \times (i + 1)\text{ bit}$ (tức là để tạo ra chuỗi băm $(Y + 2) \times 16\text{ bit}$, bắt buộc phải chọn chip có chỉ số thế hệ $i \ge Y + 1$, hoặc có thể ghép nối song song các chip thỏa mãn điều kiện độ dài băm để cộng dồn tốc độ xử lý).
2. **Tốc độ xử lý của 1 chip Scorpion-$i$:** Đạt đúng **$10^i$ phép băm/giây** ($\text{hashes/sec}$).
3. **Đơn giá của 1 chip Scorpion-$i$:** Có 2 biến thể đề trên MOOC tùy ca thi:
   - **Biến thể A (Hàm mũ):** Giá của 1 chip Scorpion-$i$ là $C_A(i) = \dfrac{i^i}{2} \times \$1,000$.
   - **Biến thể B (Tuyến tính):** Giá của 1 chip Scorpion-$i$ là $C_B(i) = i \times \$1,000$.

**Yêu cầu:**
1. Tính chính xác số lượng phép băm hệ thống cần thực hiện trong **1 giây** ($R_{\text{req}}$).
2. Với từng giá trị $Y \in \{0, 1, 2, 3\}$, hãy lập bảng phương án mua chip **Scorpion-$i$** (chọn loại chip $i$ nào, số lượng $N_i$ bao nhiêu chip) để vừa đáp ứng yêu cầu độ dài băm $L_{\text{hash}}$, vừa đảm bảo tổng tốc độ $\ge R_{\text{req}}$, đồng thời **tổng chi phí đầu tư là nhỏ nhất**.

---

#### Lời giải & Phân tích chi tiết từng bước

##### Bước 1: Tính lưu lượng gói tin và tốc độ băm yêu cầu mỗi giây ($R_{\text{req}}$)
- Tổng dung lượng dữ liệu đi qua hệ thống trong 1 giờ:
  $$D_{\text{giờ}} = 4\text{ GB} = 4 \times 2^{30}\text{ bytes} = 2^2 \times 2^{30}\text{ bytes} = 2^{32}\text{ bytes/giờ}$$
- Kích thước mỗi gói dữ liệu cần thực hiện 1 phép băm:
  $$S_{\text{gói}} = 512\text{ bytes} = 2^9\text{ bytes/gói}$$
- Tổng số gói tin (tương ứng tổng số phép băm) cần xử lý trong **1 giờ** ($3600\text{ giây}$):
  $$N_{\text{băm/giờ}} = \frac{D_{\text{giờ}}}{S_{\text{gói}}} = \frac{2^{32}}{2^9} = 2^{23}\text{ phép băm/giờ} = 8,388,608\text{ phép băm/giờ}$$
- Số phép băm cần thực hiện trong **1 giây** ($R_{\text{req}}$):
  $$R_{\text{req}} = \frac{2^{23}}{3600} = \frac{8,388,608}{3,600} \approx \mathbf{2,330.1689\text{ phép băm/giây}}$$

> **Kết luận quan trọng 1:** Để hệ thống xử lý thời gian thực không bị trễ, tổng năng lực xử lý của hệ thống chip phải đạt tối thiểu:
> $$R_{\text{total}} \ge 2,330.17\text{ hashes/sec} \implies \text{Tối thiểu } \mathbf{2,331\text{ phép băm/giây}}$$

---

##### Bước 2: Phân tích thông số kỹ thuật và đơn giá của từng dòng chip Scorpion-$i$

Ta lập bảng thông số của 5 đời chip **Scorpion-$i$** ($i = 1, 2, 3, 4, 5$):

| Dòng chip ($i$) | Độ dài băm hỗ trợ $16(i+1)$ | Tốc độ 1 chip ($10^i$ băm/s) | Số chip cần để đạt $\ge 2,330.17$ băm/s ($N_i = \lceil 2330.17 / 10^i \rceil$) | Đơn giá 1 chip Biến thể A ($\frac{i^i}{2} \times \$1000$) | Tổng chi phí Biến thể A ($N_i \times C_A(i)$) | Đơn giá 1 chip Biến thể B ($i \times \$1000$) | Tổng chi phí Biến thể B ($N_i \times C_B(i)$) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **Scorpion-1** ($i=1$) | $32\text{ bit}$ | $10^1 = 10\text{ băm/s}$ | $\lceil 233.017 \rceil = \mathbf{234}\text{ chip}$ | $\$500$ ($0.5\text{k}$) | $234 \times \$500 = \mathbf{\$117,000}$ | $\$1,000$ | $234 \times \$1,000 = \mathbf{\$234,000}$ |
| **Scorpion-2** ($i=2$) | $48\text{ bit}$ | $10^2 = 100\text{ băm/s}$ | $\lceil 23.3017 \rceil = \mathbf{24}\text{ chip}$ | $\$2,000$ ($2\text{k}$) | $24 \times \$2,000 = \mathbf{\$48,000}$ | $\$2,000$ | $24 \times \$2,000 = \mathbf{\$48,000}$ |
| **Scorpion-3** ($i=3$) | $64\text{ bit}$ | $10^3 = 1,000\text{ băm/s}$ | $\lceil 2.33017 \rceil = \mathbf{3}\text{ chip}$ | $\$13,500$ ($13.5\text{k}$) | $3 \times \$13,500 = \mathbf{\$40,500}$ | $\$3,000$ | $3 \times \$3,000 = \mathbf{\$9,000}$ |
| **Scorpion-4** ($i=4$) | $80\text{ bit}$ | $10^4 = 10,000\text{ băm/s}$ | $\lceil 0.233017 \rceil = \mathbf{1}\text{ chip}$ | $\$128,000$ ($128\text{k}$) | $1 \times \$128,000 = \mathbf{\$128,000}$ | $\$4,000$ | $1 \times \$4,000 = \mathbf{\$4,000}$ |
| **Scorpion-5** ($i=5$) | $96\text{ bit}$ | $10^5 = 100,000\text{ băm/s}$ | $\lceil 0.0233017 \rceil = \mathbf{1}\text{ chip}$ | $\$1,562,500$ ($1562.5\text{k}$) | $1 \times \$1,562,500 = \mathbf{\$1,562,500}$ | $\$5,000$ | $1 \times \$5,000 = \mathbf{\$5,000}$ |

*(Lưu ý: Nếu đề bài chỉ cho phép mua **duy nhất 1 con chip đơn lẻ** không được ghép song song nhiều chip cùng loại, thì bắt buộc tốc độ của 1 con chip phải $\ge 2,330.17\text{ băm/s} \implies 10^i \ge 2330.17 \implies i \ge 4$, tức là phải mua ít nhất **1 chip Scorpion-4**).*

---

##### Bước 3: Bảng tra cứu đáp án nhanh theo $Y = (\text{2 số cuối MSSV}) \pmod 4$

Tùy theo cấu trúc câu hỏi trong ca thi của bạn thuộc **Trường hợp 1 (Chỉ dùng 1 chip duy nhất)** hay **Trường hợp 2 (Được phép ghép song song nhiều chip cùng loại)**, hãy tra bảng dưới đây:

###### BẢNG 3.1: Trường hợp hệ thống chỉ lắp **DUY NHẤT 1 CHIP** ($10^i \ge 2330.17 \implies i \ge 4$ và $i \ge Y+1$)

| Giá trị $Y = X \pmod 4$ | Kích thước băm yêu cầu $L = (Y+2)\times 16$ | Điều kiện độ dài băm ($i \ge Y+1$) | Điều kiện tốc độ 1 chip ($10^i \ge 2330.17$) | Chip tối ưu được chọn | Chi phí Biến thể A ($\frac{i^i}{2}\times \$1000$) | Chi phí Biến thể B ($i \times \$1000$) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **$Y = 0$** (VD: MSSV đuôi `00, 04, 08, 12...`) | $32\text{ bit}$ | $i \ge 1$ | $i \ge 4$ | **1 chip Scorpion-4** ($i=4$) | **$\$128,000$** (hoặc `128` nghìn USD) | **$\$4,000$** (hoặc `4` nghìn USD) |
| **$Y = 1$** (VD: MSSV đuôi `01, 05, 09, 13...`) | $48\text{ bit}$ | $i \ge 2$ | $i \ge 4$ | **1 chip Scorpion-4** ($i=4$) | **$\$128,000$** (hoặc `128` nghìn USD) | **$\$4,000$** (hoặc `4` nghìn USD) |
| **$Y = 2$** (VD: MSSV đuôi `02, 06, 10, 14...`) | $64\text{ bit}$ | $i \ge 3$ | $i \ge 4$ | **1 chip Scorpion-4** ($i=4$) | **$\$128,000$** (hoặc `128` nghìn USD) | **$\$4,000$** (hoặc `4` nghìn USD) |
| **$Y = 3$** (VD: MSSV đuôi `03, 07, 11, 15...`) | $80\text{ bit}$ | $i \ge 4$ | $i \ge 4$ | **1 chip Scorpion-4** ($i=4$) | **$\$128,000$** (hoặc `128` nghìn USD) | **$\$4,000$** (hoặc `4` nghìn USD) |

###### BẢNG 3.2: Trường hợp được phép **GHÉP SONG SONG NHIỀU CHIP** (Tối ưu hóa tổng chi phí)

| Giá trị $Y = X \pmod 4$ | Kích thước băm $L = (Y+2)\times 16$ | Các dòng chip hợp lệ ($i \ge Y+1$) | Phương án tối ưu theo **Biến thể A** ($C_A(i) = \frac{i^i}{2}\text{k}$) | Phương án tối ưu theo **Biến thể B** ($C_B(i) = i\text{k}$) | Phương án nếu cố định dùng đúng dòng chip $i = Y+1$ |
| :---: | :---: | :---: | :--- | :--- | :--- |
| **$Y = 0$** | $32\text{ bit}$ | $i \in \{1, 2, 3, 4, 5\}$ | **3 chip Scorpion-3** (Tổng tốc độ $3000\text{ h/s}$, Chi phí = **$\$40,500$**) | **1 chip Scorpion-4** (Tốc độ $10,000\text{ h/s}$, Chi phí = **$\$4,000$**) | Dùng **Scorpion-1** ($i=1$): Cần **234 chip**, giá A = **$\$117,000$**, giá B = **$\$234,000$** |
| **$Y = 1$** | $48\text{ bit}$ | $i \in \{2, 3, 4, 5\}$ | **3 chip Scorpion-3** (Tổng tốc độ $3000\text{ h/s}$, Chi phí = **$\$40,500$**) | **1 chip Scorpion-4** (Tốc độ $10,000\text{ h/s}$, Chi phí = **$\$4,000$**) | Dùng **Scorpion-2** ($i=2$): Cần **24 chip**, giá A = **$\$48,000$**, giá B = **$\$48,000$** |
| **$Y = 2$** | $64\text{ bit}$ | $i \in \{3, 4, 5\}$ | **3 chip Scorpion-3** (Tổng tốc độ $3000\text{ h/s}$, Chi phí = **$\$40,500$**) | **1 chip Scorpion-4** (Tốc độ $10,000\text{ h/s}$, Chi phí = **$\$4,000$**) | Dùng **Scorpion-3** ($i=3$): Cần **3 chip**, giá A = **$\$40,500$**, giá B = **$\$9,000$** |
| **$Y = 3$** | $80\text{ bit}$ | $i \in \{4, 5\}$ | **1 chip Scorpion-4** (Tổng tốc độ $10,000\text{ h/s}$, Chi phí = **$\$128,000$**) | **1 chip Scorpion-4** (Tốc độ $10,000\text{ h/s}$, Chi phí = **$\$4,000$**) | Dùng **Scorpion-4** ($i=4$): Cần **1 chip**, giá A = **$\$128,000$**, giá B = **$\$4,000$** |

> **Mẹo kiểm tra nhanh trên MOOC:**
> Đề bài trên `soict.daotao.ai` thường gán cứng loại chip phải dùng theo $Y$ là $i = Y + 1$ (tức là $Y=0 \implies \text{Scorpion-1}$, $Y=1 \implies \text{Scorpion-2}$, $Y=2 \implies \text{Scorpion-3}$, $Y=3 \implies \text{Scorpion-4}$). Khi đó bạn chỉ cần nhìn cột cuối cùng của **Bảng 3.2** là có ngay số chip cần mua ($234, 24, 3, 1$) và tổng số tiền tương ứng!

---

### Câu 2: Bài toán tính hàm Euler $\phi(n)$ nâng cao

#### Đề bài chuẩn trên MOOC
Cho hai số nguyên tố phân biệt $p$ và $q$ (được lấy từ MSSV hoặc cho trước). Hãy tính giá trị của hàm phi Euler $\phi(n)$ trong các trường hợp sau:
1. **Dạng 1 (Cơ bản trong RSA):** $n = p \cdot q$.
2. **Dạng 2 (Lũy thừa số nguyên tố đơn):** $n = p^k$ (với $k \ge 1$).
3. **Dạng 3 (Bình phương tích hai số nguyên tố — Rất hay bẫy trên MOOC):** $n = p^2 \cdot q^2$.
4. **Dạng 4 (Hợp số bất kỳ):** Tính $\phi(26)$, $\phi(29)$, $\phi(1000)$, $\phi(240)$.

---

#### Lời giải & Công thức tổng quát

##### 1. Định nghĩa và Công thức gốc của hàm Euler $\phi(n)$
Hàm $\phi(n)$ đếm số lượng các số nguyên dương $a \in \{1, 2, \dots, n\}$ nguyên tố cùng nhau với $n$, tức là $\gcd(a, n) = 1$.

Nếu phân tích $n$ ra thừa số nguyên tố dạng chính tắc:
$$n = p_1^{k_1} \cdot p_2^{k_2} \cdots p_r^{k_r}$$
thì công thức tổng quát tính $\phi(n)$ là:
$$\phi(n) = \prod_{i=1}^{r} \left(p_i^{k_i} - p_i^{k_i - 1}\right) = \prod_{i=1}^{r} p_i^{k_i - 1}(p_i - 1) = n \prod_{i=1}^{r} \left(1 - \frac{1}{p_i}\right)$$

##### 2. Áp dụng cho 4 dạng toán trên MOOC

- **Dạng 1: $n = p \cdot q$ (với $p \ne q$ là hai số nguyên tố)**
  $$\phi(p \cdot q) = (p - 1)(q - 1)$$
  *Ví dụ:* $p = 17, q = 23 \implies \phi(17 \times 23) = \phi(391) = 16 \times 22 = \mathbf{352}$.

- **Dạng 2: $n = p^k$ (với $p$ là số nguyên tố, $k \ge 1$)**
  Trong tập $\{1, 2, \dots, p^k\}$ có tất cả $p^k$ số. Một số không nguyên tố cùng nhau với $p^k$ khi và chỉ khi nó là bội của $p$ (gồm $1p, 2p, 3p, \dots, p^{k-1} \cdot p$, tổng cộng có $p^{k-1}$ số). Do đó:
  $$\phi(p^k) = p^k - p^{k-1} = p^{k-1}(p - 1)$$
  *Ví dụ:*
  - $\phi(7^3) = 7^3 - 7^2 = 343 - 49 = \mathbf{294}$.
  - $\phi(2^{10}) = 2^{10} - 2^9 = 1024 - 512 = \mathbf{512}$.

- **Dạng 3: $n = p^2 \cdot q^2$ (với $p \ne q$ là hai số nguyên tố) — CẢNH GIÁC BẪY!**
  > **Cảnh báo lỗi sai phổ biến:** Rất nhiều sinh viên nhầm lẫn áp dụng công thức RSA $\phi(n) = (p^2 - 1)(q^2 - 1)$ $\longrightarrow$ **SAI HOÀN TOÀN!** Vì $p^2$ và $q^2$ không phải là số nguyên tố.

  Áp dụng tính chất nhân tính của hàm Euler ($\gcd(p^2, q^2) = 1$):
  $$\phi(p^2 \cdot q^2) = \phi(p^2) \cdot \phi(q^2) = \left(p^2 - p\right)\left(q^2 - q\right) = \mathbf{p \cdot q \cdot (p - 1)(q - 1)}$$
  *Ví dụ minh họa:*
  - Cho $p = 5, q = 7 \implies n = 5^2 \cdot 7^2 = 25 \times 49 = 1225$.
  - Ta có:
    $$\phi(5^2 \cdot 7^2) = 5 \times 7 \times (5 - 1) \times (7 - 1) = 35 \times 4 \times 6 = \mathbf{840}$$
  - Cho $p = 11, q = 13 \implies \phi(11^2 \cdot 13^2) = 11 \times 13 \times 10 \times 12 = \mathbf{17,160}$.

- **Dạng 4: Tính $\phi(n)$ cho các hợp số thường gặp**
  - $\phi(26) = \phi(2 \times 13) = (2 - 1)(13 - 1) = 1 \times 12 = \mathbf{12}$.
  - $\phi(29) = 29 - 1 = \mathbf{28}$ (vì $29$ là số nguyên tố).
  - $\phi(1000) = \phi(2^3 \times 5^3) = (2^3 - 2^2)(5^3 - 5^2) = (8 - 4)(125 - 25) = 4 \times 100 = \mathbf{400}$.
  - $\phi(240) = \phi(2^4 \times 3^1 \times 5^1) = (2^4 - 2^3)(3 - 1)(5 - 1) = 8 \times 2 \times 4 = \mathbf{64}$.

---

### Câu 3: Bài toán tính số lượng khóa hợp lệ của hệ mật **Affine** trên các bảng chữ cái

#### Đề bài chuẩn trên MOOC
Hệ mật mã thay thế **Affine** trên vành $\mathbb{Z}_m$ (với $m$ là số lượng chữ cái của ngôn ngữ) có hàm mã hóa:
$$E_K(x) = (a \cdot x + b) \pmod m$$
và hàm giải mã:
$$D_K(y) = a^{-1} \cdot (y - b) \pmod m$$
trong đó khóa $K = (a, b)$ với $a, b \in \mathbb{Z}_m = \{0, 1, \dots, m - 1\}$.
Hãy xác định tổng số lượng khóa $K = (a, b)$ hợp lệ (sao cho hàm mã hóa là song ánh, có thể giải mã duy nhất) trong hai trường hợp:
1. **Trường hợp 1:** Bảng chữ cái tiếng Anh chuẩn gồm $m = 26$ chữ cái (`A-Z`).
2. **Trường hợp 2:** Bảng chữ cái tiếng Việt chuẩn gồm $m = 29$ chữ cái (`A, Ă, Â, B, C, D, Đ, E, Ê, G, H, I, K, L, M, N, O, Ô, Ơ, P, Q, R, S, T, U, Ư, V, X, Y`).
*(Phân tích cả trường hợp tính toàn bộ khóa toán học hợp lệ và trường hợp loại bỏ khóa tầm thường $a = 1, b = 0$ biến bản mã thành bản rõ).*

---

#### Lời giải chi tiết

##### 1. Điều kiện để khóa $K = (a, b)$ hợp lệ trong hệ mật Affine
Để người nhận có thể giải mã được bản mã $y$ về bản rõ $x$ một cách duy nhất thông qua công thức $x = a^{-1}(y - b) \pmod m$, hệ số nhân $a$ bắt buộc phải có **nghịch đảo nhân theo modulo $m$**.
- Điều kiện cần và đủ để tồn tại $a^{-1} \pmod m$ là:
  $$\gcd(a, m) = 1$$
  $\implies$ Số cách chọn hệ số $a \in \mathbb{Z}_m$ đúng bằng giá trị hàm Euler **$\phi(m)$**.
- Hệ số dịch chuyển $b \in \mathbb{Z}_m = \{0, 1, \dots, m - 1\}$ có thể chọn tùy ý không ràng buộc $\implies$ Có đúng **$m$** cách chọn $b$.
- Do đó, **tổng số khóa hợp lệ về mặt toán học** của hệ mật Affine trên bảng chữ cái kích thước $m$ là:
  $$|\mathcal{K}_{\text{Affine}}| = m \times \phi(m)$$
- Nếu đề bài yêu cầu **loại bỏ khóa tầm thường (trivial/identity key)** là cặp $(a = 1, b = 0)$ (vì $E_{(1,0)}(x) = x$, không làm thay đổi bản rõ), thì số khóa thực sự có tác dụng mã hóa là:
  $$|\mathcal{K}_{\text{non-trivial}}| = m \times \phi(m) - 1$$

##### 2. Áp dụng cho Bảng chữ cái Tiếng Anh ($m = 26$)
- Phân tích $m = 26 = 2 \times 13$.
- Số cách chọn $a$ sao cho $\gcd(a, 26) = 1$:
  $$\phi(26) = (2 - 1)(13 - 1) = 12 \text{ giá trị}$$
  *(Cụ thể 12 giá trị của $a$ là: $\{1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25\}$).*
- Số cách chọn $b \in \{0, 1, \dots, 25\}$ là **$26$ giá trị**.
- **Tổng số khóa hợp lệ:**
  $$|\mathcal{K}_{26}| = 26 \times \phi(26) = 26 \times 12 = \mathbf{312\text{ khóa}}$$
  *(Nếu trừ khóa tầm thường $(1, 0)$ thì còn $312 - 1 = \mathbf{311\text{ khóa}}$).*

##### 3. Áp dụng cho Bảng chữ cái Tiếng Việt ($m = 29$)
- Nhận xét: **$m = 29$ là một số nguyên tố!**
- Do $29$ là số nguyên tố nên mọi số $a \in \{1, 2, \dots, 28\}$ đều nguyên tố cùng nhau với $29$:
  $$\phi(29) = 29 - 1 = 28 \text{ giá trị}$$
- Số cách chọn $b \in \{0, 1, \dots, 28\}$ là **$29$ giá trị**.
- **Tổng số khóa hợp lệ:**
  $$|\mathcal{K}_{29}| = 29 \times \phi(29) = 29 \times 28 = \mathbf{812\text{ khóa}}$$
  *(Nếu trừ khóa tầm thường $(1, 0)$ thì còn $812 - 1 = \mathbf{811\text{ khóa}}$).*

##### Bảng tổng hợp tra cứu nhanh cho mọi biến thể $m$ trên MOOC

| Ngôn ngữ / Bảng mã | Kích thước $m$ | Phân tích thừa số của $m$ | Số lượng hệ số $a$ hợp lệ $\phi(m)$ | Số lượng hệ số $b$ hợp lệ ($m$) | Tổng số khóa hợp lệ $m \cdot \phi(m)$ | Số khóa khác đồng nhất $m \cdot \phi(m) - 1$ |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Tiếng Anh chuẩn (A-Z)** | $26$ | $2 \times 13$ | $12$ | $26$ | **$312$** | **$311$** |
| **Tiếng Việt chuẩn (A-Y)** | $29$ | $29$ (nguyên tố) | $28$ | $29$ | **$812$** | **$811$** |
| **Chữ + Số (A-Z, 0-9)** | $36$ | $2^2 \times 3^2$ | $12$ | $36$ | **$432$** | **$431$** |
| **Bảng mã ASCII 128** | $128$ | $2^7$ | $64$ | $128$ | **$8,192$** | **$8,191$** |
| **Bảng mã Byte (ASCII 256)** | $256$ | $2^8$ | $128$ | $256$ | **$32,768$** | **$32,767$** |

---

### Câu 4: Bài toán tính toán Mã hóa RSA & Chữ ký số RSA (RSA Digital Signature)

#### Đề bài chuẩn trên MOOC
An (Alice) thiết lập hệ mật RSA với hai số nguyên tố $p = 17$ và $q = 23$. An chọn số mũ công khai $e = 3$.
1. Hãy xác định mô-đun $n$, giá trị $\phi(n)$ và khóa bí mật $d$ của An.
2. **Bài toán Bảo mật (Confidentiality — Mã hóa):** Bình (Bob) muốn gửi bản rõ $M_1 = 10$ một cách bí mật cho An. Hỏi bản mã $C$ Bình gửi đi là bao nhiêu?
3. **Bài toán Xác thực & Chống chối bỏ (Digital Signature — Chữ ký số):** An muốn ký số lên thông điệp (hoặc giá trị băm của thông điệp) $M_2 = 15$ để gửi cho Bình.
   - Tính chữ ký số $S$ mà An tạo ra.
   - Trình bày phép tính mà Bình thực hiện để xác thực chữ ký $S$ đó.

---

#### Lời giải chi tiết từng bước

##### Bước 1: Sinh khóa RSA của An
- Tính mô-đun công khai $n$:
  $$n = p \times q = 17 \times 23 = \mathbf{391}$$
- Tính hàm Euler $\phi(n)$:
  $$\phi(n) = (p - 1)(q - 1) = 16 \times 22 = \mathbf{352}$$
- Kiểm tra tính hợp lệ của số mũ công khai $e = 3$:
  $$\gcd(e, \phi(n)) = \gcd(3, 352) = 1 \quad (\text{vì } 352 = 3 \times 117 + 1)$$
- Tìm khóa bí mật $d = e^{-1} \pmod{\phi(n)} = 3^{-1} \pmod{352}$ bằng thuật toán Euclid mở rộng:
  Ta có:
  $$352 = 117 \times 3 + 1 \implies 1 = 352 - 117 \times 3 \implies (-117) \times 3 \equiv 1 \pmod{352}$$
  Chuyển về số dư dương:
  $$d = -117 + 352 = \mathbf{235}$$
  *(Kiểm tra lại: $e \times d = 3 \times 235 = 705 = 2 \times 352 + 1 \equiv 1 \pmod{352}$ $\longrightarrow$ Chính xác!).*
- **Kết luận bộ khóa của An:**
  - Khóa công khai (Public Key): $PU_A = (e, n) = (3, 391)$.
  - Khóa bí mật (Private Key): $PR_A = (d, n) = (235, 391)$.

##### Bước 2: Mã hóa bảo mật (Confidentiality) — Bình gửi $M_1 = 10$ cho An
- Để đảm bảo chỉ có An đọc được, Bình dùng **khóa công khai của An** $PU_A = (e, n) = (3, 391)$ để mã hóa:
  $$C = M_1^e \pmod n = 10^3 \pmod{391} = 1000 \pmod{391}$$
- Vì $1000 = 2 \times 391 + 218$, nên:
  $$C = \mathbf{218}$$
- Khi An nhận được $C = 218$, An dùng **khóa bí mật của An** $PR_A = (235, 391)$ để giải mã:
  $$M_1 = C^d \pmod n = 218^{235} \pmod{391} = \mathbf{10}$$

##### Bước 3: Chữ ký số RSA (Digital Signature) — An ký lên $M_2 = 15$
> **Nguyên tắc vàng cần nhớ:**
> - **Mã hóa bảo mật:** Mã hóa bằng $PU_{\text{nhận}} (e)$, Giải mã bằng $PR_{\text{nhận}} (d)$.
> - **Chữ ký số:** Ký bằng **Khóa bí mật của người gửi** $PR_{\text{gửi}} (d)$, Xác thực bằng **Khóa công khai của người gửi** $PU_{\text{gửi}} (e)$.

- **Quá trình Ký số (Signing — do An thực hiện bằng khóa bí mật $d = 235$):**
  $$S = M_2^d \pmod n = 15^{235} \pmod{391}$$
  Ta tính nhanh $15^{235} \pmod{391}$ bằng thuật toán Bình phương và Nhân (hoặc Định lý phần dư Trung Hoa CRT):
  - Theo modulo $p = 17$: $15 \equiv -2 \pmod{17}$, và theo định lý Fermat nhỏ $a^{16} \equiv 1 \pmod{17}$.
    Ta có $235 = 14 \times 16 + 11 \implies 15^{235} \equiv (-2)^{11} = -2048 \pmod{17}$.
    Vì $2048 = 17 \times 120 + 8 \implies -2048 \equiv -8 \equiv 9 \pmod{17}$.
  - Theo modulo $q = 23$: Theo định lý Fermat nhỏ $15^{22} \equiv 1 \pmod{23}$.
    Ta có $235 = 10 \times 22 + 15 \implies 15^{235} \equiv 15^{15} \pmod{23}$.
    Tính lũy thừa: $15^2 = 225 = 23 \times 9 + 18 \equiv -5 \pmod{23}$;
    $15^4 \equiv (-5)^2 = 25 \equiv 2 \pmod{23}$;
    $15^8 \equiv 2^2 = 4 \pmod{23}$;
    $\implies 15^{15} = 15^8 \cdot 15^4 \cdot 15^2 \cdot 15^1 \equiv 4 \times 2 \times (-5) \times 15 = -600 \pmod{23}$.
    Vì $600 = 23 \times 26 + 2 \implies -600 \equiv -2 \equiv 21 \pmod{23}$.
  - Ghép hệ phương trình đồng dư bằng CRT:
    $$\begin{cases} S \equiv 9 \pmod{17} \\ S \equiv 21 \pmod{23} \end{cases}$$
    Đặt $S = 23k + 21$. Thay vào phương trình đầu:
    $$23k + 21 \equiv 9 \pmod{17} \iff 6k + 4 \equiv 9 \pmod{17} \iff 6k \equiv 5 \equiv 22 \text{ (không chia hết)} \equiv 39 \text{ (không)} \equiv 56 \text{ (không)} \equiv 73 \dots$$
    Nhẩm nhanh: $6 \times 3 = 18 \equiv 1 \pmod{17} \implies k \equiv 3 \times 5 = 15 \pmod{17}$.
    Vậy:
    $$S = 23 \times 15 + 21 = 345 + 21 = \mathbf{366}$$
- **Quá trình Xác thực chữ ký (Verification — do Bình thực hiện bằng khóa công khai của An $e = 3$):**
  Bình nhận được cặp $(M_2, S) = (15, 366)$ và tính:
  $$M'_2 = S^e \pmod n = 366^3 \pmod{391}$$
  Ta có $366 \equiv -25 \pmod{391}$, suy ra:
  $$366^3 \equiv (-25)^3 = -15,625 \pmod{391}$$
  Chia $15,625$ cho $391$: $15,625 = 40 \times 391 - 15 \implies -15,625 = -40 \times 391 + 15 \equiv \mathbf{15} \pmod{391}$.
  Vì $M'_2 = 15 = M_2$, Bình kết luận **chữ ký hợp lệ**!

---

### Câu 5: Ước lượng xác suất đụng độ hàm băm — Nguyên lý Chuồng bồ câu (Dirichlet) vs. Nghịch lý Ngày sinh (Birthday Paradox)

#### Đề bài chuẩn trên MOOC
Cho hàm băm mật mã $H$ có kích thước đầu ra là $n\text{ bit}$ (ví dụ $n = 64\text{ bit}$, $n = 128\text{ bit}$, hoặc $n = 160\text{ bit}$).
1. Theo **Nguyên lý Chuồng bồ câu (Pigeonhole Principle / Dirichlet)**, cần băm tối thiểu bao nhiêu thông điệp phân biệt để **chắc chắn 100% (xác suất $P = 1$)** xảy ra ít nhất một vụ đụng độ (collision)?
2. Theo **Nghịch lý Ngày sinh (Birthday Paradox)**, kẻ tấn công chỉ cần tạo ra khoảng bao nhiêu bản băm để có xác suất tìm thấy ít nhất một cặp đụng độ vượt quá **$50\%$ ($P \ge 0.5$)**? Để chống lại tấn công ngày sinh ở ngưỡng an toàn $2^{80}$ phép tính, độ dài đầu ra hàm băm tối thiểu phải là bao nhiêu bit?

---

#### Lời giải & Công thức chuẩn

##### 1. Nguyên lý Chuồng bồ câu (Dirichlet) — Đụng độ chắc chắn 100% ($P = 1$)
- Một hàm băm có đầu ra $n\text{ bit}$ sẽ có tổng cộng $N = 2^n$ giá trị băm khả dĩ khác nhau (tương ứng với $2^n$ "chuồng bồ câu", từ `00...0` đến `11...1`).
- Nếu ta băm $2^n$ thông điệp đầu tiên, trong trường hợp xấu nhất mỗi thông điệp rơi vào đúng 1 giá trị băm khác nhau thì vẫn chưa có đụng độ.
- Đến thông điệp thứ **$2^n + 1$**, bắt buộc giá trị băm của nó phải trùng với ít nhất một trong $2^n$ giá trị băm đã xuất hiện trước đó.
- **Công thức:**
  $$k_{\text{100\%}} = 2^n + 1$$

##### 2. Nghịch lý Ngày sinh (Birthday Paradox) — Đụng độ với xác suất $P \approx 50\%$ (Kháng đụng độ mạnh)
- Khi chọn ngẫu nhiên $k$ phần tử từ tập có $N = 2^n$ phần tử, xác suất để xuất hiện ít nhất một cặp trùng nhau ($H(x) = H(y)$ với $x \ne y$) là:
  $$P_{\text{collision}}(k) \approx 1 - e^{-\frac{k(k-1)}{2N}} \approx 1 - e^{-\frac{k^2}{2 \cdot 2^n}}$$
- Để đạt xác suất $P_{\text{collision}} = 0.5$ ($50\%$):
  $$e^{-\frac{k^2}{2 \cdot 2^n}} = 0.5 \implies \frac{k^2}{2 \cdot 2^n} = \ln 2 \approx 0.693 \implies k = \sqrt{2 \ln 2 \cdot 2^n} \approx \mathbf{1.1774 \times 2^{n/2}} \approx \mathbf{2^{n/2}}$$
- Nếu yêu cầu xác suất đụng độ tổng quát là $p \in (0, 1)$, số phép băm cần thiết là:
  $$k(p) \approx \sqrt{2 \cdot 2^n \cdot \ln\left(\frac{1}{1 - p}\right)}$$

##### 3. Bảng so sánh độ phức tạp tấn công hàm băm $n\text{ bit}$

| Mục tiêu tấn công / Tính chất hàm băm | Định nghĩa toán học | Số phép băm cần thiết (Xác suất $\ge 50\%$) | Số phép băm chắc chắn $100\%$ (Dirichlet) | Ví dụ với **MD5** ($n = 128\text{ bit}$) | Ví dụ với **SHA-1** ($n = 160\text{ bit}$) | Ví dụ với **SHA-256** ($n = 256\text{ bit}$) |
| :--- | :--- | :---: | :---: | :---: | :---: | :---: |
| **Tính một chiều** *(Preimage Resistance)* | Cho trước $h$, tìm $x$ sao cho $H(x) = h$ | $\approx \mathbf{2^n}$ (hoặc $2^{n-1}$ trung bình) | Không giới hạn (phụ thuộc miền đầu vào) | $2^{128}$ | $2^{160}$ | $2^{256}$ |
| **Kháng đụng độ yếu** *(Second Preimage / Weak Collision)* | Cho trước $x$, tìm $y \ne x$ sao cho $H(y) = H(x)$ | $\approx \mathbf{2^n}$ (hoặc $2^{n-1}$ trung bình) | $2^n + 1$ | $2^{128}$ | $2^{160}$ | $2^{256}$ |
| **Kháng đụng độ mạnh** *(Strong Collision / Birthday Attack)* | Tìm cặp $(x, y)$ bất kỳ ($x \ne y$) sao cho $H(x) = H(y)$ | $\approx \mathbf{2^{n/2}}$ (chính xác $1.18 \times 2^{n/2}$) | $2^n + 1$ | **$2^{64}$** *(Đã bị phá!)* | **$2^{80}$** *(Đã bị phá năm 2017 - SHAttered)* | **$2^{128}$** *(An toàn tuyệt đối)* |

> **Trả lời câu hỏi thiết kế chuẩn an toàn:**
> Để chống lại tấn công ngày sinh (Birthday Attack) với độ an toàn tối thiểu $2^{80}$ phép tính, ta cần $2^{n/2} \ge 2^{80} \implies n \ge \mathbf{160\text{ bit}}$. Để đạt chuẩn an toàn hiện đại $2^{128}$ phép tính, độ dài hàm băm phải đạt tối thiểu $n \ge \mathbf{256\text{ bit}}$ (như SHA-256, SHA-3).

---

## PHẦN II: CÁC CÂU HỎI TRẮC NGHIỆM LÝ THUYẾT TRONG ĐỀ GIỮA KỲ MOOC

### Câu 6 (Nguyên lý Kerckhoffs)
**Hỏi:** Theo nguyên lý Kerckhoffs (Kerckhoffs's Principle) trong thiết kế hệ mật mã hiện đại, độ an toàn của một hệ thống mật mã phải phụ thuộc hoàn toàn vào yếu tố nào?
- **A.** Sự bí mật của thuật toán mã hóa và giải mã.
- **B.** Sự bí mật của khóa mật mã (Secret/Private Key), trong khi thuật toán được coi là công khai.
- **C.** Độ dài của bản rõ và bản mã.
- **D.** Việc giữ bí mật cả thuật toán lẫn khóa mật mã.

> **Đáp án đúng:** **B**
> **Giải thích:** Auguste Kerckhoffs (1883) phát biểu rằng một hệ mật mã phải an toàn ngay cả khi mọi chi tiết của hệ thống, ngoại trừ **khóa bí mật**, đều bị rơi vào tay kẻ thù (Claude Shannon phát biểu lại dưới dạng: *"Kẻ địch biết rõ hệ thống"* — *"The enemy knows the system"*). Việc giữ bí mật thuật toán (Security by Obscurity) rất dễ bị phá vỡ qua dịch ngược (reverse engineering) và không thể thay đổi dễ dàng khi lộ như thay khóa.

---

### Câu 7 (Ba tính chất an toàn của Hàm băm mật mã)
**Hỏi:** Một nhà nghiên cứu mật mã tuyên bố rằng: *"Với bức thông điệp hợp đồng $M_1$ đã được Giám đốc ký số, tôi không thể nào tạo ra được một thông điệp giả mạo $M_2 \ne M_1$ có cùng giá trị băm với $M_1$, nhưng tôi lại có thể tự soạn ra hai bản hợp đồng $A$ và $B$ ($A \ne B$) có giá trị băm hoàn toàn giống nhau để đưa Giám đốc ký bản $A$ rồi tráo bằng bản $B$"*.
Hiện tượng này chứng tỏ hàm băm đang sử dụng đã bị phá vỡ tính chất nào, nhưng vẫn giữ được tính chất nào?
- **A.** Đã mất tính Một chiều (Preimage resistance), nhưng còn tính Kháng đụng độ mạnh.
- **B.** Đã mất tính Kháng đụng độ yếu (Second preimage resistance), nhưng còn tính Kháng đụng độ mạnh.
- **C.** Đã mất tính Kháng đụng độ mạnh (Strong collision resistance), nhưng vẫn còn tính Kháng đụng độ yếu (Weak collision / Second preimage resistance).
- **D.** Đã mất cả 3 tính chất an toàn.

> **Đáp án đúng:** **C**
> **Giải thích:**
> - Không tìm được $M_2 \ne M_1$ khi $M_1$ đã cố định trước $\implies$ Vẫn thỏa mãn **Kháng đụng độ yếu (Weak Collision / Second Preimage Resistance)** (độ phức tạp $2^n$).
> - Tự do chọn cả hai thông điệp $A \ne B$ sao cho $H(A) = H(B)$ (Tấn công ngày sinh) $\implies$ Đã bị phá vỡ **Kháng đụng độ mạnh (Strong Collision Resistance)** (độ phức tạp chỉ có $2^{n/2}$).
> - Lưu ý quan trọng: **Kháng đụng độ mạnh $\implies$ Kháng đụng độ yếu**, nhưng ngược lại thì không!

---

### Câu 8 (Phân biệt MDC, MAC và Chữ ký số - Digital Signature)
**Hỏi:** Cho 3 cơ chế bảo vệ dữ liệu:
1. Hàm băm không khóa **MDC** (Modification Detection Code — ví dụ SHA-256 đơn thuần).
2. Mã xác thực thông điệp dùng khóa đối xứng **MAC / HMAC**.
3. **Chữ ký số** (Digital Signature — ví dụ RSA-PSS, ECDSA).

Khẳng định nào sau đây là **CHÍNH XÁC NHẤT** khi so sánh 3 cơ chế này?
- **A.** Cả MDC, MAC và Chữ ký số đều đảm bảo tính chống chối bỏ (Non-repudiation).
- **B.** MAC đảm bảo được cả tính toàn vẹn, xác thực nguồn gốc và chống chối bỏ trước tòa án (bên thứ ba).
- **C.** MDC chỉ kiểm tra tính toàn vẹn khi kênh truyền mã hóa hoặc giá trị băm được bảo vệ; MAC đảm bảo tính toàn vẹn và xác thực nguồn gốc giữa hai bên chia sẻ khóa bí mật $K$ nhưng **không** chống chối bỏ; Chữ ký số đảm bảo cả Toàn vẹn, Xác thực nguồn gốc và **Chống chối bỏ (Non-repudiation)**.
- **D.** Chữ ký số chạy nhanh hơn MAC hàng nghìn lần nên luôn được dùng để xác thực từng gói tin mạng tốc độ cao.

> **Đáp án đúng:** **C**
> **Giải thích:**
> - **MDC ($h = H(M)$):** Không dùng khóa bí mật. Nếu truyền $(M, H(M))$ công khai trên mạng, kẻ tấn công Man-in-the-Middle có thể sửa $M \to M'$ và tự tính lại $h' = H(M')$ dễ dàng.
> - **MAC ($tag = \text{MAC}_K(M)$):** Dùng khóa đối xứng $K$ chung giữa Alice và Bob. Nó chứng minh được tính toàn vẹn và nguồn gốc đối với Bob, nhưng **không chống chối bỏ** trước bên thứ ba (Trọng tài), vì cả Alice và Bob đều có khóa $K$ nên Bob có thể tự tạo ra $\text{MAC}_K(M)$ rồi đổ lỗi cho Alice gửi!
> - **Chữ ký số ($S = \text{Sign}_{PR_A}(H(M))$):** Chỉ duy nhất Alice có khóa bí mật $PR_A$ để tạo chữ ký, còn mọi người đều dùng $PU_A$ để kiểm tra được $\implies$ Đảm bảo **Toàn vẹn + Xác thực nguồn gốc + Chống chối bỏ (Non-repudiation)**.

---

### Câu 9 (Tại sao phải Băm thông điệp trước khi Ký số?)
**Hỏi:** Trong các tiêu chuẩn chữ ký điện tử thực tế (như RSA, DSA, ECDSA), tại sao người gửi không ký trực tiếp lên toàn bộ văn bản gốc $M$ ($\text{Sign}_{PR}(M)$) mà luôn phải băm văn bản thành $h = H(M)$ rồi mới ký lên giá trị băm đó ($\text{Sign}_{PR}(H(M))$)? *(Chọn tất cả các lý do đúng)*
1. **Tăng hiệu năng & Giảm kích thước chữ ký:** Phép toán khóa công khai (như lũy thừa modulo số lớn trong RSA) rất chậm và chỉ nhận đầu vào nhỏ hơn mô-đun $n$. Băm giúp rút gọn văn bản hàng Gigabyte về kích thước cố định nhỏ gọn (ví dụ 256 bit), giúp ký và xác thực cực nhanh.
2. **Bảo vệ tính toàn vẹn cho toàn bộ văn bản dài:** Chỉ cần 1 bit trong văn bản dài bị thay đổi, giá trị băm $H(M)$ sẽ thay đổi hoàn toàn (hiệu ứng tuyết lở) và làm chữ ký mất hiệu lực, tránh việc phải chia văn bản thành nhiều khối để ký rời rạc (dễ bị tấn công cắt ghép / đảo thứ tự khối).
3. **Tăng cường tính an toàn toán học (Chống giả mạo tồn tại - Existential Forgery):** Trong RSA thuần túy (Textbook RSA), phép toán có tính nhân tính: $(M_1 \cdot M_2)^d \equiv M_1^d \cdot M_2^d \pmod n$. Kẻ tấn công có thể nhân hai chữ ký hợp lệ $S_1, S_2$ để tạo chữ ký giả $S_3 = S_1 \cdot S_2 \pmod n$ cho thông điệp $M_3 = M_1 \cdot M_2 \pmod n$. Hàm băm một chiều $H(\cdot)$ phá vỡ cấu trúc đại số này vì $H(M_1 \cdot M_2) \ne H(M_1) \cdot H(M_2)$.

- **A.** Chỉ (1) và (2).
- **B.** Chỉ (1) và (3).
- **C.** Chỉ (2) và (3).
- **D.** Cả (1), (2) và (3) đều đúng.

> **Đáp án đúng:** **D**

---

### Câu 10 (Bài toán thiết kế Hàm băm lồng nhau $H'(m) = H(H(m))$)
**Hỏi:** Giả sử hàm băm $H : \{0, 1\}^* \to \{0, 1\}^n$ là một hàm băm mật mã an toàn (thỏa mãn tính một chiều và kháng đụng độ mạnh). Một kỹ sư đề xuất hàm băm kép $H'(m) = H(H(m))$ (tương tự cơ chế Double-SHA256 trong Bitcoin). Nhận xét nào sau đây về $H'(m)$ là **ĐÚNG**?
- **A.** Độ dài đầu ra của $H'(m)$ tăng gấp đôi lên thành $2n\text{ bit}$, nên độ phức tạp tấn công ngày sinh tăng lên $2^n$.
- **B.** Độ dài đầu ra của $H'(m)$ vẫn là $n\text{ bit}$, và nếu $H$ kháng đụng độ mạnh thì $H'$ cũng kháng đụng độ mạnh (độ phức tạp tấn công ngày sinh vẫn bị chặn trên bởi $\approx 2^{n/2}$).
- **C.** $H'(m)$ làm mất hoàn toàn tính một chiều của hàm băm $H$.
- **D.** $H'(m)$ không bao giờ xảy ra đụng độ.

> **Đáp án đúng:** **B**
> **Giải thích:**
> - Vì $H$ có đầu ra $n\text{ bit}$, nên khi lấy kết quả $y = H(m) \in \{0,1\}^n$ đưa tiếp vào $H(y)$, đầu ra cuối cùng của $H'(m) = H(H(m))$ **vẫn có độ dài $n\text{ bit}$**.
> - **Chứng minh $H'$ giữ tính kháng đụng độ mạnh:** Giả sử kẻ tấn công tìm được cặp đụng độ trên $H'$, tức là $m_1 \ne m_2$ sao cho $H(H(m_1)) = H(H(m_2))$:
>   - *Trường hợp 1:* Nếu $H(m_1) = H(m_2)$, thì $(m_1, m_2)$ chính là một cặp đụng độ của hàm băm gốc $H$.
>   - *Trường hợp 2:* Nếu $H(m_1) \ne H(m_2)$, đặt $y_1 = H(m_1)$ và $y_2 = H(m_2)$ ($y_1 \ne y_2$). Khi đó $H(y_1) = H(y_2)$, nghĩa là $(y_1, y_2)$ cũng chính là một cặp đụng độ của hàm băm gốc $H$!
>   - Vậy bất kỳ đụng độ nào trên $H'$ đều lập tức cho ta một đụng độ trên $H$. Do $H$ kháng đụng độ mạnh nên $H'$ cũng kháng đụng độ mạnh (và việc băm 2 lần còn giúp chống lại kiểu **tấn công mở rộng độ dài — Length Extension Attack** trên cấu trúc Merkle–Damgård như SHA-256).
