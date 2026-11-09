# TỜ TÓM TẮT KÍP ÔN THI GIỮA KỲ "GK ATTT A4" — IT4015 (ĐHBK HÀ NỘI)
## Cô Đọng Toàn Bộ Lý Thuyết, Bảng So Sánh & Công Thức Toán Mật Mã (Chương 1 – Chương 6)

> **Biên soạn chuẩn theo Slide bài giảng & Giáo trình:**
> - **TS. Nguyễn Khanh Văn** (*Giáo trình Cơ sở An toàn thông tin* & Slide `Ch 0` $\to$ `Ch 6`, `MAC-HMAC`, `SHA-256`)
> - **TS. Bùi Trọng Tùng** (Slide `Nhập môn An toàn thông tin` — SoICT, HUST)

---

## PHẦN 1: TỔNG QUAN AN TOÀN THÔNG TIN (CHƯƠNG 1)

### 1.1. Tam giác CIA & Các thuộc tính mở rộng (AAA / Parkerian)
| Thuộc tính | Tiếng Anh | Định nghĩa cốt lõi | Cơ chế bảo vệ điển hình | Tấn công xâm phạm trực tiếp |
| :--- | :--- | :--- | :--- | :--- |
| **Tính bí mật** | **Confidentiality** | Chỉ những chủ thể được cấp quyền mới có thể đọc/tiếp cận thông tin. | Mã hóa (AES, RSA), Kiểm soát truy cập (Access Control). | Nghe lén (Eavesdropping / Sniffing), Phân tích lưu lượng (Traffic Analysis). |
| **Tính toàn vẹn** | **Integrity** | Dữ liệu và hệ thống không bị sửa đổi, xóa hoặc chèn trái phép (cả vô tình lẫn cố ý). | Hàm băm (SHA-256), MAC/HMAC, Chữ ký số. | Sửa đổi gói tin (Modification), Phát lại (Replay), Man-in-the-Middle (MitM). |
| **Tính sẵn sàng** | **Availability** | Hệ thống và tài nguyên luôn truy cập được kịp thời khi người dùng hợp pháp yêu cầu. | Dự phòng (Redundancy, RAID), Cân bằng tải, Sao lưu (Backup), Chống DDoS. | Từ chối dịch vụ (DoS / DDoS), Phá hoại phần cứng, Ransomware. |
| **Tính xác thực** | **Authenticity** | Đảm bảo danh tính của chủ thể hoặc nguồn gốc thông điệp là đúng như tuyên bố. | Mật khẩu + Salt, MFA/2FA, MAC, Chứng chỉ số PKI, Challenge-Response. | Giả mạo danh tính (Masquerade / Spoofing), Phishing. |
| **Chống chối bỏ** | **Non-repudiation** | Người gửi (hoặc người nhận) không thể phủ nhận hành vi đã gửi/nhận trước bên thứ ba (Tòa án). | **Chữ ký số khóa công khai (Digital Signature)** + PKI/Timestamp. | Chối bỏ giao dịch sau khi đã ký hợp đồng/chuyển tiền. |
| **Trách nhiệm giải trình** | **Accountability** | Mọi hành động của từng cá nhân phải được ghi vết để quy trách nhiệm khi có sự cố. | Nhật ký kiểm toán (Audit Logs), SIEM, Định danh duy nhất. | Xóa dấu vết (Log tampering), Dùng chung tài khoản quản trị. |

