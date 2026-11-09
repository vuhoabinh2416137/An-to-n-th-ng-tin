# ĐỀ KIỂM TRA GIỮA KỲ 2025.2 - HỌC PHẦN NHẬP MÔN AN TOÀN THÔNG TIN (IT4015)
## Chủ đề: Tình huống Bảo mật Thực tế (CIA & Nguyên tắc Thiết kế An toàn) và Tự luận Mật mã – Xác thực

> **Trường Đại học Bách khoa Hà Nội (HUST) – Trường Công nghệ Thông tin và Truyền thông (SoICT)**  
> **Học kỳ:** 2025.2  
> **Thời gian làm bài:** 70 phút *(Không sử dụng tài liệu)*  
> **Đặc điểm đề thi:** Kết hợp câu hỏi phân tích tình huống thực tế (Case Study) theo các nguyên lý an toàn thông tin kinh điển và các câu hỏi tự luận bản chất về Mật mã đối xứng, Mật mã bất đối xứng, Chế độ vận hành mã khối (CBC/CTR) và Xác thực mật khẩu với Salt.

---

## PHẦN I: NGUYÊN VĂN ĐỀ KIỂM TRA GIỮA KỲ 2025.2

**Câu 1 (2,5 điểm) – Phân tích tình huống thực tế:**  
Trong quy chế coi thi Tốt nghiệp THPT Quốc gia, sau khi kết thúc giờ làm bài của mỗi môn thi tự luận, cán bộ coi thi thực hiện thu bài, kiểm đếm đủ số tờ giấy thi và cho vào **túi đựng bài thi**. Sau đó, túi đựng bài thi được dán kín bằng một **nhãn niêm phong chuyên dụng** (loại tem vỡ/keo đặc biệt không thể bóc ra dán lại mà không làm rách nhãn). Trên nhãn niêm phong bắt buộc phải có **chữ ký trực tiếp của cả hai cán bộ coi thi (CBCT số 1 và CBCT số 2)** cùng **chữ ký của 01 thí sinh đại diện trong phòng thi**, viết đè lên phần tiếp giáp giữa nhãn niêm phong và mép túi đựng bài thi. Túi bài thi sau đó được bàn giao cho Điểm trưởng điểm thi để vận chuyển về Hội đồng chấm thi.

Dưới góc nhìn của học phần **An toàn thông tin**, anh/chị hãy:
1. Phân tích quy trình niêm phong túi bài thi trên nhằm đảm bảo những mục tiêu nào trong tam giác an toàn thông tin **CIA (Confidentiality, Integrity, Availability)** và các dịch vụ an toàn mở rộng? Giải thích rõ cơ chế vật lý nào tương ứng với từng mục tiêu đó.
2. Phân tích các **Nguyên tắc thiết kế an toàn hệ thống (Security Design Principles của Saltzer & Schroeder)** đã được áp dụng trong quy trình trên (như *Phân tách đặc quyền / Kiểm soát kép*, *Phát hiện can thiệp*, *Trách nhiệm giải trình / Chống chối bỏ*...). Liên hệ quy trình vật lý này với các cơ chế mật mã tương đương trong không gian số (hàm băm, chữ ký số, đa chữ ký).