### 1.2. Phân biệt Tấn công Thụ động (Passive) vs. Tấn công Chủ động (Active)
| Tiêu chí | Tấn công Thụ động (Passive Attack) | Tấn công Chủ động (Active Attack) |
| :--- | :--- | :--- |
| **Bản chất** | Chỉ nghe lén, quan sát, thu thập thông tin; **KHÔNG làm thay đổi** dữ liệu hay hoạt động hệ thống. | Can thiệp trực tiếp: **sửa đổi, chèn giả, phát lại** dữ liệu hoặc làm gián đoạn hệ thống. |
| **Các dạng chính** | 1. Thu thập nội dung thông điệp (*Release of message contents*).<br>2. Phân tích lưu lượng (*Traffic analysis*). | 1. Giả mạo (*Masquerade*).<br>2. Phát lại (*Replay*).<br>3. Sửa đổi thông điệp (*Modification*).<br>4. Từ chối dịch vụ (*DoS/DDoS*). |
| **Phát hiện vs. Ngăn chặn** | **Rất khó phát hiện** (vì không để lại dấu vết), nhưng **dễ ngăn chặn** bằng Mã hóa (Encryption). | **Dễ phát hiện** (do dữ liệu/trạng thái bị biến đổi), nhưng **khó ngăn chặn tuyệt đối** $\implies$ Dùng MAC, Chữ ký số, Nonce/Timestamp, IDS/IPS. |

### 1.3. Các nguyên tắc thiết kế an toàn kinh điển (Saltzer & Schroeder)
1. **Economy of Mechanism (Đơn giản hóa thiết kế):** Thiết kế càng nhỏ gọn, đơn giản càng dễ kiểm chứng và ít lỗ hổng.
2. **Fail-Safe Defaults (Mặc định an toàn):** Mặc định là **Từ chối (Deny All)**; chỉ cấp quyền dựa trên sự cho phép tường minh (Whitelist).
3. **Complete Mediation (Kiểm tra toàn diện):** Mọi truy cập tới mọi đối tượng đều phải được kiểm tra quyền, không tin cậy bộ nhớ đệm cũ.
4. **Open Design (Thiết kế mở — Nguyên lý Kerckhoffs):** Độ an toàn phụ thuộc vào sự bí mật của **Khóa (Key)**, không phụ thuộc vào việc giấu kín thuật toán.
5. **Separation of Privilege (Phân tách đặc quyền):** Yêu cầu nhiều điều kiện/chữ ký độc lập để thực hiện tác vụ nhạy cảm.
6. **Least Privilege (Đặc quyền tối thiểu):** Mỗi tiến trình/người dùng chỉ được cấp quyền tối thiểu đủ để thực thi nhiệm vụ.
7. **Defense in Depth (Phòng thủ theo chiều sâu):** Kết hợp nhiều lớp bảo vệ độc lập chồng lấp nhau.

---

## PHẦN 2: TỔNG HỢP CÔNG THỨC TOÁN MẬT MÃ TRỌNG TÂM (CHƯƠNG 2, 3, 4)

### 2.1. Số học Modulo, Thuật toán Euclid Mở rộng & Hàm Euler $\phi(n)$

#### A. Thuật toán Euclid mở rộng (Extended Euclidean Algorithm) tìm $a^{-1} \pmod m$
- **Điều kiện tồn tại nghịch đảo:** $a^{-1} \pmod m$ tồn tại $\iff \gcd(a, m) = 1$.
- **Công thức truy hồi chuẩn (Lập bảng 5 cột $i, q_i, r_i, s_i, t_i$ thỏa mãn $r_i = m \cdot s_i + a \cdot t_i$):**
  - Khởi tạo dòng $i = -1$: $r_{-1} = m, \; s_{-1} = 1, \; t_{-1} = 0$.
  - Khởi tạo dòng $i = 0$: $r_0 = a, \; s_0 = 0, \; t_0 = 1$.
  - Bước lặp $i \ge 1$ (khi $r_{i-1} > 0$):
    $$q_i = \left\lfloor \frac{r_{i-2}}{r_{i-1}} \right\rfloor, \qquad r_i = r_{i-2} - q_i \cdot r_{i-1}$$
    $$s_i = s_{i-2} - q_i \cdot s_{i-1}, \qquad t_i = t_{i-2} - q_i \cdot t_{i-1}$$
  - Khi dừng tại $r_k = 1$: Hệ số $t_k$ chính là nghịch đảo cần tìm:
    $$a^{-1} \equiv t_k \pmod m \quad (\text{nếu } t_k < 0 \text{ thì cộng thêm } m: \; a^{-1} = t_k + m)$$