**Câu 2 (2,0 điểm) – Nguyên lý Kerckhoffs và So sánh Hệ mật:**  
1. Phát biểu **Nguyên lý Kerckhoffs (Kerckhoffs's Principle)** trong mật mã học. Tại sao trong thiết kế hệ thống an toàn hiện đại, người ta luôn tuân theo nguyên lý này thay vì giữ bí mật thuật toán (*Security by Obscurity*)?
2. So sánh **Mật mã khóa đối xứng (Symmetric-Key Cryptography - SKC)** và **Mật mã khóa công khai (Public-Key Cryptography - PKC)** theo các tiêu chí: số lượng khóa, bài toán phân phối khóa, tốc độ xử lý, độ dài khóa tương đương mức an toàn, và phạm vi ứng dụng. Tại sao trong thực tế (như TLS/HTTPS) người ta không dùng riêng RSA hay riêng AES mà phải kết hợp cả hai trong mô hình **Mã hóa lai (Hybrid Encryption)**?

**Câu 3 (2,0 điểm) – Mật mã dòng One-Time Pad (Vernam) và Chế độ vận hành mã khối (CBC vs CTR):**  
1. Giải thích tại sao hệ mật **One-Time Pad (OTP / Vernam)** được chứng minh là có độ an toàn tuyệt đối (*Unconditional / Perfect Secrecy*), nhưng lại rất khó áp dụng rộng rãi trong thực tế? Chứng minh toán học lỗ hổng xảy ra khi người gửi vô tình sử dụng lại cùng một khóa $K$ cho hai thông điệp khác nhau.
2. So sánh hai chế độ vận hành mã khối phổ biến nhất là **CBC (Cipher Block Chaining)** và **CTR (Counter Mode)** về: công thức mã hóa/giải mã, yêu cầu đối với Vector khởi tạo ($IV$ / Nonce), khả năng tính toán song song (Parallelism), yêu cầu đệm dữ liệu (Padding) và sự lan truyền lỗi trên đường truyền.

**Câu 4 (2,0 điểm) – Lưu trữ và Xác thực Mật khẩu an toàn với Salt:**  
Một hệ thống máy chủ cần lưu trữ thông tin mật khẩu của $N = 100.000$ người dùng trong cơ sở dữ liệu (Database) để phục vụ xác thực đăng nhập.
1. Phân tích rủi ro an toàn nếu hệ thống lưu mật khẩu ở dạng: (i) Văn bản rõ (*Plaintext*), (ii) Mã hóa bằng một khóa bí mật của hệ thống $E_K(PW_i)$, hoặc (iii) Chỉ lưu giá trị băm trần $H(PW_i)$. Kẻ tấn công sẽ sử dụng những kỹ thuật tấn công nào (Từ điển, Vét cạn, Bảng cầu vồng – *Rainbow Table*) khi đánh cắp được bảng cơ sở dữ liệu?
2. Trình bày cơ chế lưu trữ và xác thực mật khẩu sử dụng **Muối (Salt)**: cấu trúc bảng dữ liệu lưu trên Server, quy trình đăng ký và quy trình kiểm tra khi người dùng đăng nhập. Giải thích định lượng tại sao việc thêm một chuỗi `Salt` ngẫu nhiên dài $s$ bit (dù `Salt` được lưu công khai ngay cạnh giá trị băm) lại làm tăng độ phức tạp tấn công lên $2^s$ lần và vô hiệu hóa hoàn toàn tấn công tính sẵn (*Precomputation / Rainbow Table*).

**Câu 5 (1,5 điểm) – Bài tập tính toán nhanh tại chỗ:**  
1. Cho phép tính trong hệ mật RSA với $p = 11, q = 17, e = 7$. Tìm khóa giải mã $d$ và mã hóa thông điệp $M = 5$.
2. Trong giao thức xác thực thách đố – phản hồi (*Challenge–Response*) dùng hàm băm giữa Client $A$ và Server $S$ chia sẻ bí mật $p_A = H(PW_A)$:
   $$A \to S: ID_A \quad ; \quad S \to A: R \quad ; \quad A \to S: H(p_A \parallel R)$$
   Giao thức này chống được tấn công phát lại (*Replay Attack*) như thế nào? Điều gì xảy ra nếu kẻ tấn công đánh cắp được cơ sở dữ liệu chứa $p_A$ trên Server $S$?

---

## PHẦN II: LỜI GIẢI CHI TIẾT VÀ ĐÁP ÁN THANG ĐIỂM CHUẨN

---

### CÂU 1 (2,5 ĐIỂM): PHÂN TÍCH TÌNH HUỐNG NIÊM PHONG TÚI BÀI THI TỐT NGHIỆP THPT

#### 1. Phân tích theo Tam giác An toàn thông tin CIA và Dịch vụ an toàn (1,25 điểm)

Quy trình cho bài thi vào túi kín, dán nhãn niêm phong đặc biệt và ký đè của 3 chủ thể độc lập hướng tới các mục tiêu cốt lõi sau:

| Mục tiêu An toàn | Vai trò trong tình huống túi bài thi | Cơ chế vật lý thực thi tương ứng |
| :--- | :--- | :--- |
| **1. Tính toàn vẹn (Integrity)**<br>*(Mục tiêu quan trọng nhất)* | Đảm bảo số lượng tờ giấy thi và nội dung bài làm của thí sinh bên trong túi **không bị đánh tráo, sửa điểm, thêm/bớt tờ giấy thi** trong suốt quá trình vận chuyển từ phòng thi về Hội đồng chấm thi. | - **Kiểm đếm số tờ, số phách** ghi ngoài bìa túi trước khi đóng.<br>- **Nhãn niêm phong chuyên dụng (Tamper-evident seal):** Loại tem giòn/keo đặc biệt mà nếu ai đó cố tình bóc mở túi, nhãn sẽ bị rách hoặc để lại vết bong tróc không thể phục hồi.<br>- **Chữ ký騎縫 (ký đè qua mép nhãn và vỏ túi):** Ngăn chặn việc kẻ gian bóc toàn bộ nhãn cũ và dán một nhãn niêm phong mới lên thay thế. |
| **2. Tính bí mật (Confidentiality)** | Đảm bảo nội dung bài làm và thông tin cá nhân/số báo danh của thí sinh **không bị lộ lọt ra bên ngoài** hoặc bị người không có thẩm quyền đọc trước khi rọc phách chấm thi. | - **Túi đựng bài thi bằng giấy dày không xuyên thấu**, được dán kín hoàn toàn các mép túi.<br>- Chỉ hội đồng làm phách / chấm thi có thẩm quyền mới được phép mở túi theo quy trình. |
| **3. Tính xác thực nguồn gốc & Chống chối bỏ (Authenticity & Non-repudiation)** | Xác nhận túi bài thi này thực sự xuất phát từ đúng phòng thi đó, do đúng 2 cán bộ coi thi đó thu nhận trước sự chứng kiến của thí sinh, và không bên nào có thể chối bỏ trách nhiệm nếu xảy ra sai phạm. | - **Chữ ký tay trực tiếp và ghi rõ họ tên** của CBCT 1, CBCT 2 và đại diện thí sinh đè lên nhãn niêm phong. |
| **4. Tính sẵn sàng (Availability)** | Đảm bảo toàn bộ bài thi được bảo quản nguyên vẹn, không bị thất lạc, ướt, rách và sẵn sàng đúng thời hạn cho Hội đồng chấm thi. | - Túi bảo vệ vật lý và biên bản bàn giao trực tiếp cho Điểm trưởng điểm thi. |

---

#### 2. Phân tích các Nguyên tắc Thiết kế An toàn (Saltzer & Schroeder) và Liên hệ Mật mã số (1,25 điểm)

Quy trình niêm phong túi bài thi là một ví dụ kinh điển áp dụng xuất sắc các nguyên tắc thiết kế an toàn hệ thống:

1. **Nguyên tắc Phân tách đặc quyền (Separation of Privilege) / Kiểm soát kép (Dual Control):**
   - *Bản chất lý thuyết:* Một thao tác nhạy cảm không nên phụ thuộc vào sự tin cậy của một cá nhân duy nhất, mà phải yêu cầu sự đồng thuận/xác nhận của ít nhất hai chủ thể độc lập để chống thông đồng hoặc gian lận đơn phương.
   - *Áp dụng trong tình huống:* Nhãn niêm phong yêu cầu chữ ký của **cả 2 cán bộ coi thi** (thường đến từ 2 trường/đơn vị khác nhau) cộng thêm **1 thí sinh đại diện** (bên có lợi ích đối lập/độc lập với cán bộ coi thi). Một cán bộ coi thi đơn lẻ không thể tự ý mở túi sửa bài rồi dán nhãn mới lại vì không thể giả mạo chữ ký của cán bộ kia và của thí sinh.
2. **Nguyên tắc Phát hiện can thiệp trái phép (Tamper-Evident Design / Fail-Safe Visibility):**
   - *Bản chất lý thuyết:* Khi không thể ngăn chặn tuyệt đối việc tiếp cận vật lý trên đường vận chuyển, hệ thống phải được thiết kế sao cho **mọi hành vi can thiệp đều để lại dấu vết không thể xóa bỏ**.
   - *Áp dụng trong tình huống:* Tem niêm phong tự hủy khi bóc kết hợp nét chữ ký vắt ngang qua ranh giới giữa tem và túi giấy tạo thành một liên kết vật lý duy nhất.
3. **Nguyên tắc Trách nhiệm giải trình (Accountability) và Chống chối bỏ (Non-repudiation):**
   - *Áp dụng trong tình huống:* Mỗi cá nhân ký tên lên nhãn niêm phong đều gắn định danh cá nhân với trạng thái niêm phong của túi bài thi tại thời điểm đóng túi, tạo chuỗi hành trình bảo quản bằng chứng (*Chain of Custody*).

**Bảng ánh xạ từ Quy trình Vật lý sang Cơ chế Mật mã trong Không gian số:**

| Thành phần Vật lý (Túi bài thi) | Cơ chế Mật mã Số tương đương (Digital Cryptography) |
| :--- | :--- |
| Túi giấy dày dán kín che giấu bài thi bên trong | **Mã hóa đối xứng / bất đối xứng ($E_K(M)$):** Đảm bảo tính bí mật dữ liệu. |
| Nhãn niêm phong bị rách ngay nếu túi bị cạy mở | **Hàm băm mật mã $H(M)$ / Mã xác thực thông điệp MAC:** Hiệu ứng tuyết lở (*Avalanche Effect*) – sửa 1 bit dữ liệu làm thay đổi hoàn toàn giá trị băm. |
| Chữ ký viết đè qua mép nhãn và túi bài thi | **Chữ ký số $\text{Sig}_{PR}(H(M))$:** Gắn kết chặt chẽ chữ ký của chủ thể với đúng giá trị đại diện $H(M)$ của túi dữ liệu đó (không thể tách chữ ký từ túi này dán sang túi khác). |
| Chữ ký đồng thời của CBCT 1 + CBCT 2 + Thí sinh | **Đa chữ ký số (Multi-signature / Threshold Signature)** hoặc Chia sẻ bí mật ngưỡng (*Shamir's Secret Sharing*). |

---

### CÂU 2 (2,0 ĐIỂM): NGUYÊN LÝ KERCKHOFFS VÀ SO SÁNH SKC – PKC – HYBRID ENCRYPTION

#### 1. Nguyên lý Kerckhoffs (1,0 điểm)
- **Phát biểu Nguyên lý Kerckhoffs (Auguste Kerckhoffs, 1883 – được Claude Shannon phát biểu lại dưới dạng *"Kẻ thù biết rõ hệ thống"*):**
  > *"Một hệ thống mật mã phải an toàn ngay cả khi mọi chi tiết về hệ thống đó (thuật toán mã hóa, giải mã, cấu trúc toán học) đều được công khai cho công chúng và kẻ tấn công biết rõ, ngoại trừ duy nhất **khóa bí mật (Secret Key)**."*
- **Tại sao không giữ bí mật thuật toán (*Security by Obscurity*) mà phải tuân theo Nguyên lý Kerckhoffs?**
  1. **Không thể giữ bí mật thuật toán mãi mãi:** Thuật toán được cài đặt trong phần mềm/phần cứng phân phối cho hàng triệu thiết bị đầu cuối; kẻ tấn công dễ dàng dịch ngược mã máy (*Reverse Engineering*) hoặc thu thập từ nhân sự nội bộ để biết thuật toán.
  2. **Dễ dàng thay đổi khóa khi bị lộ:** Nếu khóa $K$ bị lộ, ta chỉ cần sinh lại một chuỗi khóa mới trong vài mili-giây. Ngược lại, nếu sự an toàn dựa vào thuật toán bí mật, khi thuật toán bị lộ, toàn bộ hạ tầng phần cứng và phần mềm của hệ thống phải đập đi xây lại với chi phí khổng lồ.
  3. **Kiểm chứng cộng đồng (Peer Review):** Chỉ khi thuật toán được công bố công khai (như chuẩn AES, SHA-256, RSA), hàng nghìn nhà mật mã học trên toàn thế giới mới cùng phân tích, kiểm thử để phát hiện sớm các lỗ hổng toán học tiềm ẩn. Các thuật toán "tự chế, giấu kín" (như thuật toán A5/1 ban đầu của GSM hay CSS của DVD) đều nhanh chóng bị phá vỡ khi bị dịch ngược.
  4. **Thuận tiện cho chuẩn hóa và tương tác (Interoperability):** Các bên khác nhau có thể dùng chung một chuẩn phần cứng/phần mềm công khai, chỉ cần thiết lập khóa riêng biệt cho từng cặp giao tiếp.

---

#### 2. So sánh Mật mã khóa đối xứng (SKC) và Mật mã khóa công khai (PKC) & Mô hình Mã hóa lai (1,0 điểm)

| Tiêu chí so sánh | Mật mã khóa đối xứng (SKC - VD: AES, DES, ChaCha20) | Mật mã khóa công khai (PKC - VD: RSA, ECC, ElGamal) |
| :--- | :--- | :--- |
| **Số lượng & Mối quan hệ khóa** | Dùng **1 khóa chung duy nhất** ($K_A = K_B = K$) cho cả mã hóa và giải mã. | Dùng **1 cặp khóa toán học** $(PU, PR)$: Khóa công khai $PU$ công bố rộng rãi, khóa riêng $PR$ giữ bí mật tuyệt đối ($PR$ không thể suy ra từ $PU$). |
| **Bài toán phân phối khóa** | **Khó mở rộng:** Cần kênh an toàn trước để chia sẻ khóa; mạng gồm $N$ người dùng cần quản lý $\frac{N(N-1)}{2} = O(N^2)$ khóa đôi một. | **Dễ mở rộng:** Không cần kênh bí mật để gửi khóa $PU$; mạng $N$ người dùng chỉ cần $N$ cặp khóa ($O(N)$). |
| **Cơ sở toán học & Tốc độ** | Dựa trên các phép thế (Substitution) và hoán vị bit (Permutation), XOR, dịch bit $\implies$ **Tốc độ cực nhanh** (nhanh hơn PKC từ $1.000$ đến $10.000$ lần). | Dựa trên các bài toán số học phức tạp (lũy thừa mô-đun số lớn trong RSA, nhân điểm đường cong Elliptic) $\implies$ **Tốc độ chậm, tốn CPU**. |
| **Chiều dài khóa (Mức an toàn 128-bit)** | Ngắn gọn: **AES-128** chỉ cần khóa dài **$128$ bit**. | Rất dài: **RSA** cần khóa dài **$3072$ bit** (hoặc ECC cần **$256$ bit**). |
| **Dịch vụ an toàn cung cấp** | Bảo mật dữ liệu khối lượng lớn, toàn vẹn và xác thực nguồn gốc (MAC), **không** cung cấp tính chống chối bỏ. | Trao đổi khóa phiên, Chữ ký số (**có tính chống chối bỏ**), mã hóa dữ liệu nhỏ. |

- **Tại sao thực tế phải kết hợp cả hai trong Mã hóa lai (Hybrid Encryption)?**
  - Nếu chỉ dùng SKC (AES): Không thể trao đổi khóa bí mật ban đầu qua mạng Internet công cộng không an toàn.
  - Nếu chỉ dùng PKC (RSA): Tốc độ quá chậm, không thể mã hóa luồng video, file lớn hay hàng nghìn gói tin mạng mỗi giây.
  - **Giải pháp Mã hóa lai (Hybrid Encryption):**
    1. Dùng **Mật mã khóa công khai (PKC - RSA/ECDH)** ở bước bắt tay đầu tiên để xác thực thực thể và trao đổi/bọc một **khóa phiên ngẫu nhiên (Session Key $K_s$)** ngắn hạn: $C_{\text{key}} = E_{PU_B}(K_s)$.
    2. Dùng **Mật mã khóa đối xứng (SKC - AES)** với khóa phiên $K_s$ đó để mã hóa toàn bộ thông điệp dữ liệu thực tế với tốc độ cao: $C_{\text{data}} = \text{AES}_{K_s}(M)$.

---

### CÂU 3 (2,0 ĐIỂM): MẬT MÃ VERNAM (OTP) VÀ SO SÁNH CHẾ ĐỘ CBC VỚI CTR

#### 1. Phân tích One-Time Pad (Vernam) và Chứng minh lỗ hổng dùng lại khóa (1,0 điểm)
- **Lý do OTP đạt độ an toàn tuyệt đối (Perfect Secrecy):**
  Với bản mã $C = P \oplus K$, trong đó khóa $K$ được sinh hoàn toàn ngẫu nhiên (phân bố đều độc lập) và có chiều dài $|K| = |P|$, thì với mọi bản mã $C$ quan sát được và mọi bản rõ giả định $P' \in \{0, 1\}^{|C|}$, luôn tồn tại duy nhất một khóa $K' = C \oplus P'$ biến $P'$ thành $C$ với xác suất bằng nhau. Do đó xác suất hậu nghiệm $P(\text{Plaintext} = P \mid \text{Ciphertext} = C) = P(\text{Plaintext} = P)$, tức là bản mã $C$ không rò rỉ bất kỳ thông tin nào về bản rõ $P$ ngay cả khi kẻ tấn công có năng lực tính toán vô hạn.
- **Lý do OTP khó áp dụng rộng rãi trong thực tế:**
  1. **Bài toán sinh khóa:** Rất khó sinh ra chuỗi số ngẫu nhiên thực sự (*True Random Numbers*) với tốc độ cao và dung lượng hàng Gigabyte/Terabyte.
  2. **Bài toán lưu trữ và phân phối khóa:** Nếu hai bên có một kênh an toàn để gửi khóa $K$ dài bằng đúng thông điệp $P$, họ thà gửi thẳng thông điệp $P$ trên kênh đó còn hơn!
  3. **Bài toán đồng bộ và quản lý khóa:** Khóa dùng xong phải hủy ngay, mất đồng bộ 1 bit sẽ làm hỏng toàn bộ phần giải mã phía sau.
- **Chứng minh lỗ hổng khi dùng lại khóa (Two-Time Pad):**
  Giả sử $C_1 = P_1 \oplus K$ và $C_2 = P_2 \oplus K$. Khi đó:
  $$C_1 \oplus C_2 = (P_1 \oplus K) \oplus (P_2 \oplus K) = P_1 \oplus P_2 \oplus (K \oplus K) = P_1 \oplus P_2$$
  Khóa $K$ bị triệt tiêu hoàn toàn! Từ $P_1 \oplus P_2$, kẻ tấn công dùng đặc trưng thống kê của ngôn ngữ tự nhiên hoặc một đoạn bản rõ đã biết (*Known Plaintext*) của $P_1$ để suy ra $P_2 = (C_1 \oplus C_2) \oplus P_1$ và thu luôn khóa $K = C_1 \oplus P_1$.

---

#### 2. Bảng so sánh chi tiết Chế độ CBC và Chế độ CTR (1,0 điểm)

| Tiêu chí so sánh | Chế độ CBC (Cipher Block Chaining) | Chế độ CTR (Counter Mode) |
| :--- | :--- | :--- |
| **Bản chất chế độ** | Chế độ **Mã khối (Block Cipher Mode)** móc xích các khối liên tiếp. | Biến mã khối thành **Mã dòng (Stream Cipher Mode)** thông qua bộ đếm. |
| **Công thức Mã hóa** | $C_i = E_K(P_i \oplus C_{i-1})$ với $C_0 = IV$. | $C_i = P_i \oplus E_K(\text{Nonce} \parallel \text{Ctr}_i)$. |
| **Công thức Giải mã** | $P_i = D_K(C_i) \oplus C_{i-1}$ *(Cần cả hàm mã hóa $E_K$ và giải mã $D_K$)*. | $P_i = C_i \oplus E_K(\text{Nonce} \parallel \text{Ctr}_i)$ *(Chỉ cần cài đặt duy nhất hàm mã hóa $E_K$!)*. |
| **Yêu cầu với $IV$ / Nonce** | $IV$ phải **không dự đoán trước được (Unpredictable / Random)** để chống tấn công chọn bản rõ (CPA). | Nonce/Counter không cần ngẫu nhiên nhưng bắt buộc **Duy nhất (Unique – tuyệt đối không bao giờ lặp lại với cùng khóa $K$)**. |
| **Khả năng tính toán song song (Parallelism)** | - **Mã hóa:** **KHÔNG** thể song song hóa (vì phải có $C_{i-1}$ mới tính được $C_i$).<br>- **Giải mã:** **CÓ** thể song song hóa (vì các $C_i$ đã có sẵn). | - **Mã hóa:** **CÓ** thể song song hóa hoàn toàn.<br>- **Giải mã:** **CÓ** thể song song hóa hoàn toàn và hỗ trợ truy cập ngẫu nhiên (*Random Access*) tới khối thứ $i$ bất kỳ. |
| **Đệm dữ liệu (Padding)** | **Bắt buộc phải Padding** (ví dụ PKCS#7) cho đủ bội số kích thước khối $b$ (dễ dẫn đến tấn công *Padding Oracle* nếu không có MAC). | **Không cần Padding** (khối cuối cùng chỉ việc cắt dòng khóa $E_K(\text{Ctr}_m)$ lấy đúng số bit bằng độ dài phần dư của bản rõ). |
| **Lan truyền lỗi khi hỏng 1 bit ở bản mã $C_i$** | Làm **hỏng hoàn toàn khối $P_i$** và làm **sai đúng 1 bit tương ứng ở khối kế tiếp $P_{i+1}$**. | **Chỉ làm sai đúng 1 bit tương ứng ở khối $P_i$**, không ảnh hưởng tới bất kỳ bit nào khác. |

---

### CÂU 4 (2,0 ĐIỂM): LƯU TRỮ VÀ XÁC THỰC MẬT KHẨU AN TOÀN VỚI SALT

#### 1. Phân tích rủi ro của 3 cách lưu trữ mật khẩu yếu (0,75 điểm)
1. **Lưu mật khẩu dạng rõ (`Plaintext`):** Nếu quản trị viên nội bộ xấu tính xem bảng DB, hoặc tin tặc khai thác lỗ hổng SQL Injection / đánh cắp file backup DB, toàn bộ mật khẩu của $100.000$ người dùng bị lộ tức thì (và nguy hiểm hơn nữa khi người dùng thường dùng chung mật khẩu cho Email, Ngân hàng).
2. **Lưu mật khẩu mã hóa đối xứng $E_K(PW_i)$ bằng khóa hệ thống $K$:** Do Server cần giải mã hoặc mã hóa tự động khi xác thực nên khóa $K$ phải lưu đâu đó trên chính Server. Khi tin tặc chiếm quyền Server và lấy được khóa $K$, hắn giải mã ngược $D_K(\cdot)$ toàn bộ $100.000$ mật khẩu trong vài giây.
3. **Chỉ lưu giá trị băm không muối $H(PW_i)$ (Unsalted Hash):**
   Dù hàm băm $H$ là hàm một chiều (không thể đảo ngược trực tiếp), cách lưu này vẫn có **2 điểm yếu chí mạng**:
   - **Thứ nhất (Lộ mật khẩu trùng nhau):** Hai người dùng bất kỳ đặt cùng một mật khẩu (ví dụ `"123456"` hoặc `"password"`) sẽ có cùng giá trị băm $H(PW_1) = H(PW_2)$ trong bảng DB.
   - **Thứ hai (Tấn công Từ điển tính sẵn & Bảng cầu vồng – Precomputed Dictionary / Rainbow Table Attack):** Kẻ tấn công chỉ cần băm sẵn một từ điển gồm $M$ mật khẩu phổ biến (ví dụ $M = 10^9$ từ) **một lần duy nhất** trước khi tấn công, rồi đem so khớp với bảng $N = 100.000$ tài khoản để phá đồng loạt tất cả tài khoản cùng lúc!

---

#### 2. Cơ chế Xác thực Mật khẩu với Muối (`Salt`) và Chứng minh định lượng (1,25 điểm)

##### a) Cấu trúc lưu trữ và Quy trình hoạt động:
- **Khi người dùng $U_i$ đăng ký (hoặc đổi mật khẩu):**
  1. Server sinh một chuỗi ngẫu nhiên mới hoàn toàn `Salt_i` có độ dài $s$ bit (ví dụ $s = 128$ bit) riêng biệt cho người dùng $U_i$.
  2. Server ghép `Salt_i` với mật khẩu $PW_i$ và tính hàm băm: $h_i = H(PW_i \parallel \text{Salt}_i)$ (thực tế dùng hàm băm chậm lặp nhiều vòng như PBKDF2, bcrypt, Argon2).
  3. Server lưu bản ghi vào Database gồm 3 trường:
     $$\begin{array}{|c|c|c|}
     \hline
     \textbf{User ID } (ID_i) & \textbf{Salt } (\text{Salt}_i \text{ - Lưu dạng rõ}) & \textbf{Salted Hash } h_i = H(PW_i \parallel \text{Salt}_i) \\
     \hline
     \end{array}$$
- **Khi người dùng $U_i$ đăng nhập:**
  1. Người dùng gửi $(ID_i, PW')$ qua kênh TLS.
  2. Server truy vấn DB theo $ID_i$ để lấy cặp $(\text{Salt}_i, h_i)$.
  3. Server tính $h' = H(PW' \parallel \text{Salt}_i)$ và so sánh: Nếu $h' == h_i$ thì xác thực thành công; ngược lại từ chối.

##### b) Giải thích định lượng tại sao `Salt` (dù lưu công khai dạng rõ) lại cực kỳ hiệu quả:
1. **Triệt tiêu hiện tượng trùng giá trị băm:** Hai người dùng đặt cùng một mật khẩu giống hệt nhau ($PW_1 = PW_2$) nhưng có hai muối ngẫu nhiên khác nhau ($\text{Salt}_1 \neq \text{Salt}_2$) sẽ tạo ra hai giá trị băm hoàn toàn khác nhau:
   $$H(PW \parallel \text{Salt}_1) \neq H(PW \parallel \text{Salt}_2)$$
2. **Vô hiệu hóa hoàn toàn Bảng cầu vồng (Rainbow Tables) và Tấn công tính sẵn (Precomputation):**
   - Với `Salt` dài $s$ bit (ví dụ $s = 64$ bit hoặc $128$ bit), có tới $2^s$ giá trị `Salt` khác nhau.
   - Nếu kẻ tấn công muốn lập bảng từ điển tính sẵn cho $M$ mật khẩu phổ biến trước khi biết `Salt`, hắn phải tính và lưu trữ bảng kích thước:
     $$\text{Kích thước bảng tính sẵn} = M \times 2^s \quad (\text{tăng gấp } 2^s \text{ lần!})$$
     Với $s = 128$ bit, $2^{128} \approx 3,4 \times 10^{38}$ bảng cầu vồng – bất khả thi về mặt vật lý để tính trước và lưu trữ!
3. **Buộc kẻ tấn công phải phá từng tài khoản một sau khi đánh cắp DB (Tăng chi phí tấn công $N$ tài khoản lên $N$ lần):**
   - Khi không có `Salt`: Để thử $M$ mật khẩu trong từ điển trên toàn bộ $N = 100.000$ người dùng, kẻ tấn công chỉ cần tính đúng **$M$ phép băm**.
   - Khi mỗi người dùng có một `Salt_i` riêng: Vì `Salt_i` của mỗi người là khác nhau, một phép băm $H(\text{word} \parallel \text{Salt}_1)$ chỉ kiểm tra được cho duy nhất người dùng thứ nhất mà không dùng lại được cho người dùng thứ hai! Để kiểm tra từ điển $M$ từ trên cả $N$ người dùng, kẻ tấn công phải thực hiện:
     $$\text{Số phép băm} = N \times M = 100.000 \times M \text{ phép băm}$$

---

### CÂU 5 (1,5 ĐIỂM): BÀI TẬP TÍNH TOÁN NHANH TẠI CHỖ

#### 1. Bài toán RSA với $p = 11, q = 17, e = 7, M = 5$ (0,75 điểm)
- Tính mô-đun $n$ và hàm Euler $\phi(n)$:
  $$n = p \times q = 11 \times 17 = 187$$
  $$\phi(n) = (p - 1)(q - 1) = 10 \times 16 = 160$$
- Tìm khóa giải mã $d = e^{-1} \pmod{\phi(n)} = 7^{-1} \pmod{160}$ bằng thuật toán Euclid mở rộng:
  - $160 = 22 \times 7 + 6 \implies r_1 = 6, \; t_1 = 0 - 22(1) = -22$
  - $7 = 1 \times 6 + 1 \implies r_2 = 1, \; t_2 = 1 - 1(-22) = 23$
  Vậy $\gcd(7, 160) = 1$ và khóa giải mã là:
  $$\boxed{d = 23} \quad (\text{Kiểm tra: } 7 \times 23 = 161 = 1 \times 160 + 1 \equiv 1 \pmod{160})$$
- Mã hóa thông điệp $M = 5$:
  $$C = M^e \bmod n = 5^7 \bmod 187$$
  Tính nhanh theo nhị phân ($7 = 111_2$):
  - $5^2 = 25$
  - $5^3 = 125 \equiv -62 \pmod{187}$
  - $5^6 = (5^3)^2 \equiv (-62)^2 = 3844 = 20 \times 187 + 104 \equiv 104 \pmod{187}$
  - $5^7 = 5^6 \times 5 \equiv 104 \times 5 = 520 = 2 \times 187 + 146 \equiv \mathbf{146} \pmod{187}$
  $$\implies \boxed{C = 146}$$

#### 2. Phân tích giao thức xác thực Challenge–Response $A \to S: H(p_A \parallel R)$ (0,75 điểm)
- **Cách chống tấn công phát lại (Replay Attack):**
  Ở mỗi phiên đăng nhập mới, Server $S$ sinh một số thách đố ngẫu nhiên mới $R$ (*Nonce – Number used once*). Dù kẻ nghe lén bắt được cặp $(R_{\text{old}}, H(p_A \parallel R_{\text{old}}))$ ở phiên trước, sang phiên mới Server gửi thách đố $R_{\text{new}} \neq R_{\text{old}}$. Do tính một chiều và kháng va chạm của hàm băm $H$, kẻ tấn công không biết $p_A$ nên không thể tính được $H(p_A \parallel R_{\text{new}})$ từ giá trị cũ.
- **Điểm yếu khi Server bị đánh cắp cơ sở dữ liệu chứa $p_A = H(PW_A)$ (Stolen Verifier Attack):**
  Để kiểm tra xem phản hồi của Client có đúng bằng $H(p_A \parallel R)$ hay không, Server $S$ buộc phải lưu giá trị $p_A = H(PW_A)$ trong Database của mình. Trong giao thức này, $p_A$ đóng vai trò **tương đương mật khẩu gốc (Password-Equivalent)**: nếu kẻ tấn công đột nhập Server và lấy cắp được $p_A$, hắn **không cần phải tốn công dò tìm $PW_A$** mà có thể dùng trực tiếp $p_A$ để tính $H(p_A \parallel R)$ và mạo danh $A$ đăng nhập thành công ngay lập tức!