#### B. Hàm Phi Euler $\phi(n)$ & Định lý Fermat – Euler
- **Định nghĩa:** $\phi(n)$ là số lượng các số nguyên dương $\le n$ nguyên tố cùng nhau với $n$.
- **Bốn công thức tính $\phi(n)$ bắt buộc thuộc lòng:**
  1. Nếu $p$ là số nguyên tố:
     $$\phi(p) = p - 1$$
  2. Nếu $n = p \cdot q$ (với $p \ne q$ là hai số nguyên tố):
     $$\phi(p \cdot q) = (p - 1)(q - 1)$$
  3. Nếu $n = p^k$ ($p$ nguyên tố, $k \ge 1$):
     $$\phi(p^k) = p^k - p^{k-1} = p^{k-1}(p - 1)$$
  4. **Bẫy MOOC:** Nếu $n = p^2 \cdot q^2$ ($p \ne q$ nguyên tố):
     $$\phi(p^2 \cdot q^2) = \phi(p^2)\phi(q^2) = \mathbf{p \cdot q \cdot (p - 1)(q - 1)}$$
- **Định lý Fermat nhỏ (Fermat's Little Theorem):** Nếu $p$ nguyên tố và $p \nmid a$:
  $$a^{p - 1} \equiv 1 \pmod p \implies a^{-1} \equiv a^{p - 2} \pmod p$$
- **Định lý Euler (Euler's Theorem):** Nếu $\gcd(a, n) = 1$:
  $$a^{\phi(n)} \equiv 1 \pmod n \implies a^b \bmod n = a^{b \bmod \phi(n)} \bmod n$$

#### C. Thuật toán Bình phương và Nhân (Square-and-Multiply) tính $a^b \pmod n$
- Đổi số mũ $b$ sang hệ nhị phân từ bit trọng số cao nhất (MSB) đến thấp nhất (LSB): $b = (b_k b_{k-1} \dots b_1 b_0)_2$.
- Khởi tạo $p = 1$. Duyệt từng bit $b_i$ từ trái sang phải ($i = k \to 0$):
  - Nếu $b_i = 0$: Chỉ bình phương: $p \leftarrow p^2 \bmod n$.
  - Nếu $b_i = 1$: Bình phương rồi nhân với cơ số $a$: $p \leftarrow (p^2 \cdot a) \bmod n$.

---

### 2.2. Các hệ mật mã cổ điển (Classical Ciphers)
| Hệ mật | Công thức Mã hóa $E_K(x)$ | Công thức Giải mã $D_K(y)$ | Kích thước không gian khóa (trên $\mathbb{Z}_m$) |
| :--- | :--- | :--- | :--- |
| **Caesar** | $(x + k) \bmod m$ | $(y - k) \bmod m$ | $m$ khóa ($m - 1$ khóa khác đồng nhất). Với $m=26 \implies 25$ khóa. |
| **Affine** | $(a x + b) \bmod m$ ($\gcd(a,m)=1$) | $a^{-1}(y - b) \bmod m$ | **$m \times \phi(m)$** khóa. Tiếng Anh ($m=26$): **$312$** khóa. Tiếng Việt ($m=29$): **$812$** khóa. |
| **Vigenère** | $(x_i + k_{i \bmod L}) \bmod m$ | $(y_i - k_{i \bmod L}) \bmod m$ | $m^L$ khóa (với $L$ là độ dài từ khóa). |
| **Hill (Ma trận $d \times d$)** | $\mathbf{C} = \mathbf{P} \cdot \mathbf{K} \pmod m$ | $\mathbf{P} = \mathbf{C} \cdot \mathbf{K}^{-1} \pmod m$ | Điều kiện khả nghịch: $\gcd(\det(\mathbf{K}), m) = 1$. |
| **Vernam / OTP** | $c_i = m_i \oplus k_i$ | $m_i = c_i \oplus k_i$ | An toàn tuyệt đối (Perfect Secrecy) khi $|k| \ge |m|$, $k$ ngẫu nhiên thật sự và **chỉ dùng 1 lần**. |

---

## PHẦN 3: MẬT MÃ KHÓA ĐỐI XỨNG & CÁC CHẾ ĐỘ HOẠT ĐỘNG (CHƯƠNG 2 & 3)

### 3.1. Bảng so sánh DES, 2DES, 3DES và AES
| Đặc điểm | **DES** | **2DES (Double DES)** | **3DES (Triple DES - EDE)** | **AES (Rijndael)** |
| :--- | :---: | :---: | :---: | :---: |
| **Cấu trúc mạng** | Mạng Feistel | 2 lớp Feistel ($E_{K_2}(E_{K_1}(P))$) | 3 lớp Feistel ($E_{K_3}(D_{K_2}(E_{K_1}(P)))$) | **Mạng SPN** trên $\text{GF}(2^8)$ (SubBytes, ShiftRows, MixColumns, AddRoundKey) |
| **Kích thước khối** | **$64\text{ bit}$** ($8\text{ bytes}$) | $64\text{ bit}$ | $64\text{ bit}$ | **$128\text{ bit}$** ($16\text{ bytes}$ — ma trận $4 \times 4$) |
| **Độ dài khóa** | **$56\text{ bit}$** hiệu dụng ($64\text{ bit}$ kèm $8$ bit chẵn lẻ) | $112\text{ bit}$ ($2 \times 56\text{ bit}$) | $112\text{ bit}$ (2-key) hoặc **$168\text{ bit}$** (3-key) | **$128\text{ bit}$**, **$192\text{ bit}$**, hoặc **$256\text{ bit}$** |
| **Số vòng lặp** | $16\text{ vòng}$ | $32\text{ vòng}$ | $48\text{ vòng}$ | **$10\text{ vòng}$** (128b), **$12\text{ vòng}$** (192b), **$14\text{ vòng}$** (256b) |
| **Độ an toàn thực tế** | **Không an toàn** (Vét cạn $2^{56}$) | **Không an toàn** (Bị tấn công *Meet-in-the-Middle* tốn $\approx \mathbf{2^{57}}$) | Độ an toàn hiệu dụng $2^{112}$ (Chậm, khối nhỏ 64-bit dễ bị Sweet32) | **Chuẩn an toàn hiện đại** ($2^{128}, 2^{192}, 2^{256}$) |

### 3.2. Bảng so sánh 5 Chế độ hoạt động của Mã khối (ECB, CBC, CFB, OFB, CTR)
| Chế độ | Công thức Mã hóa | Công thức Giải mã | Hàm mã khối dùng khi Giải mã | Mã hóa song song? | Giải mã song song? | Lan truyền lỗi khi khối bản mã $C_i$ bị sai 1 bit | Chống tấn công CPA? |
| :--- | :--- | :--- | :---: | :---: | :---: | :--- | :---: |
| **ECB** *(Electronic Codebook)* | $C_i = E_K(P_i)$ | $P_i = D_K(C_i)$ | $D_K$ | **Có** | **Có** | Chỉ hỏng hoàn toàn 1 khối **$P_i$** tương ứng. | **KHÔNG** (Lộ mẫu lặp lại) |
| **CBC** *(Cipher Block Chaining)* | $C_i = E_K(P_i \oplus C_{i-1})$ ($C_0 = IV$) | $P_i = D_K(C_i) \oplus C_{i-1}$ | $D_K$ | **Không** (Tuần tự) | **CÓ** | Hỏng hoàn toàn khối **$P_i$** + Sai đúng **1 bit** tương ứng ở khối kế tiếp **$P_{i+1}$** (tự phục hồi từ $P_{i+2}$). | **Có** (Nếu $IV$ ngẫu nhiên không đoán trước) |
| **CFB** *(Cipher Feedback)* | $C_i = P_i \oplus E_K(C_{i-1})$ ($C_0 = IV$) | $P_i = C_i \oplus E_K(C_{i-1})$ | **Chỉ dùng $E_K$** | **Không** (Tuần tự) | **CÓ** | Sai đúng **1 bit** ở khối **$P_i$** + Hỏng hoàn toàn khối kế tiếp **$P_{i+1}$**. | **Có** |
| **OFB** *(Output Feedback)* | $O_i = E_K(O_{i-1})$ ($O_0 = IV$)<br>$C_i = P_i \oplus O_i$ | $O_i = E_K(O_{i-1})$<br>$P_i = C_i \oplus O_i$ | **Chỉ dùng $E_K$** | **Không** *(Nhưng luồng $O_i$ tính trước được)* | **Không** *(Luồng $O_i$ tính trước được)* | **Không lan truyền lỗi:** Chỉ sai đúng **1 bit** duy nhất tại vị trí tương ứng của **$P_i$**. | **Có** (Không được dùng lại $IV$) |
| **CTR** *(Counter Mode)* | $C_i = P_i \oplus E_K(\text{Ctr}_i)$ | $P_i = C_i \oplus E_K(\text{Ctr}_i)$ | **Chỉ dùng $E_K$** | **CÓ** (+ Truy cập ngẫu nhiên) | **CÓ** (+ Truy cập ngẫu nhiên) | **Không lan truyền lỗi:** Chỉ sai đúng **1 bit** duy nhất tại vị trí tương ứng của **$P_i$**. | **Có** (Tuyệt đối không lặp lại Nonce/Counter) |

---

## PHẦN 4: MẬT MÃ KHÓA CÔNG KHAI & TRAO ĐỔI KHÓA (CHƯƠNG 3 & 5)

### 4.1. Bảng so sánh Mật mã Khóa đối xứng vs. Mật mã Khóa công khai (Bất đối xứng)
| Tiêu chí | Mật mã Khóa đối xứng (Symmetric: AES, DES, ChaCha20) | Mật mã Khóa công khai (Asymmetric: RSA, DH, ElGamal, ECC) |
| :--- | :--- | :--- |
| **Số lượng khóa sử dụng** | **1 khóa bí mật chung duy nhất ($K$)** cho cả Mã hóa và Giải mã. | **1 cặp khóa có quan hệ toán học ($PU, PR$):** Khóa công khai ($PU$) công bố rộng rãi, Khóa bí mật ($PR$) giữ kín. |
| **Tổng số khóa cho mạng $N$ người** | $\dfrac{N(N-1)}{2} \approx O(N^2)$ khóa (khó quản lý khi $N$ lớn). | $N$ cặp khóa ($2N$ khóa — tăng tuyến tính $O(N)$). |
| **Tốc độ xử lý** | **Cực nhanh** (nhanh hơn từ $1,000$ đến $10,000$ lần). | **Rất chậm** (do các phép lũy thừa modulo số lớn 2048–4096 bit). |
| **Độ dài khóa tương đương an toàn** | **AES-128 bit** | **RSA / DH 3072 bit** $\approx$ **ECC 256 bit** |
| **Ứng dụng chính trong thực tế** | Mã hóa luồng dữ liệu lớn (File, Database, gói tin HTTPS/VPN sau khi đã có khóa phiên). | 1. **Trao đổi khóa phiên** (Key Exchange: ECDHE, RSA).<br>2. **Chữ ký số & Chống chối bỏ** (Digital Signature). |

### 4.2. Công thức 4 Hệ mật Khóa công khai cốt lõi (RSA, Diffie-Hellman, ElGamal, ECC)

#### 1. Hệ mật RSA (Rivest–Shamir–Adleman)
- **Sinh khóa:** Chọn 2 số nguyên tố lớn $p \ne q \implies n = p \cdot q$ và $\phi(n) = (p-1)(q-1)$.
  Chọn $e \in (1, \phi(n))$ sao cho $\gcd(e, \phi(n)) = 1$. Tính $d = e^{-1} \pmod{\phi(n)}$.
  - Khóa công khai: $PU = (e, n)$. Khóa bí mật: $PR = (d, n)$.
- **Bảo mật (Confidentiality — Mã hóa với $PU_{\text{nhận}}$, Giải mã với $PR_{\text{nhận}}$):**
  $$C = M^e \pmod n, \qquad M = C^d \pmod n$$
- **Chữ ký số (Digital Signature — Ký với $PR_{\text{gửi}}$, Xác thực với $PU_{\text{gửi}}$):**
  $$S = H(M)^d \pmod n, \qquad \text{Kiểm tra: } S^e \pmod n \stackrel{?}{=} H(M)$$

#### 2. Trao đổi khóa Diffie–Hellman (DH) & Bài toán Logarit rời rạc (DLP)
- Tham số công khai: Số nguyên tố lớn $p$ và phần tử nguyên thủy (căn nguyên thủy) $g \in \mathbb{Z}_p^*$.
- Alice chọn bí mật $a \implies$ gửi công khai $A = g^a \bmod p$.
- Bob chọn bí mật $b \implies$ gửi công khai $B = g^b \bmod p$.
- **Khóa phiên chung:**
  $$K_{AB} = B^a \bmod p = A^b \bmod p = g^{ab} \bmod p$$
- **Logarit rời rạc:** $x = \text{Dlog}_g(y) \pmod p \iff g^x \equiv y \pmod p$.

#### 3. Hệ mật ElGamal trên $\mathbb{Z}_p^*$
- **Sinh khóa:** Tham số $(p, g)$. Chọn khóa bí mật $x \in \{1, \dots, p-2\}$. Tính $y = g^x \bmod p$.
  - Khóa công khai: $PU = (p, g, y)$. Khóa bí mật: $PR = x$.
- **Mã hóa bản rõ $M \in \mathbb{Z}_p^*$:** Chọn số ngẫu nhiên dùng 1 lần $k \in \{1, \dots, p-2\}$:
  $$C_1 = g^k \bmod p, \qquad C_2 = (M \cdot y^k) \bmod p \implies \text{Bản mã } C = (C_1, C_2)$$
- **Giải mã:**
  $$M = C_2 \cdot \left(C_1^x\right)^{-1} \bmod p = C_2 \cdot \left(C_1^{p - 1 - x}\right) \bmod p$$

#### 4. Đường cong Elliptic (ECC) trên trường hữu hạn $\mathbb{Z}_p$: $E_p(a, b): y^2 \equiv x^3 + ax + b \pmod p$
- **Điều kiện đường cong không suy biến:** $\Delta = 4a^3 + 27b^2 \not\equiv 0 \pmod p$.
- **Điểm đối của $P = (x_1, y_1)$:** $-P = (x_1, -y_1 \bmod p) = (x_1, p - y_1)$.
- **Quy tắc cộng hai điểm $P(x_1, y_1) + Q(x_2, y_2) = R(x_3, y_3)$:**
  - Nếu $x_1 = x_2$ và $y_1 + y_2 \equiv 0 \pmod p$ (tức $Q = -P$): $P + Q = O$ (điểm vô cùng).
  - Ngược lại, tính hệ số góc $\lambda \pmod p$:
    $$\lambda = \begin{cases} (y_2 - y_1) \cdot (x_2 - x_1)^{-1} \pmod p & \text{nếu } P \ne Q \text{ (Cộng 2 điểm phân biệt)} \\[6pt] (3x_1^2 + a) \cdot (2y_1)^{-1} \pmod p & \text{nếu } P = Q \text{ (Nhân đôi điểm } 2P\text{)} \end{cases}$$
  - Tọa độ điểm tổng $R(x_3, y_3)$:
    $$x_3 = \left(\lambda^2 - x_1 - x_2\right) \bmod p$$
    $$y_3 = \left[\lambda(x_1 - x_3) - y_1\right] \bmod p$$

---

## PHẦN 5: HÀM BĂM, MAC, HMAC & CHỮ KÝ SỐ (CHƯƠNG 4)

### 5.1. Bảng so sánh toàn diện: Hàm băm (MDC) vs. MAC/HMAC vs. Chữ ký số (Digital Signature)
| Tiêu chí | Hàm băm không khóa (**MDC**: SHA-256) | Mã xác thực thông điệp (**MAC / HMAC**) | Chữ ký số (**Digital Signature**: RSA, ECDSA) |
| :--- | :--- | :--- | :--- |
| **Khóa sử dụng** | **Không dùng khóa** ($h = H(M)$). | **Khóa đối xứng bí mật chung $K$** ($\text{tag} = \text{MAC}_K(M)$). | **Cặp khóa bất đối xứng**: Ký bằng $PR_{\text{gửi}}$, Xác thực bằng $PU_{\text{gửi}}$. |
| **Tính toàn vẹn dữ liệu** *(Data Integrity)* | Chỉ phát hiện lỗi ngẫu nhiên (hoặc khi bản thân $h$ được truyền trên kênh an toàn). | **Có** (Chống kẻ tấn công ngoài sửa đổi dữ liệu). | **Có** (Bất kỳ ai cũng kiểm tra được tính toàn vẹn). |
| **Xác thực nguồn gốc** *(Source Authentication)* | **Không** (Kẻ tấn công có thể sửa $M \to M'$ và tự tính lại $H(M')$). | **Có** (Giữa hai bên tin cậy chia sẻ khóa $K$). | **Có** (Xác thực định danh người ký với mọi bên). |
| **Chống chối bỏ** *(Non-repudiation)* | **Không**. | **KHÔNG** (Vì cả người gửi và người nhận đều có khóa $K$, có thể tự tạo MAC). | **CÓ** (Chỉ duy nhất người gửi có $PR_{\text{gửi}}$ để tạo chữ ký). |
| **Tốc độ xử lý** | **Nhanh nhất** (Cực nhanh). | **Rất nhanh** (Gần tương đương hàm băm). | **Chậm** (Phải băm $H(M)$ trước rồi mới ký trên $H(M)$). |

### 5.2. Ba tính chất của Hàm băm đầu ra $n\text{ bit}$ & Nghịch lý Ngày sinh (Birthday Paradox)
1. **Tính một chiều (Preimage Resistance):** Cho $h$, tìm $x$ sao cho $H(x) = h \implies$ Độ phức tạp **$\approx 2^n$**.
2. **Kháng đụng độ yếu (Second Preimage / Weak Collision Resistance):** Cho trước $x$, tìm $y \ne x$ sao cho $H(y) = H(x) \implies$ Độ phức tạp **$\approx 2^n$**.
3. **Kháng đụng độ mạnh (Strong Collision Resistance):** Tìm cặp $(x, y)$ bất kỳ ($x \ne y$) sao cho $H(x) = H(y)$:
   - Để **chắc chắn $100\%$ ($P = 1$)** có đụng độ (Nguyên lý Dirichlet): Cần **$2^n + 1$** bản băm.
   - Để xác suất có đụng độ **$\ge 50\%$ ($P \ge 0.5$ — Nghịch lý Ngày sinh)**: Chỉ cần **$\approx 1.18 \times 2^{n/2} \approx \mathbf{2^{n/2}}$** bản băm!
- **Công thức HMAC chuẩn (RFC 2104):**
  $$\text{HMAC}_K(M) = H\Big((K^+ \oplus \text{opad}) \;\parallel\; H\big((K^+ \oplus \text{ipad}) \parallel M\big)\Big)$$
  *(Giải quyết triệt để lỗ hổng **Length Extension Attack** của cấu trúc $H(K \parallel M)$).*

---

## PHẦN 6: XÁC THỰC DANH TÍNH & QUẢN LÝ KHÓA (CHƯƠNG 5 & 6)

### 6.1. Bốn cấp độ lưu trữ mật khẩu trên Server (Từ tệ nhất đến an toàn nhất)
| Cấp độ | Cách lưu trong CSDL `Users` | Rủi ro khi lộ CSDL (SQLi / Backup leak) | Đánh giá |
| :---: | :--- | :--- | :---: |
| **Mức 0** | Lưu bản rõ `Password` | Lộ 100% mật khẩu tức thì. | **Cấm tuyệt đối** |
| **Mức 1** | Lưu `Hash(Password)` (không có Salt) | Lộ ngay những ai trùng mật khẩu; Bị bẻ khóa hàng loạt tức thì bằng **Bảng cầu vồng (Rainbow Table)** hoặc 1 lần chạy Dictionary Attack. | **Không an toàn** |
| **Mức 2** | Lưu `Salt` + `SHA-256(Password || Salt)` *(Salt ngẫu nhiên duy nhất cho từng user)* | **Chống hoàn toàn Rainbow Table** và chống bẻ khóa hàng loạt nhiều user cùng lúc; nhưng 1 tài khoản mật khẩu yếu vẫn có thể bị GPU dò nhanh. | **Chuẩn đáp án MOOC IT4015** |
| **Mức 3** | Lưu `Salt` + Hàm băm chậm kéo giãn khóa: **`Argon2id` / `bcrypt` / `PBKDF2(Password, Salt, Iterations)`** | Chống cả Rainbow Table lẫn chống vét cạn bằng phần cứng chuyên dụng GPU/ASIC nhờ chi phí tính toán/RAM cao trên mỗi lần thử. | **Chuẩn công nghiệp hiện đại** |

### 6.2. Sơ đồ các giao thức Xác thực & Phân phối khóa trọng tâm

#### A. Giao thức Xác thực Thách đố – Phản hồi (Challenge-Response) chống Replay Attack
```
   Client (Alice - biết K)                           Server (Bob - biết K)
   -----------------------                           ---------------------
             | ---- 1. Yêu cầu đăng nhập (ID_Alice) ----------------> |
             |                                                        | Sinh số ngẫu nhiên mới R (Nonce)
             | <--- 2. Gửi lời thách đố: Challenge R (Nonce) -------- |
Tính Resp = HMAC_K(R)                                                 |
(hoặc Sign_{PR_A}(R))                                                 |
             | ---- 3. Gửi phản hồi: Response ----------------------> | Tự tính HMAC_K(R) (hoặc Verify_{PU_A})
             |                                                        | So khớp -> Xác thực thành công!
```

#### B. Chứng chỉ số khóa công khai X.509 (PKI — Chống Man-in-the-Middle khi trao đổi khóa)
$$\text{Cert}_A = \text{Info}_A \;\parallel\; PU_A \;\parallel\; \text{Sign}_{PR_{\text{CA}}}\Big(H\big(\text{Info}_A \parallel PU_A\big)\Big)$$
- **Kiểm tra chứng chỉ:** Người nhận dùng **Khóa công khai của CA ($PU_{\text{CA}}$)** để xác thực chữ ký của CA, kiểm tra thời hạn hiệu lực (Validity Period) và kiểm tra danh sách thu hồi chứng chỉ (**CRL** hoặc **OCSP**).
