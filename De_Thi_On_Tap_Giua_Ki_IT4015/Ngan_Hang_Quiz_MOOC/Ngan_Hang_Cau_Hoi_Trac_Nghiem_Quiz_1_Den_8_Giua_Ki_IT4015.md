# NGÂN HÀNG 75 CÂU HỎI TRẮC NGHIỆM & CÂU HỎI MẪU GIỮA KỲ IT4015 (QUIZ 1 – 8 MOOC SOICT.DAOTAO.AI)
## Có Đáp Án & Giải Thích Chi Tiết Từng Câu (Chương 1 đến Chương 6)

> **Tài liệu ôn tập trọng tâm:** Tổng hợp đầy đủ các câu hỏi trắc nghiệm lý thuyết & bài tập ngắn xuất hiện trong các bài Quiz tuần (Quiz 1 đến Quiz 8) và Đề kiểm tra giữa kỳ trên hệ thống `soict.daotao.ai` học phần **IT4015 – Nhập môn An toàn thông tin** (theo chuẩn slide bài giảng của TS. Nguyễn Khanh Văn và TS. Bùi Trọng Tùng – Trường CNTT&TT, ĐHBK Hà Nội).

---

## CHỦ ĐỀ 1: TỔNG QUAN AN TOÀN THÔNG TIN, MỐI ĐE DỌA & NGUYÊN TẮC THIẾT KẾ (CÂU 1 – 15)

### Câu 1: Ba thuộc tính cốt lõi của Tam giác CIA (CIA Triad) trong an toàn thông tin bao gồm:
- **A.** Confidentiality (Tính bí mật), Integrity (Tính toàn vẹn), Availability (Tính sẵn sàng).
- **B.** Confidentiality (Tính bí mật), Identification (Định danh), Authentication (Xác thực).
- **C.** Control (Kiểm soát), Integrity (Tính toàn vẹn), Authorization (Ủy quyền).
- **D.** Cryptography (Mật mã), Intrusion Detection (Phát hiện xâm nhập), Auditing (Kiểm toán).
> **Đáp án:** **A**
> **Giải thích:** Tam giác CIA là nền tảng của ATTT: **Confidentiality** (chỉ người có thẩm quyền mới đọc được dữ liệu), **Integrity** (dữ liệu không bị sửa đổi trái phép), **Availability** (hệ thống và dữ liệu luôn sẵn sàng phục vụ người dùng hợp pháp khi cần).

### Câu 2: Theo mô hình mở rộng Parkerian Hexad hoặc AAA, ba thuộc tính thường được bổ sung thêm bên cạnh CIA là gì?
- **A.** Authenticity (Tính xác thực), Non-repudiation (Tính chống chối bỏ), Accountability (Tính trách nhiệm giải trình).
- **B.** Speed (Tốc độ), Scalability (Khả năng mở rộng), Reliability (Độ tin cậy).
- **C.** Encryption (Mã hóa), Hashing (Băm), Signing (Ký số).
- **D.** Firewall (Tường lửa), IDS, IPS.
> **Đáp án:** **A**
> **Giải thích:** Ngoài CIA, một hệ thống an toàn cần đảm bảo **Authenticity** (xác thực nguồn gốc/danh tính), **Non-repudiation** (người gửi/nhận không thể phủ nhận hành vi đã thực hiện) và **Accountability** (mọi hành động đều quy được trách nhiệm cụ thể qua nhật ký audit log).

### Câu 3: Phân biệt chính xác giữa **Lỗ hổng (Vulnerability)**, **Mối đe dọa (Threat)** và **Tấn công (Attack)**:
- **A.** Lỗ hổng là điểm yếu trong hệ thống; Mối đe dọa là nguy cơ/tác nhân tiềm ẩn có thể khai thác lỗ hổng để gây hại; Tấn công là hành động thực tế khai thác lỗ hổng đó.
- **B.** Lỗ hổng và Mối đe dọa là hai khái niệm hoàn toàn đồng nghĩa.
- **C.** Mối đe dọa là lỗi lập trình phần mềm, còn Lỗ hổng là hacker bên ngoài.
- **D.** Tấn công luôn xảy ra trước khi xuất hiện Lỗ hổng.
> **Đáp án:** **A**
> **Giải thích:** **Asset** (Tài sản) có **Vulnerability** (Điểm yếu/Lỗ hổng). **Threat** (Mối đe dọa) là hoàn cảnh/tác nhân có khả năng gây tổn hại. Khi kẻ tấn công thực thi hành vi khai thác (Exploit) lỗ hổng thì đó là **Attack** (Cuộc tấn công). **Risk** (Rủi ro) = $\text{Threat} \times \text{Vulnerability} \times \text{Asset Value}$.

### Câu 4: Hành vi nào sau đây được xếp vào loại **Tấn công thụ động (Passive Attack)**?
- **A.** Nghe lén gói tin (Eavesdropping / Sniffing) và phân tích lưu lượng mạng (Traffic Analysis).
- **B.** Giả mạo địa chỉ IP (Masquerade / Spoofing) để gửi lệnh trái phép.
- **C.** Chặn bắt và sửa đổi nội dung gói tin chuyển tiền (Modification of messages).
- **D.** Tấn công từ chối dịch vụ phân tán (DDoS) làm sập máy chủ web.
> **Đáp án:** **A**
> **Giải thích:** **Tấn công thụ động (Passive Attack)** chỉ quan sát, thu thập thông tin mà **không làm thay đổi** dữ liệu hay ảnh hưởng đến hoạt động của hệ thống (gồm *Release of message contents* và *Traffic analysis*). Các phương án B, C, D đều làm thay đổi dữ liệu hoặc trạng thái hệ thống nên là **Tấn công chủ động (Active Attack)**.

### Câu 5: Tại sao các cuộc **Tấn công thụ động (Passive Attacks)** lại rất khó bị phát hiện nhưng có thể phòng chống hiệu quả, trong khi **Tấn công chủ động (Active Attacks)** lại dễ phát hiện nhưng khó ngăn chặn tuyệt đối?
- **A.** Vì tấn công thụ động không để lại dấu vết sửa đổi nào trên gói tin/hệ thống, nhưng chỉ cần dùng **mã hóa (Encryption)** là kẻ nghe lén không đọc được nội dung.
- **B.** Vì tấn công thụ động làm nghẽn băng thông mạng ngay lập tức.
- **C.** Vì tấn công chủ động không bao giờ làm thay đổi dữ liệu.
- **D.** Vì tường lửa chỉ chặn được tấn công thụ động.
> **Đáp án:** **A**
> **Giải thích:** Theo giáo trình Stallings & slide thầy Nguyễn Khanh Văn: Tấn công thụ động trọng tâm là **Phòng ngừa (Prevention)** bằng mã hóa; Tấn công chủ động trọng tâm là **Phát hiện & Khôi phục (Detection & Recovery)** bằng MAC, Chữ ký số, IDS/IPS.

### Câu 6: Bốn hình thức điển hình của **Tấn công chủ động (Active Attacks)** theo phân loại chuẩn của William Stallings là gì?
- **A.** Giả mạo (Masquerade), Phát lại (Replay), Sửa đổi thông điệp (Modification of messages), và Từ chối dịch vụ (Denial of Service - DoS).
- **B.** Nghe lén (Sniffing), Quét cổng (Port Scanning), Phân tích lưu lượng (Traffic Analysis), và Giải mã.
- **C.** Sao lưu (Backup), Khôi phục (Restore), Kiểm toán (Audit), và Cấp quyền (Grant).
- **D.** Băm (Hashing), Ký số (Signing), Trao đổi khóa (Key Exchange), và Xác thực (Authentication).
> **Đáp án:** **A**
> **Giải thích:** Bốn nhóm tấn công chủ động kinh điển gồm:
> 1. **Masquerade** (Giả mạo danh tính).
> 2. **Replay** (Bắt gói tin hợp lệ cũ và phát lại để trục lợi).
> 3. **Modification of messages** (Sửa đổi, chèn, xóa hoặc đảo thứ tự thông điệp).
> 4. **Denial of Service - DoS** (Làm gián đoạn hoặc tê liệt dịch vụ).

### Câu 7: Tấn công từ chối dịch vụ (DoS / DDoS) xâm phạm trực tiếp nhất đến thuộc tính nào trong tam giác CIA?
- **A.** Confidentiality (Tính bí mật).
- **B.** Integrity (Tính toàn vẹn).
- **C.** Availability (Tính sẵn sàng).
- **D.** Non-repudiation (Tính chống chối bỏ).
> **Đáp án:** **C**
> **Giải thích:** DoS/DDoS làm cạn kiệt tài nguyên (CPU, RAM, băng thông) khiến người dùng hợp lệ không thể truy cập dịch vụ $\implies$ Phá vỡ **Tính sẵn sàng (Availability)**.

### Câu 8: Cuộc tấn công **Man-in-the-Middle (MitM — Kẻ đứng giữa)** khi hai bên trao đổi khóa công khai không có chứng chỉ số thuộc loại tấn công nào?
- **A.** Tấn công thụ động thuần túy.
- **B.** Tấn công chủ động (kết hợp chặn bắt, giả mạo danh tính cả hai đầu và thay đổi thông điệp trao đổi khóa).
- **C.** Tấn công vật lý vào ổ cứng.
- **D.** Tấn công vét cạn không gian khóa đối xứng.
> **Đáp án:** **B**
> **Giải thích:** Trong MitM, kẻ tấn công chủ động chặn khóa công khai của Alice gửi cho Bob và thay bằng khóa của chính mình (và ngược lại), từ đó giải mã, đọc/sửa toàn bộ luồng giao tiếp giữa hai bên.

### Câu 9: Nguyên tắc **"Đặc quyền tối thiểu" (Principle of Least Privilege)** trong thiết kế hệ thống an toàn phát biểu rằng:
- **A.** Mọi người dùng và tiến trình chỉ nên được cấp những quyền hạn tối thiểu thực sự cần thiết để hoàn thành nhiệm vụ của mình (và chỉ trong khoảng thời gian cần thiết).
- **B.** Quản trị viên hệ thống (Admin/Root) không bao giờ được phép đăng nhập vào máy chủ.
- **C.** Tất cả nhân viên trong cùng phòng ban phải có quyền truy cập ngang nhau vào mọi cơ sở dữ liệu.
- **D.** Hệ thống chỉ nên dùng một mật khẩu duy nhất cho mọi dịch vụ để giảm chi phí quản lý.
> **Đáp án:** **A**
> **Giải thích:** Least Privilege giúp giới hạn thiệt hại (blast radius) nếu một tài khoản hoặc tiến trình bị kẻ tấn công chiếm quyền điều khiển hoặc cài mã độc.

### Câu 10: Nguyên tắc **"Phòng thủ theo chiều sâu" (Defense in Depth / Layered Security)** có ý nghĩa là gì?
- **A.** Chỉ cần đầu tư toàn bộ ngân sách vào một bức tường lửa (Firewall) mạnh nhất ở biên mạng là đủ.
- **B.** Triển khai nhiều lớp bảo vệ độc lập, chồng lấp nhau (mạng, máy chủ, ứng dụng, dữ liệu, con người) sao cho nếu một lớp bị xuyên thủng thì lớp tiếp theo vẫn ngăn chặn được kẻ tấn công.
- **C.** Giấu kín mã nguồn phần mềm không cho ai biết.
- **D.** Mã hóa dữ liệu 10 lần liên tiếp bằng cùng một thuật toán.
> **Đáp án:** **B**
> **Giải thích:** Không có giải pháp bảo mật đơn lẻ nào là hoàn hảo 100%; Defense in Depth kết hợp nhiều rào cản (Firewall + IDS/IPS + Authentication + Access Control + Encryption + Backup).

### Câu 11: Nguyên tắc **"Thiết kế mở" (Open Design)** của Saltzer & Schroeder tương đồng trực tiếp với nguyên lý mật mã nào?
- **A.** Nguyên lý Kerckhoffs (Độ an toàn không phụ thuộc vào việc giấu kín thiết kế/thuật toán mà phụ thuộc vào khóa bí mật).
- **B.** Bảo mật dựa trên sự mập mờ (Security by Obscurity).
- **C.** Nghịch lý ngày sinh (Birthday Paradox).
- **D.** Nguyên lý chuồng bồ câu (Pigeonhole Principle).
> **Đáp án:** **A**
> **Giải thích:** Open Design khẳng định thiết kế của cơ chế bảo mật nên được công khai để cộng đồng chuyên gia kiểm chứng, đánh giá lỗ hổng (như chuẩn AES, SHA-256, RSA).

### Câu 12: Nguyên tắc **"Mặc định an toàn" (Fail-Safe Defaults)** yêu cầu hệ thống xử lý như thế nào?
- **A.** Các quyết định cấp quyền truy cập phải dựa trên sự cho phép tường minh (Explicit Permission / Whitelist); mặc định khi chưa cấu hình hoặc khi hệ thống gặp sự cố là **Từ chối truy cập (Deny by default)**.
- **B.** Khi tường lửa bị lỗi phần mềm, nó phải mở toàn bộ các cổng để không làm gián đoạn mạng của công ty.
- **C.** Tài khoản mới tạo mặc định có quyền Administrator, sau đó quản trị viên sẽ thu hồi dần các quyền không dùng.
- **D.** Không cần kiểm tra quyền ở những lần truy cập tiếp theo sau lần đầu tiên.
> **Đáp án:** **A**
> **Giải thích:** Mặc định phải là *Deny All*, chỉ mở những gì được phép tường minh (*Whitelist*).

### Câu 13: Khi đánh giá rủi ro (Risk Management), có 4 chiến lược xử lý rủi ro cơ bản gồm:
- **A.** Giảm thiểu/Kiểm soát (Mitigate/Reduce), Chuyển giao (Transfer/Share - ví dụ mua bảo hiểm hoặc thuê ngoài), Chấp nhận (Accept/Retain), và Né tránh (Avoid - ngừng hoạt động gây rủi ro).
- **B.** Xóa bỏ hoàn toàn 100% rủi ro, Phớt lờ rủi ro, Tấn công lại hacker, và Đóng cửa công ty.
- **C.** Mã hóa, Băm, Ký số, và Cấp chứng chỉ.
- **D.** Sao lưu, Phục hồi, Kiểm thử, và Lập trình.
> **Đáp án:** **A**
> **Giải thích:** Rủi ro không bao giờ có thể triệt tiêu về $0$ tuyệt đối, do đó tổ chức phải lựa chọn giữa **Mitigate** (triển khai biện pháp kỹ thuật giảm rủi ro), **Transfer** (chuyển giao qua bảo hiểm/bên thứ 3), **Accept** (chấp nhận nếu chi phí bảo vệ lớn hơn thiệt hại), hoặc **Avoid** (loại bỏ tính năng/hoạt động chứa rủi ro).

### Câu 14: Mối quan hệ đúng giữa ba khái niệm **Identification (Định danh)**, **Authentication (Xác thực)** và **Authorization (Ủy quyền / Cấp phép)** là gì?
- **A.** Identification (Bạn tuyên bố bạn là ai, VD: nhập `username`) $\to$ Authentication (Chứng minh tuyên bố đó là thật, VD: nhập `password`/OTP) $\to$ Authorization (Kiểm tra xem danh tính đã xác thực đó được phép làm gì trên tài nguyên nào).
- **B.** Authorization luôn thực hiện trước Authentication.
- **C.** Authentication và Authorization là hai từ đồng nghĩa.
- **D.** Identification là quá trình kiểm tra quyền đọc/ghi file.
> **Đáp án:** **A**
> **Giải thích:** Chuỗi kiểm soát truy cập chuẩn luôn tuân theo thứ tự: **Identification $\to$ Authentication $\to$ Authorization ($\to$ Accounting/Auditing)**.

### Câu 15: Trong phân loại các biện pháp kiểm soát an toàn (Security Controls), Hệ thống phát hiện xâm nhập (**IDS — Intrusion Detection System**) và Camera giám sát thuộc nhóm kiểm soát nào?
- **A.** Kiểm soát phòng ngừa (Preventive Control).
- **B.** Kiểm soát phát hiện (Detective Control).
- **C.** Kiểm soát khắc phục (Corrective Control).
- **D.** Kiểm soát vật lý thuần túy.
> **Đáp án:** **B**
> **Giải thích:** **Firewall / IPS / Encryption** là *Preventive* (ngăn chặn trước khi xảy ra); **IDS / Log Auditing / CCTV** là *Detective* (phát hiện và cảnh báo khi đang hoặc đã xảy ra sự cố); **Backup Restore / Patching** là *Corrective* (khắc phục hậu quả).

---

## CHỦ ĐỀ 2: MẬT MÃ CỔ ĐIỂN, MẬT MÃ KHÓA ĐỐI XỨNG & CÁC CHẾ ĐỘ HOẠT ĐỘNG (CÂU 16 – 33)

### Câu 16: Hai phép biến đổi nguyên thủy cơ bản nhất dùng để xây dựng hầu hết các hệ mật mã khối đối xứng hiện đại (theo Claude Shannon) là gì?
- **A.** Phép Thay thế (Substitution — tạo tính *Confusion / Làm rối*) và Phép Hoán vị (Permutation / Transposition — tạo tính *Diffusion / Khuếch tán*).
- **B.** Phép Lũy thừa modulo và Phép Logarit rời rạc.
- **C.** Phép Băm một chiều và Phép Ký số.
- **D.** Phép Nén dữ liệu và Phép Mã hóa Base64.
> **Đáp án:** **A**
> **Giải thích:**
> - **Confusion (Làm rối — qua Substitution / S-box):** Làm lu mờ mối liên hệ thống kê giữa **khóa $K$** và **bản mã $C$**.
> - **Diffusion (Khuếch tán — qua Permutation / P-box / MixColumns):** Phân tán cấu trúc thống kê của **bản rõ $M$** ra khắp bản mã $C$ (1 bit bản rõ thay đổi làm khoảng $50\%$ số bit bản mã thay đổi — Hiệu ứng tuyết lở *Avalanche Effect*).

### Câu 17: Hệ mật mã **Caesar** $E_k(x) = (x + k) \pmod{26}$ trên bảng chữ cái tiếng Anh dễ bị phá vỡ nhất bởi phương pháp nào và tại sao?
- **A.** Tấn công vét cạn (Brute-force Attack) vì không gian khóa quá nhỏ, chỉ có đúng $25$ khóa khác tầm thường ($k \in \{1, \dots, 25\}$), hoặc phân tích tần suất chữ cái.
- **B.** Tấn công ngày sinh (Birthday Attack).
- **C.** Phân tích thừa số nguyên tố số lớn.
- **D.** Tấn công tràn bộ đệm (Buffer Overflow).
> **Đáp án:** **A**
> **Giải thích:** Với 25 khóa khả dĩ, việc thử toàn bộ khóa bằng tay hoặc máy tính chỉ mất chưa đến một phần triệu giây.

### Câu 18: Trong hệ mật **Affine** $E(x) = (ax + b) \pmod{26}$, cặp giá trị nào sau đây của $(a, b)$ là một **KHÓA HỢP LỆ**?
- **A.** $a = 4, b = 7$
- **B.** $a = 13, b = 5$
- **C.** $a = 7, b = 10$
- **D.** $a = 6, b = 3$
> **Đáp án:** **C**
> **Giải thích:** Khóa $(a, b)$ hợp lệ trên $\mathbb{Z}_{26}$ khi và chỉ khi $\gcd(a, 26) = 1$.
> - $a = 4 \implies \gcd(4, 26) = 2 \ne 1$ (Loại).
> - $a = 13 \implies \gcd(13, 26) = 13 \ne 1$ (Loại).
> - $a = 6 \implies \gcd(6, 26) = 2 \ne 1$ (Loại).
> - $a = 7 \implies \gcd(7, 26) = 1$ (Hợp lệ, với $7^{-1} \bmod 26 = 15$ vì $7 \times 15 = 105 = 4 \times 26 + 1$).

### Câu 19: Điểm khác biệt bản chất giúp hệ mật **Vigenère** an toàn hơn hệ mật **Caesar** và **Monoalphabetic (Thay thế đơn bảng)** là gì?
- **A.** Vigenère là hệ mật **thay thế đa bảng (Polyalphabetic Substitution Cipher)** sử dụng từ khóa lặp lại độ dài $m$, khiến cùng một chữ cái trong bản rõ ở các vị trí khác nhau có thể được mã hóa thành các chữ cái bản mã khác nhau, làm phẳng phổ tần suất chữ cái đơn lẻ.
- **B.** Vigenère sử dụng phép nhân ma trận cấp $n \times n$.
- **C.** Vigenère là hệ mật khóa công khai.
- **D.** Vigenère không thể bị phá vỡ ngay cả khi từ khóa ngắn.
> **Đáp án:** **A**
> **Giải thích:** Tuy nhiên nếu biết độ dài khóa $m$ (qua kiểm tra Kasiski hoặc chỉ số trùng hợp Index of Coincidence), hệ mật Vigenère sẽ bị tách thành $m$ hệ mật Caesar độc lập và bị giải mã bằng thống kê tần suất.

### Câu 20 (Câu hỏi tính toán chuẩn MOOC): Trong hệ mật **Vernam / One-Time Pad (OTP)**, phép mã hóa và giải mã đều thực hiện bằng phép toán **XOR ($\oplus$)** từng bit giữa bản rõ $m$ và khóa $k$: $c = m \oplus k$. Giả sử thu được chuỗi bit bản mã $c = \mathtt{01010011}$ và biết khóa $k = \mathtt{00110001}$. Bản rõ $m$ tương ứng là gì?
- **A.** $m = \mathtt{01100010}$
- **B.** $m = \mathtt{00010001}$
- **C.** $m = \mathtt{01110011}$
- **D.** $m = \mathtt{10011101}$
> **Đáp án:** **A**
> **Giải thích:** Tính chất của phép XOR ($\oplus$): $0 \oplus 0 = 0, 1 \oplus 1 = 0, 0 \oplus 1 = 1, 1 \oplus 0 = 1$, và $m = c \oplus k$:
> $$\begin{array}{rcc} c = & \mathtt{01010011} \\ \oplus \quad k = & \mathtt{00110001} \\ \hline m = & \mathbf{\mathtt{01100010}} \end{array}$$

### Câu 21: Điều kiện cần và đủ để hệ mật **One-Time Pad (OTP)** đạt được **Độ an toàn tuyệt đối (Perfect Secrecy / Unconditional Security)** theo chứng minh của Claude Shannon là gì?
- **A.** Khóa $k$ phải thực sự ngẫu nhiên (truly random), có độ dài tối thiểu bằng độ dài bản rõ ($|k| \ge |m|$), được giữ bí mật hoàn toàn và **chỉ sử dụng đúng một lần duy nhất (never reused)**.
- **B.** Khóa $k$ chỉ cần dài 128 bit và sinh từ hàm giả ngẫu nhiên PRNG rồi lặp lại.
- **C.** Khóa $k$ có thể dùng lại cho 2 văn bản khác nhau miễn là văn bản ngắn.
- **D.** Thuật toán XOR được giữ bí mật.
> **Đáp án:** **A**
> **Giải thích:** Nếu tái sử dụng khóa OTP cho 2 bản rõ $m_1, m_2$ (**Two-Time Pad**), kẻ tấn công lấy $c_1 \oplus c_2 = (m_1 \oplus k) \oplus (m_2 \oplus k) = m_1 \oplus m_2$ làm triệt tiêu hoàn toàn khóa $k$ và dễ dàng khôi phục $m_1, m_2$!

### Câu 22: Sắp xếp các mô hình tấn công thám mã (Cryptanalysis Attacks) sau theo thứ tự **kẻ tấn công có ngày càng nhiều thông tin/quyền năng hơn** (từ khó nhất đối với kẻ tấn công đến dễ nhất đối với kẻ tấn công):
1. **COA** (Ciphertext-Only Attack — Chỉ biết bản mã).
2. **KPA** (Known-Plaintext Attack — Biết một số cặp bản rõ - bản mã).
3. **CPA** (Chosen-Plaintext Attack — Được chọn bản rõ và lấy bản mã tương ứng).
4. **CCA** (Chosen-Ciphertext Attack — Được chọn bản mã và lấy bản rõ giải mã tương ứng).
- **A.** $\text{COA} \to \text{KPA} \to \text{CPA} \to \text{CCA}$
- **B.** $\text{CCA} \to \text{CPA} \to \text{KPA} \to \text{COA}$
- **C.** $\text{KPA} \to \text{COA} \to \text{CCA} \to \text{CPA}$
- **D.** $\text{COA} \to \text{CPA} \to \text{KPA} \to \text{CCA}$
> **Đáp án:** **A**
> **Giải thích:** Một hệ mật hiện đại đạt chuẩn tối thiểu phải chống được **CPA** (như CBC/CTR với IV ngẫu nhiên) và chuẩn cao nhất trong thực tế là chống được **CCA / CCA2** (như AES-GCM hoặc RSA-OAEP). Hệ mật mã nào **không có tính ngẫu nhiên hóa (Deterministic)** — tức cùng một bản rõ luôn cho ra cùng một bản mã (như chế độ **ECB** hoặc **Textbook RSA**) — thì **KHÔNG BAO GIỜ an toàn trước tấn công CPA**!

### Câu 23: Đặc điểm nổi bật nhất của mạng cấu trúc **Feistel (Feistel Cipher Structure)** được sử dụng trong thuật toán **DES** là gì?
- **A.** Quá trình giải mã có cấu trúc hoàn toàn giống hệt quá trình mã hóa (chỉ cần đảo ngược thứ tự các khóa vòng $K_{16}, K_{15}, \dots, K_1$), và hàm vòng $F$ **không cần phải là hàm khả nghịch**.
- **B.** Hàm vòng $F$ bắt buộc phải là một song ánh khả nghịch thì mới giải mã được.
- **C.** Mỗi vòng xử lý toàn bộ 128 bit cùng một lúc bằng phép nhân ma trận trên trường $GF(2^8)$.
- **D.** Không sử dụng bất kỳ hộp S-box nào.
> **Đáp án:** **A**
> **Giải thích:** Trong mạng Feistel:
> - Mã hóa vòng $i$: $L_i = R_{i-1}$ và $R_i = L_{i-1} \oplus F(R_{i-1}, K_i)$.
> - Giải mã khôi phục ngay lập tức: $R_{i-1} = L_i$ và $L_{i-1} = R_i \oplus F(L_i, K_i)$ nhờ tính chất tự triệt tiêu của phép XOR ($A \oplus B \oplus B = A$), bất chấp hàm $F$ có khả nghịch hay không!

### Câu 24: Thông số kỹ thuật chính xác của chuẩn mã hóa dữ liệu **DES (Data Encryption Standard)** là gì?
- **A.** Kích thước khối $64\text{ bit}$, kích thước khóa đầu vào $64\text{ bit}$ nhưng kích thước khóa hiệu dụng thực tế là **$56\text{ bit}$** (do $8\text{ bit}$ dùng để kiểm tra chẵn lẻ - parity bits), gồm **$16\text{ vòng}$** Feistel.
- **B.** Kích thước khối $128\text{ bit}$, khóa $128\text{ bit}$, $10\text{ vòng}$.
- **C.** Kích thước khối $64\text{ bit}$, khóa hiệu dụng $112\text{ bit}$, $32\text{ vòng}$.
- **D.** Kích thước khối $56\text{ bit}$, khóa $64\text{ bit}$, $8\text{ vòng}$.
> **Đáp án:** **A**
> **Giải thích:** Điểm yếu chí mạng khiến DES bị khai tử là chiều dài khóa hiệu dụng chỉ có **$56\text{ bit}$** (không gian khóa $2^{56} \approx 7.2 \times 10^{16}$), đã bị máy chuyên dụng Deep Crack phá vỡ bằng vét cạn trong chưa đầy 24 giờ vào năm 1998.

### Câu 25: Tại sao người ta không dùng **Double DES (2DES)**: $C = E_{K_2}(E_{K_1}(P))$ với hai khóa $56\text{ bit}$ độc lập mà phải chuyển sang dùng **Triple DES (3DES)**: $C = E_{K_3}(D_{K_2}(E_{K_1}(P)))$?
- **A.** Vì 2DES bị tấn công **Gặp nhau ở giữa (Meet-in-the-Middle Attack)** làm giảm độ phức tạp tìm khóa từ $2^{112}$ xuống chỉ còn $\approx \mathbf{2^{57}}$ phép mã hóa (kèm bộ nhớ lưu trữ $2^{56}$ khối trung gian), gần như không an toàn hơn DES đơn!
- **B.** Vì 2DES không thể giải mã được bản mã về bản rõ.
- **C.** Vì 2DES chạy chậm hơn 3DES.
- **D.** Vì 3DES dùng cấu trúc khóa công khai RSA.
> **Đáp án:** **A**
> **Giải thích:** Với một cặp $(P, C)$ biết trước (KPA), kẻ tấn công tính bảng $X = E_{K_1}(P)$ với mọi $K_1 \in \{0,1\}^{56}$ ($2^{56}$ bước, lưu vào bảng băm) và tính ngược $Y = D_{K_2}(C)$ với mọi $K_2 \in \{0,1\}^{56}$ để so khớp $X = Y$. Tổng số phép tính chỉ là $2^{56} + 2^{56} = 2^{57}$! Ngoài ra, cấu trúc **EDE** ($E_{K_3} - D_{K_2} - E_{K_1}$) của 3DES giúp tương thích ngược với DES đơn khi đặt $K_1 = K_2 = K_3 = K$.

### Câu 26: Chuẩn mã hóa tiên tiến **AES (Advanced Encryption Standard — thuật toán Rijndael)** có kích thước khối dữ liệu và các mức độ dài khóa chuẩn là bao nhiêu?
- **A.** Kích thước khối cố định là **$128\text{ bit}$** ($16\text{ bytes}$, biểu diễn dưới dạng ma trận trạng thái $4 \times 4\text{ bytes}$); độ dài khóa hỗ trợ **128 bit (10 vòng)**, **192 bit (12 vòng)**, hoặc **256 bit (14 vòng)**.
- **B.** Kích thước khối thay đổi theo khóa là 128, 192, 256 bit; dùng mạng Feistel 16 vòng.
- **C.** Kích thước khối 64 bit, khóa 128 bit, 16 vòng.
- **D.** Kích thước khối 256 bit, khóa 512 bit, 20 vòng.
> **Đáp án:** **A**
> **Giải thích:** AES **không dùng mạng Feistel** mà dùng mạng **SPN (Substitution-Permutation Network)** trên trường hữu hạn $\text{GF}(2^8)$. Mỗi vòng chuẩn của AES gồm 4 bước khả nghịch: **SubBytes** (S-box phi tuyến), **ShiftRows** (dịch hàng), **MixColumns** (nhân ma trận cột trên $\text{GF}(2^8)$, bỏ qua ở vòng cuối cùng) và **AddRoundKey** (XOR với khóa vòng).

### Câu 27: Chế độ hoạt động mã khối nào sau đây mã hóa độc lập từng khối bản rõ $C_i = E_K(P_i)$, dẫn đến nhược điểm nghiêm trọng là **hai khối bản rõ giống hệt nhau sẽ tạo ra hai khối bản mã giống hệt nhau** (lộ nguyên hình dáng bức ảnh cánh cụt Tux)?
- **A.** **ECB** (Electronic Codebook).
- **B.** **CBC** (Cipher Block Chaining).
- **C.** **CFB** (Cipher Feedback).
- **D.** **CTR** (Counter Mode).
> **Đáp án:** **A**
> **Giải thích:** **ECB** không dùng Vector khởi tạo ($IV$) và không có sự phụ thuộc giữa các khối, nên nó hoàn toàn tất định (deterministic), làm lộ mẫu dữ liệu lặp lại và **không chống được tấn công CPA**.

### Câu 28: Trong chế độ **CBC (Cipher Block Chaining)** với công thức mã hóa $C_i = E_K(P_i \oplus C_{i-1})$ (với $C_0 = IV$), khẳng định nào sau đây là **ĐÚNG** về khả năng xử lý song song?
- **A.** Quá trình **Mã hóa (Encryption) phải thực hiện tuần tự** (vì muốn tính $C_i$ phải chờ có $C_{i-1}$), nhưng quá trình **Giải mã (Decryption) $P_i = D_K(C_i) \oplus C_{i-1}$ có thể thực hiện SONG SONG hoàn toàn**!
- **B.** Cả mã hóa và giải mã đều thực hiện song song được.
- **C.** Mã hóa thực hiện song song được, còn giải mã phải tuần tự.
- **D.** Cả mã hóa và giải mã đều bắt buộc phải thực hiện tuần tự.
> **Đáp án:** **A**
> **Giải thích:** Khi giải mã CBC, người nhận đã có sẵn toàn bộ các khối bản mã $C_0, C_1, C_2, \dots, C_n$, nên có thể chia cho nhiều nhân CPU giải mã $P_i = D_K(C_i) \oplus C_{i-1}$ cùng một lúc!

### Câu 29: Trong chế độ **CBC**, nếu trong quá trình truyền tin trên mạng, khối bản mã **$C_2$ bị lỗi 1 bit** (nhưng các khối bản mã khác giữ nguyên), thì khi người nhận giải mã sẽ có những khối bản rõ nào bị ảnh hưởng?
- **A.** Chỉ duy nhất khối bản rõ $P_2$ bị hỏng.
- **B.** Khối bản rõ **$P_2$ bị hỏng hoàn toàn** (ngẫu nhiên hóa khoảng 50% số bit) và khối bản rõ kế tiếp **$P_3$ chỉ bị đảo đúng 1 bit tại vị trí tương ứng**; từ khối $P_4$ trở đi hoàn toàn không bị ảnh hưởng!
- **C.** Toàn bộ các khối từ $P_2, P_3, \dots, P_n$ đến hết văn bản đều bị hỏng hoàn toàn.
- **D.** Không có khối bản rõ nào bị lỗi nhờ cơ chế tự sửa lỗi.
> **Đáp án:** **B**
> **Giải thích:** Nhìn vào công thức giải mã CBC:
> - $P_2 = D_K(C_2) \oplus C_1$: Do $C_2$ đi qua hàm giải mã khối $D_K(\cdot)$, hiệu ứng tuyết lở làm $D_K(C_2)$ thay đổi hoàn toàn $\implies P_2$ hỏng hoàn toàn.
> - $P_3 = D_K(C_3) \oplus C_2$: Do $C_3$ đúng nên $D_K(C_3)$ đúng, khi XOR trực tiếp với $C_2$ (bị sai 1 bit) thì $P_3$ chỉ bị sai đúng 1 bit tại vị trí đó.
> - $P_4 = D_K(C_4) \oplus C_3$: Không hề chứa $C_2 \implies$ Tự phục hồi hoàn toàn từ $P_4$!

### Câu 30: Những chế độ hoạt động nào sau đây biến một **Mã khối (Block Cipher)** thành một **Mã dòng (Stream Cipher)** và **chỉ sử dụng hàm Mã hóa $E_K(\cdot)$ của mã khối cho cả hai chiều Mã hóa lẫn Giải mã** (không bao giờ cần gọi hàm giải mã $D_K$)?
- **A.** ECB và CBC.
- **B.** **CFB** (Cipher Feedback), **OFB** (Output Feedback) và **CTR** (Counter Mode).
- **C.** Chỉ có ECB.
- **D.** Chỉ có CBC và ECB.
> **Đáp án:** **B**
> **Giải thích:** Trong cả 3 chế độ **CFB, OFB, CTR**, bản rõ $P_i$ đều được kết hợp bằng phép **XOR ($\oplus$)** ở bên ngoài với đầu ra của hàm mã hóa khối $E_K(\cdot)$: $C_i = P_i \oplus E_K(\text{Input}_i)$. Do đó khi giải mã, người nhận chỉ cần tính lại đúng luồng khóa $E_K(\text{Input}_i)$ rồi XOR với $C_i$: $P_i = C_i \oplus E_K(\text{Input}_i)$!

### Câu 31: Chế độ hoạt động nào hiện nay được ưa chuộng nhất trong các giao thức mạng tốc độ cao (như TLS 1.3 / AES-GCM, IPsec) vì cho phép **xử lý song song cả chiều Mã hóa lẫn chiều Giải mã**, hỗ trợ **truy cập ngẫu nhiên (Random Access)** tới bất kỳ khối thứ $i$ nào, và không cần đệm (Padding)?
- **A.** ECB (Electronic Codebook).
- **B.** CBC (Cipher Block Chaining).
- **C.** **CTR** (Counter Mode).
- **D.** OFB (Output Feedback).
> **Đáp án:** **C**
> **Giải thích:** Trong chế độ **CTR**, mỗi khối thứ $i$ được mã hóa bằng bộ đếm độc lập: $C_i = P_i \oplus E_K(\text{Nonce} \parallel \text{Counter}_i)$. Vì $\text{Counter}_i = \text{Counter}_0 + i$ biết trước cho mọi $i$, ta có thể tính song song mọi khối ở cả hai chiều mã hóa và giải mã, đồng thời giải mã ngay khối thứ $1000$ mà không cần tính 999 khối đầu.

### Câu 32: Yêu cầu an toàn đối với **Vector khởi tạo ($IV$)** trong chế độ **CBC** là gì?
- **A.** $IV$ phải được giữ bí mật tuyệt đối như khóa $K$.
- **B.** $IV$ không cần giữ bí mật (có thể gửi kèm công khai cùng bản mã), nhưng bắt buộc phải **không dự đoán trước được (Unpredictable / Random)** đối với mỗi phiên mã hóa mới để chống tấn công Chosen-Plaintext Attack (CPA).
- **C.** $IV$ luôn được gán cố định bằng toàn bit `0` cho mọi bản tin.
- **D.** $IV$ phải là một số nguyên tố lớn.
> **Đáp án:** **B**
> **Giải thích:** Nếu $IV$ có thể đoán trước (như lỗi BEAST attack trong TLS 1.0 dùng khối bản mã cuối của gói tin trước làm $IV$ cho gói tin sau), kẻ tấn công thực hiện CPA có thể chọn bản rõ $P_1 = IV_{\text{đoán}} \oplus IV_{\text{cũ}} \oplus P_{\text{mục tiêu}}$ để kiểm tra giả thuyết về bản rõ.

### Câu 33: Nếu một hệ thống có $N$ người dùng muốn liên lạc bảo mật từng đôi một (pairwise communication) bằng **Mật mã khóa đối xứng** (mỗi cặp người dùng cần 1 khóa bí mật riêng biệt), thì tổng số khóa cần quản lý và phân phối trong toàn mạng là bao nhiêu?
- **A.** $N$ khóa.
- **B.** $2N$ khóa.
- **C.** $\dfrac{N(N - 1)}{2}$ khóa (tăng bậc hai $O(N^2)$).
- **D.** $N^2$ khóa.
> **Đáp án:** **C**
> **Giải thích:** Với $N$ đỉnh trên đồ thị đầy đủ $K_N$, số cạnh (số cặp khóa đối xứng) là $\binom{N}{2} = \frac{N(N-1)}{2}$ (ví dụ $N = 1000$ người $\implies 499,500$ khóa). Ngược lại, nếu dùng **Mật mã khóa công khai**, mỗi người chỉ cần 1 cặp khóa (Public, Private) $\implies$ Toàn hệ thống chỉ cần **$N$ cặp khóa** ($2N$ khóa)!

---

## CHỦ ĐỀ 3: MẬT MÃ KHÓA CÔNG KHAI — RSA, DIFFIE-HELLMAN, ELGAMAL, ECC & PKI (CÂU 34 – 48)

### Câu 34: Phát biểu nào sau đây phân biệt **ĐÚNG** về ưu/nhược điểm và ứng dụng kết hợp của **Mật mã khóa đối xứng (Symmetric)** và **Mật mã khóa công khai (Asymmetric / Public-Key)** trong thực tế (Hệ mật lai — Hybrid Cryptosystem như TLS/HTTPS, PGP)?
- **A.** Mật mã khóa công khai nhanh hơn mật mã đối xứng 1000 lần nên dùng để mã hóa file dung lượng lớn.
- **B.** Mật mã khóa công khai (RSA, DH, ECDH) rất chậm nhưng giải quyết triệt để bài toán **trao đổi khóa bí mật trên kênh không an toàn và chữ ký số**; sau khi thiết lập xong **Khóa phiên (Session Key)**, hai bên chuyển sang dùng **Mật mã khóa đối xứng (AES)** để mã hóa luồng dữ liệu chính với tốc độ cực cao.
- **C.** Mật mã khóa đối xứng cung cấp sẵn tính năng chống chối bỏ trước tòa án.
- **D.** Cả hai hệ mật đều dùng chung một khóa cho cả mã hóa và giải mã.
> **Đáp án:** **B**
> **Giải thích:** Đây là kiến trúc **Mã hóa lai (Hybrid Encryption / Digital Envelope)** kinh điển trong mọi giao thức thực tế.

### Câu 35: Độ an toàn của hệ mật **RSA** dựa trên độ khó tính toán của bài toán toán học nào?
- **A.** Bài toán phân tích một hợp số nguyên dương rất lớn $n = p \cdot q$ ra các thừa số nguyên tố (Integer Factorization Problem — IFP) và bài toán khai căn bậc $e$ theo modulo $n$.
- **B.** Bài toán Logarit rời rạc trên trường hữu hạn $\mathbb{Z}_p^*$ (Discrete Logarithm Problem — DLP).
- **C.** Bài toán tìm đường đi ngắn nhất trên đồ thị.
- **D.** Bài toán giải hệ phương trình tuyến tính.
> **Đáp án:** **A**
> **Giải thích:** Biết khóa công khai $(e, n)$, muốn tìm khóa bí mật $d = e^{-1} \pmod{\phi(n)}$ kẻ tấn công cần biết $\phi(n) = (p-1)(q-1)$, điều này tương đương về mặt độ phức tạp tính toán với việc phân tích $n = p \cdot q$.

### Câu 36: Trong hệ mật **RSA** với $n = p \cdot q$, điều kiện toán học bắt buộc khi chọn số mũ công khai $e$ và số mũ bí mật $d$ là gì?
- **A.** $1 < e < \phi(n)$ sao cho $\gcd(e, \phi(n)) = 1$, và $d \equiv e^{-1} \pmod{\phi(n)}$ (tức là $e \cdot d \equiv 1 \pmod{(p-1)(q-1)}$).
- **B.** $\gcd(e, n) = 1$ và $e + d = \phi(n)$.
- **C.** $e$ phải luôn là số chẵn và $d = \phi(n) / e$.
- **D.** $e \cdot d \equiv 1 \pmod n$.
> **Đáp án:** **A**
> **Giải thích:** Nhờ Định lý Euler ($M^{\phi(n)} \equiv 1 \pmod n$) và Định lý phần dư Trung Hoa (CRT), khi $e \cdot d = 1 + k \cdot \phi(n)$ thì $(M^e)^d = M^{ed} \equiv M \pmod n$ với mọi $M \in \mathbb{Z}_n$.

### Câu 37: Tại sao **RSA thuần túy (Textbook RSA)** $C = M^e \pmod n$ lại **KHÔNG an toàn trước tấn công bản rõ được chọn (CPA)** và **tấn công bản mã được chọn (CCA)**, và giải pháp chuẩn trong thực tế là gì?
- **A.** Vì Textbook RSA là hàm tất định (cùng $M$ luôn ra cùng $C$, dễ bị thử vét cạn khi miền giá trị $M$ nhỏ) và có tính chất nhân tính $(M_1 M_2)^e \equiv C_1 C_2 \pmod n$ (dễ bị tấn công CCA mù - Blinding Attack). Giải pháp chuẩn là dùng đệm ngẫu nhiên **OAEP (Optimal Asymmetric Encryption Padding — PKCS#1 v2)** trước khi mã hóa!
- **B.** Vì RSA không thể dùng khóa dài hơn 512 bit.
- **C.** Vì phép lũy thừa modulo không có nghịch đảo.
- **D.** Giải pháp là giảm số mũ $e$ xuống bằng $1$.
> **Đáp án:** **A**
> **Giải thích:** Trong thực tế không bao giờ dùng Textbook RSA trực tiếp; để mã hóa phải dùng **RSA-OAEP** (có chèn chuỗi ngẫu nhiên seed), và để ký số phải dùng **RSA-PSS** (Probabilistic Signature Scheme).

### Câu 38: Giao thức trao đổi khóa **Diffie-Hellman (DH)** trên nhóm nhân $\mathbb{Z}_p^*$ có độ an toàn dựa trên bài toán khó nào?
- **A.** Bài toán phân tích thừa số nguyên tố (IFP).
- **B.** Bài toán Logarit rời rạc (Discrete Logarithm Problem — DLP) và Bài toán Computational Diffie-Hellman (CDH): Cho biết $p, g, A = g^a \bmod p$ và $B = g^b \bmod p$, tìm khóa chung $K = g^{ab} \bmod p$.
- **C.** Bài toán xếp ba lô (Knapsack Problem).
- **D.** Bài toán tìm đụng độ hàm băm.
> **Đáp án:** **B**
> **Giải thích:** Kẻ nghe lén trên đường truyền thu được công khai $(p, g, A = g^a \bmod p, B = g^b \bmod p)$. Để tìm được $K = g^{ab} \bmod p$, kẻ tấn công phải giải bài toán Logarit rời rạc $a = \text{Dlog}_g(A) \pmod p$.

### Câu 39 (Câu hỏi tính toán nhanh Diffie-Hellman): Alice và Bob thống nhất tham số công khai $p = 23$ và phần tử sinh $g = 5$. Alice chọn khóa bí mật $a = 6$, Bob chọn khóa bí mật $b = 15$. Hỏi giá trị công khai $A$ của Alice gửi cho Bob và khóa phiên chung $K_{AB}$ là bao nhiêu?
- **A.** $A = 8$ và $K_{AB} = 2$.
- **B.** $A = 19$ và $K_{AB} = 10$.
- **C.** $A = 6$ và $K_{AB} = 15$.
- **D.** $A = 12$ và $K_{AB} = 21$.
> **Đáp án:** **A**
> **Giải thích:**
> - Alice tính $A = g^a \bmod p = 5^6 \bmod 23$:
>   Ta có $5^2 = 25 \equiv 2 \pmod{23} \implies 5^6 = (5^2)^3 \equiv 2^3 = \mathbf{8} \pmod{23}$.
> - Bob tính $B = g^b \bmod p = 5^{15} \bmod 23 = (5^2)^7 \cdot 5 \equiv 2^7 \cdot 5 = 128 \times 5 \equiv 13 \times 5 = 65 \equiv 19 \pmod{23}$.
> - Khóa phiên chung:
>   $$K_{AB} = A^b \bmod 23 = 8^{15} \bmod 23 = (2^3)^{15} \bmod 23 = 2^{45} \bmod 23$$
>   Theo định lý Fermat nhỏ, $2^{22} \equiv 1 \pmod{23} \implies 2^{45} = (2^{22})^2 \cdot 2^1 \equiv 1^2 \cdot 2 = \mathbf{2} \pmod{23}$.

### Câu 40: Điểm yếu lớn nhất của giao thức **Diffie-Hellman nguyên bản (Anonymous Diffie-Hellman)** là gì và cách khắc phục?
- **A.** Không xác thực danh tính của hai đầu giao tiếp (không biết $A = g^a \bmod p$ thực sự đến từ Alice hay từ kẻ tấn công Darth), nên rất dễ bị tấn công **Man-in-the-Middle (MitM)**. Cách khắc phục: Kết hợp với **Chữ ký số** hoặc **Chứng chỉ số khóa công khai (PKI / X.509 Certificate)** để xác thực các giá trị trao đổi (Authenticated DH / STS Protocol).
- **B.** Khóa chung của Alice và Bob tính ra không bằng nhau.
- **C.** Bắt buộc phải gửi khóa bí mật $a, b$ qua mạng.
- **D.** Chỉ hoạt động được khi $p$ là hợp số chẵn.
> **Đáp án:** **A**
> **Giải thích:** Diffie-Hellman nguyên bản không có cơ chế xác thực nguồn gốc thông điệp trao đổi khóa.

### Câu 41: Trong hệ mật khóa công khai **ElGamal** trên $\mathbb{Z}_p^*$ (với khóa công khai của người nhận là $(p, g, y = g^x \bmod p)$ và khóa bí mật là $x$), khi mã hóa một bản rõ $M$, người gửi chọn số ngẫu nhiên tạm thời (ephemeral key) $k \in \{1, \dots, p-2\}$ và tạo ra bản mã gồm cặp $(C_1, C_2) = (g^k \bmod p, M \cdot y^k \bmod p)$. Tại sao **tuyệt đối không được dùng lại cùng một số ngẫu nhiên $k$** để mã hóa hai bản rõ $M_1, M_2$ khác nhau?
- **A.** Vì nếu dùng lại $k$, hai bản mã sẽ có cùng $C_1 = g^k \bmod p$, và kẻ tấn công biết được thương số $\dfrac{C_{2}^{(1)}}{C_{2}^{(2)}} \equiv \dfrac{M_1 \cdot y^k}{M_2 \cdot y^k} \equiv M_1 \cdot M_2^{-1} \pmod p$; nếu biết $M_1$ sẽ lập tức tìm ra ngay $M_2$ mà không cần biết khóa bí mật $x$!
- **B.** Vì dùng lại $k$ làm máy tính bị treo.
- **C.** Vì dùng lại $k$ sẽ làm thay đổi số nguyên tố $p$.
- **D.** Vì ElGamal không cho phép $M_1 \ne M_2$.
> **Đáp án:** **A**
> **Giải thích:** Ngoài ra trong hệ mật ElGamal, do có thêm thành phần ngẫu nhiên $C_1 = g^k \bmod p$, kích thước bản mã luôn **gấp đôi** kích thước bản rõ ($|C| = 2|M|$), nhưng đổi lại ElGamal có tính ngẫu nhiên hóa tự nhiên (cùng bản rõ $M$ mỗi lần mã hóa cho ra bản mã khác nhau $\implies$ chống CPA).

### Câu 42: Ưu điểm vượt trội nhất của **Mật mã đường cong Elliptic (ECC — Elliptic Curve Cryptography)** so với **RSA** và **Diffie-Hellman truyền thống** là gì?
- **A.** Cung cấp **cùng một mức độ an toàn mật mã nhưng với kích thước khóa nhỏ hơn rất nhiều** (ví dụ khóa **ECC 256-bit** có độ an toàn tương đương khóa **RSA 3072-bit** và tương đương khóa đối xứng **AES 128-bit**), giúp tiết kiệm băng thông, bộ nhớ và tăng tốc độ tính toán trên thiết bị di động/IoT.
- **B.** ECC không cần dùng bất kỳ phép toán số học modulo nào.
- **C.** ECC có thể mã hóa mà không cần khóa.
- **D.** ECC dựa trên bài toán phân tích thừa số nguyên tố.
> **Đáp án:** **A**
> **Giải thích:** Bài toán Logarit rời rạc trên đường cong Elliptic (**ECDLP**: Cho điểm cơ sở $G$ và điểm $Q = kG$, tìm số nguyên $k$) khó hơn rất nhiều so với DLP trên $\mathbb{Z}_p^*$ và IFP của RSA (chỉ có thuật Pollard's rho độ phức tạp $O(\sqrt{p}) = O(2^{n/2})$, không có thuật toán dưới mũ Index Calculus như RSA/DH).

### Câu 43: Trên đường cong Elliptic $E_p(a, b): y^2 \equiv x^3 + ax + b \pmod p$ (với điều kiện không suy biến $4a^3 + 27b^2 \not\equiv 0 \pmod p$), cho điểm $P = (x_P, y_P)$. Điểm đối (nghịch đảo cộng) $-P$ của điểm $P$ qua trục hoành có tọa độ là gì?
- **A.** $-P = (x_P, -y_P \bmod p) = (x_P, p - y_P)$.
- **B.** $-P = (-x_P \bmod p, -y_P \bmod p)$.
- **C.** $-P = (-x_P \bmod p, y_P)$.
- **D.** $-P = (y_P, x_P)$.
> **Đáp án:** **A**
> **Giải thích:** Trên đường cong Elliptic $y^2 \equiv x^3 + ax + b \pmod p$, hai điểm $P(x_P, y_P)$ và $-P(x_P, -y_P \bmod p)$ có cùng hoành độ $x_P$ nên đường thẳng đi qua chúng là đường thẳng đứng cắt đường cong tại điểm vô cùng $O$ (phần tử đơn vị): $P + (-P) = O$.

### Câu 44: Trong hạ tầng khóa công khai **PKI (Public Key Infrastructure)**, vai trò chính của tổ chức cấp phát chứng chỉ số **CA (Certificate Authority)** và nội dung của một **Chứng chỉ số (Digital Certificate chuẩn X.509)** là gì?
- **A.** Chứng chỉ số chứa **Tên định danh của chủ thể (Subject ID) + Khóa công khai của chủ thể ($PU_{\text{Subject}}$) + Thời hạn hiệu lực**, được **ký số bởi Khóa bí mật của CA ($PR_{\text{CA}}$)** nhằm gắn kết đáng tin cậy danh tính chủ thể với khóa công khai của họ, chống tấn công giả mạo MitM.
- **B.** Chứng chỉ số chứa Khóa bí mật ($PR_{\text{Subject}}$) của người dùng để gửi cho mọi người.
- **C.** CA là máy chủ dùng để giải mã mọi gói tin của người dùng trên Internet.
- **D.** Chứng chỉ số được ký bằng khóa công khai của CA ($PU_{\text{CA}}$).
> **Đáp án:** **A**
> **Giải thích:** Công thức tạo chứng chỉ số của Alice do CA cấp:
> $$\text{Cert}_A = \left[\text{Info}_A \parallel PU_A \parallel \text{Sign}_{PR_{\text{CA}}}\big(H(\text{Info}_A \parallel PU_A)\big)\right]$$
> Bất kỳ ai (như trình duyệt web của Bob) có sẵn khóa công khai gốc của CA ($PU_{\text{CA}}$ cài sẵn trong OS/Browser) đều có thể xác thực chữ ký của CA trên $\text{Cert}_A$ để tin tưởng rằng $PU_A$ đích thực là của Alice! **Chứng chỉ số tuyệt đối KHÔNG bao giờ chứa khóa bí mật!**

### Câu 45: Khi khóa bí mật của một máy chủ web bị lộ trước khi chứng chỉ số hết hạn (Expiration Date), quản trị viên phải yêu cầu CA thu hồi chứng chỉ đó. Hai cơ chế chuẩn trong PKI để trình duyệt kiểm tra xem một chứng chỉ số có bị thu hồi hay chưa là gì?
- **A.** **CRL** (Certificate Revocation List — Danh sách chứng chỉ bị thu hồi) và **OCSP** (Online Certificate Status Protocol — Giao thức kiểm tra trạng thái chứng chỉ trực tuyến).
- **B.** DNS và DHCP.
- **C.** ARP và ICMP.
- **D.** ECB và CBC.
> **Đáp án:** **A**
> **Giải thích:** **CRL** là danh sách định kỳ do CA ký và công bố chứa số Serial của các chứng chỉ đã bị thu hồi; **OCSP** cho phép trình duyệt truy vấn thời gian thực trạng thái của một chứng chỉ cụ thể (`Good`, `Revoked`, `Unknown`).

### Câu 46: Để gửi một bức thư điện tử $M$ cho Bob đảm bảo **ĐỒNG THỜI cả 3 tính chất: Bí mật (Confidentiality), Toàn vẹn (Integrity) và Chống chối bỏ (Non-repudiation)** bằng hệ mật khóa công khai, Alice phải thực hiện theo trình tự nào (**Sign-then-Encrypt**)?
- **A.** Alice dùng **Khóa bí mật của Alice ($PR_A$)** để ký lên giá trị băm của bức thư tạo chữ ký $S = \text{Sign}_{PR_A}(H(M))$, sau đó ghép $(M \parallel S)$ và mã hóa bằng **Khóa công khai của Bob ($PU_B$)***(hoặc mã hóa bằng khóa phiên AES $K_s$ rồi mã hóa $K_s$ bằng $PU_B$)*.
- **B.** Alice mã hóa $M$ bằng $PR_A$, sau đó ký bằng $PU_B$.
- **C.** Alice mã hóa $M$ bằng $PU_A$, sau đó ký bằng $PR_B$.
- **D.** Alice chỉ cần băm $H(M)$ rồi gửi kèm $M$.
> **Đáp án:** **A**
> **Giải thích:**
> 1. Ký bằng **$PR_A$** (chỉ mình Alice có) $\implies$ Xác thực nguồn gốc từ Alice + Toàn vẹn + Chống chối bỏ.
> 2. Mã hóa bằng **$PU_B$** (chỉ mình Bob có $PR_B$ để giải mã) $\implies$ Đảm bảo tính Bí mật (chỉ Bob đọc được).

### Câu 47: Trong bài toán phân phối khóa đối xứng (Symmetric Key Distribution) dùng trung tâm phân phối khóa tin cậy **KDC (Key Distribution Center — ví dụ giao thức Needham-Schroeder / Kerberos)**, tại sao trong gói tin vé (Ticket) phản hồi từ KDC lại phải đính kèm **Số ngẫu nhiên dùng một lần $N_1$ (Nonce)** hoặc **Nhãn thời gian (Timestamp)**?
- **A.** Để chống lại **Tấn công phát lại (Replay Attack)**: đảm bảo bức điện phân phối khóa phiên $K_s$ là hoàn toàn mới thuộc về phiên yêu cầu hiện tại chứ không phải là một bức điện cũ bị kẻ tấn công ghi âm lại từ quá khứ.
- **B.** Để làm tăng kích thước gói tin cho đủ bội số của 64 bit.
- **C.** Để thay thế hoàn toàn cho khóa chủ (Master Key).
- **D.** Để giúp thuật toán chạy nhanh hơn.
> **Đáp án:** **A**
> **Giải thích:** Nếu không có Nonce $N_1$ hoặc Timestamp, kẻ tấn công có thể bắt lại gói tin cấp khóa phiên cũ đã bị lộ khóa $K_s$ và phát lại (Replay) để đánh lừa Alice/Bob sử dụng lại khóa phiên cũ đó.

### Câu 48: Tính chất **Bảo mật chuyển tiếp hoàn hảo (Perfect Forward Secrecy — PFS / Forward Secrecy)** trong các giao thức trao đổi khóa (như Ephemeral Diffie-Hellman — **DHE / ECDHE** trong TLS 1.3) có ý nghĩa là gì?
- **A.** Ngay cả khi khóa bí mật dài hạn (Long-term Private Key trong chứng chỉ RSA/ECDSA của máy chủ) bị lộ trong tương lai, kẻ tấn công đã ghi âm lại toàn bộ các phiên giao tiếp trong quá khứ vẫn **KHÔNG THỂ giải mã được các khóa phiên (Session Keys) trong quá khứ**, vì mỗi phiên đều sinh cặp khóa DH tạm thời (ephemeral) riêng biệt và xóa ngay sau khi phiên kết thúc.
- **B.** Khóa phiên của ngày hôm nay được tính bằng cách băm khóa phiên của ngày hôm qua.
- **C.** Máy chủ dùng chung một khóa phiên cố định cho mọi khách hàng trong suốt 1 năm.
- **D.** Dữ liệu được chuyển tiếp qua nhiều router mà không bị rớt gói.
> **Đáp án:** **A**
> **Giải thích:** Nếu dùng trao đổi khóa RSA tĩnh (Static RSA Key Transport: Client tự sinh $K_s$ rồi mã hóa $C = \text{Enc}_{PU_{\text{Server}}}(K_s)$ gửi lên Server), một khi hacker đánh cắp được $PR_{\text{Server}}$ sau 5 năm, toàn bộ dữ liệu thu thập suốt 5 năm trước đó sẽ bị giải mã sạch sẽ (không có PFS). Ngược lại, **DHE / ECDHE** dùng khóa tạm thời cho từng phiên nên đảm bảo **PFS tuyệt đối**.

---

## CHỦ ĐỀ 4: HÀM BĂM MẬT MÃ, MAC, HMAC & CHỮ KÝ SỐ (CÂU 49 – 60)

### Câu 49: Một hàm băm mật mã $H(M)$ nhận đầu vào là thông điệp $M$ có độ dài bất kỳ và trả về giá trị băm $h$ có độ dài cố định $n\text{ bit}$. Ba tính chất an toàn cốt lõi của hàm băm mật mã là:
- **A.** Tính một chiều (Preimage resistance), Kháng đụng độ yếu (Second preimage / Weak collision resistance), và Kháng đụng độ mạnh (Strong collision resistance).
- **B.** Tính khả nghịch (Invertibility), Tính tuyến tính (Linearity), và Tính tuần hoàn.
- **C.** Tính bí mật, Tính sẵn sàng, và Tính xác thực.
- **D.** Khả năng giải mã ngược từ $h$ về $M$ khi có khóa bí mật.
> **Đáp án:** **A**
> **Giải thích:** Hàm băm là hàm **không có khóa** và **không khả nghịch (một chiều)**:
> 1. **Preimage resistance (Một chiều):** Cho $h$, không thể tìm được $x$ sao cho $H(x) = h$ (độ phức tạp $\approx 2^n$).
> 2. **Second preimage resistance (Kháng đụng độ yếu):** Cho trước $x$, không thể tìm được $y \ne x$ sao cho $H(y) = H(x)$ (độ phức tạp $\approx 2^n$).
> 3. **Collision resistance (Kháng đụng độ mạnh):** Không thể tìm được bất kỳ cặp $(x, y)$ nào ($x \ne y$) sao cho $H(x) = H(y)$ (độ phức tạp $\approx 2^{n/2}$ theo Nghịch lý Ngày sinh).

### Câu 50: Thuật toán băm **SHA-256** (thuộc họ SHA-2, cấu trúc Merkle–Damgård) có kích thước khối xử lý đầu vào (Block size) và kích thước đầu ra (Message Digest size) lần lượt là bao nhiêu?
- **A.** Kích thước khối xử lý **$512\text{ bit}$** ($64\text{ bytes}$), kích thước giá trị băm đầu ra **$256\text{ bit}$** ($32\text{ bytes}$ — biểu diễn thành $64$ ký tự hệ Hexa), gồm **$64\text{ vòng}$** nén.
- **B.** Kích thước khối $256\text{ bit}$, đầu ra $256\text{ bit}$, $16\text{ vòng}$.
- **C.** Kích thước khối $1024\text{ bit}$, đầu ra $512\text{ bit}$, $80\text{ vòng}$.
- **D.** Kích thước khối $128\text{ bit}$, đầu ra $160\text{ bit}$, $64\text{ vòng}$.
> **Đáp án:** **A**
> **Giải thích:** Bảng thông số các hàm băm chuẩn cần nhớ:
> - **MD5:** Khối $512\text{ bit}$, Đầu ra **$128\text{ bit}$**, $64\text{ vòng}$ *(Đã bị phá hoàn toàn đụng độ)*.
> - **SHA-1:** Khối $512\text{ bit}$, Đầu ra **$160\text{ bit}$**, $80\text{ vòng}$ *(Đã bị phá đụng độ thực tế năm 2017)*.
> - **SHA-256:** Khối $512\text{ bit}$, Đầu ra **$256\text{ bit}$**, $64\text{ vòng}$ *(Chuẩn an toàn phổ biến nhất hiện nay)*.
> - **SHA-512:** Khối $1024\text{ bit}$, Đầu ra **$512\text{ bit}$**, $80\text{ vòng}$.

### Câu 51: Trong bước đệm dữ liệu (Padding) của thuật toán **MD5, SHA-1 và SHA-256** (với kích thước khối $512\text{ bit}$), thông điệp gốc $M$ có độ dài $L\text{ bit}$ sẽ được nối thêm bit `1` rồi đến $k$ bit `0`, và cuối cùng là một trường **$64\text{ bit}$** lưu giá trị độ dài gốc $L$. Hỏi tổng độ dài thông điệp trước khi gắn $64\text{ bit}$ cuối cùng phải đồng dư với bao nhiêu theo modulo $512$?
- **A.** $\equiv 448 \pmod{512}$ (tức là $L + 1 + k \equiv 448 \pmod{512}$).
- **B.** $\equiv 512 \pmod{512}$.
- **C.** $\equiv 256 \pmod{512}$.
- **D.** $\equiv 0 \pmod{64}$.
> **Đáp án:** **A**
> **Giải thích:** Vì khối có $512\text{ bit}$ và dành $64\text{ bit}$ cuối để ghi chiều dài thông điệp gốc $L$, nên phần dữ liệu + bit `1` + các bit `0` đệm vào phải dừng ở vị trí $512 - 64 = \mathbf{448} \pmod{512}$. Lưu ý: Bước đệm **luôn luôn được thực hiện** (ngay cả khi thông điệp gốc đã có độ dài đồng dư với $448 \bmod 512$, khi đó sẽ đệm thêm nguyên một khối $512\text{ bit}$ mới gồm một bit `1` và $511$ bit `0`).

### Câu 52: Tại sao cấu trúc xây dựng MAC đơn giản bằng cách nối tiền tố khóa bí mật vào trước thông điệp $\text{MAC}_K(M) = H(K \parallel M)$ với các hàm băm cấu trúc Merkle–Damgård (như MD5, SHA-1, SHA-256) lại **KHÔNG AN TOÀN**?
- **A.** Vì nó bị lỗ hổng **Tấn công mở rộng độ dài (Length Extension Attack)**: Từ giá trị $\text{MAC}_K(M) = H(K \parallel M)$ và độ dài của $(K \parallel M)$, kẻ tấn công có thể lấy chính giá trị băm đó làm trạng thái khởi tạo tiếp theo để tính được hợp lệ $\text{MAC}_K(M \parallel \text{Padding} \parallel M_{\text{độc hại}})$ cho thông điệp mở rộng mà **không hề biết khóa $K$**!
- **B.** Vì hàm băm không nhận khóa $K$ ở đầu.
- **C.** Vì phép nối chuỗi làm lộ khóa $K$ dưới dạng bản rõ.
- **D.** Vì SHA-256 không băm được chuỗi dài hơn 512 bit.
> **Đáp án:** **A**
> **Giải thích:** Chính vì lỗi **Length Extension Attack** của $H(K \parallel M)$ và lỗi đụng độ thông điệp của $H(M \parallel K)$, chuẩn công nghiệp đã ra đời cấu trúc băm lồng nhau **HMAC (RFC 2104)**.

### Câu 53: Công thức chuẩn của thuật toán **HMAC (Hash-based Message Authentication Code)** theo RFC 2104 và FIPS 198 là gì?
- **A.** $\text{HMAC}_K(M) = H\Big((K^+ \oplus \text{opad}) \;\parallel\; H\big((K^+ \oplus \text{ipad}) \parallel M\big)\Big)$
- **B.** $\text{HMAC}_K(M) = H(K \parallel M \parallel K)$
- **C.** $\text{HMAC}_K(M) = H(M) \oplus K$
- **D.** $\text{HMAC}_K(M) = E_K(H(M))$
> **Đáp án:** **A**
> **Giải thích:** Trong công thức HMAC:
> - $K^+$ là khóa $K$ đã được đệm thêm các bit `0` bên phải cho đủ kích thước 1 khối băm $b\text{ bit}$ (ví dụ $512\text{ bit}$ với SHA-256; nếu $|K| > b$ thì băm $K \leftarrow H(K)$ trước).
> - $\text{ipad} = \mathtt{0x36}$ (`00110110`) lặp lại $b/8$ lần.
> - $\text{opad} = \mathtt{0x5C}$ (`01011100`) lặp lại $b/8$ lần.
> - Cấu trúc băm 2 tầng (inner hash + outer hash) triệt tiêu hoàn toàn tấn công Length Extension và được chứng minh an toàn toán học miễn là hàm nén cơ sở an toàn.

### Câu 54: Ngoài việc xây dựng MAC từ hàm băm (như HMAC), người ta còn có thể xây dựng MAC từ **Mã khối (Block Cipher)** như thế nào?
- **A.** Sử dụng các chuẩn như **CBC-MAC / CMAC (Cipher-based MAC)** hoặc chế độ mã hóa xác thực **GCM (Galois/Counter Mode)** và **CCM**.
- **B.** Dùng chế độ ECB và lấy khối đầu tiên làm MAC.
- **C.** Chỉ lấy вектор khởi tạo $IV$ làm MAC.
- **D.** Không thể tạo MAC từ mã khối.
> **Đáp án:** **A**
> **Giải thích:** Trong **CBC-MAC**, thông điệp được mã hóa bằng chế độ CBC với $IV = 0$, và khối bản mã cuối cùng $C_n$ (sau khi xử lý khóa phụ trong **CMAC** để chống tấn công ghép nối thông điệp có độ dài biến đổi) được dùng làm thẻ xác thực (Authentication Tag).

### Câu 55: Giả sử Alice và Bob chia sẻ khóa đối xứng $K$ và dùng **HMAC** để xác thực thông điệp. Tại sao cơ chế HMAC **KHÔNG thể cung cấp dịch vụ Chống chối bỏ (Non-repudiation)** trước bên thứ ba (ví dụ Thẩm phán / Trọng tài)?
- **A.** Vì cả Alice và Bob đều nắm giữ cùng một khóa bí mật $K$: nếu Bob đưa thông điệp $(M, \text{HMAC}_K(M))$ ra tòa kiện Alice, Alice có thể cãi rằng chính Bob đã tự dùng khóa $K$ để tạo ra thẻ HMAC đó nhằm vu khống Alice (và ngược lại, nếu Alice chối bỏ thông điệp mình đã gửi, tòa án cũng không thể phân biệt ai trong hai người đã tạo ra $\text{HMAC}_K(M)$).
- **B.** Vì HMAC không kiểm tra được tính toàn vẹn của thông điệp.
- **C.** Vì HMAC có độ dài quá ngắn.
- **D.** Vì HMAC không dùng hàm băm.
> **Đáp án:** **A**
> **Giải thích:** Sự đối xứng của khóa $K$ khiến hai bên có quyền năng tạo MAC ngang nhau. Muốn có **Non-repudiation**, bắt buộc phải dùng **Chữ ký số khóa bất đối xứng (Digital Signature)** — nơi chỉ duy nhất người ký có $PR_A$, còn người nhận và tòa án chỉ có $PU_A$.

### Câu 56: Trong lược đồ kết hợp giữa **Mã hóa đối xứng ($E_{K_1}$) và MAC ($MAC_{K_2}$)** để vừa bảo mật vừa xác thực toàn vẹn gói tin (**Authenticated Encryption**), có 3 cách ghép nối phổ biến là:
1. **Encrypt-and-MAC (E&M — dùng trong SSH):** $C = E_{K_1}(M), \; T = \text{MAC}_{K_2}(M)$.
2. **MAC-then-Encrypt (MtE — dùng trong SSL/TLS cũ):** $T = \text{MAC}_{K_2}(M), \; C = E_{K_1}(M \parallel T)$.
3. **Encrypt-then-MAC (EtM — dùng trong IPsec và TLS hiện đại):** $C = E_{K_1}(M), \; T = \text{MAC}_{K_2}(IV \parallel C)$.

Hỏi phương thức nào được chứng minh là **AN TOÀN NHẤT về mặt mật mã học** (luôn đạt chuẩn chống tấn công bản mã được chọn CCA và ngăn chặn hoàn toàn tấn công Padding Oracle)?
- **A.** **Encrypt-then-MAC (EtM — Mã hóa trước rồi tính MAC trên bản mã)**.
- **B.** Encrypt-and-MAC (E&M).
- **C.** MAC-then-Encrypt (MtE).
- **D.** Chỉ cần Encrypt mà không cần MAC.
> **Đáp án:** **A**
> **Giải thích:** Với **Encrypt-then-MAC (EtM)**, khi người nhận nhận được $(C, T)$, họ **kiểm tra thẻ $\text{MAC}_{K_2}(IV \parallel C)$ ngay trên bản mã trước tiên**. Nếu bản mã bị kẻ tấn công chỉnh sửa dù chỉ 1 bit, bước kiểm tra MAC sẽ báo lỗi và **loại bỏ gói tin ngay lập tức mà không bao giờ đưa vào bộ giải mã $D_{K_1}$**, nhờ đó chặn đứng mọi cuộc tấn công **Padding Oracle Attack** (như POODLE, Lucky13 từng đánh sập MAC-then-Encrypt trên SSL/TLS cũ).

### Câu 57: Trong chuẩn chữ ký số **DSA (Digital Signature Algorithm)** và **ECDSA (Elliptic Curve DSA)**, để ký thông điệp $M$, người ký phải sinh một số ngẫu nhiên bí mật tạm thời $k$ cho mỗi lần ký để tính cặp chữ ký $(r, s)$. Chuyện gì sẽ xảy ra nếu bộ sinh số ngẫu nhiên bị lỗi khiến **cùng một giá trị $k$ bị dùng lại để ký cho hai thông điệp khác nhau $M_1$ và $M_2$** (sự cố thực tế từng làm lộ khóa gốc máy chơi game Sony PlayStation 3 và ví Bitcoin)?
- **A.** Kẻ tấn công chỉ cần lấy hiệu $s_1 - s_2$ là tìm ra ngay số ngẫu nhiên $k$, và từ $k$ sẽ giải phương trình bậc nhất tìm ra **toàn bộ Khóa bí mật dài hạn (Private Key $x$)** của người ký chỉ bằng vài phép tính cơ bản!
- **B.** Hai chữ ký sẽ không xác thực được nhưng khóa bí mật $x$ vẫn an toàn tuyệt đối.
- **C.** Không có vấn đề gì xảy ra vì $M_1 \ne M_2$.
- **D.** Hàm băm sẽ tự động đổi giá trị $k$.
> **Đáp án:** **A**
> **Giải thích:** Trong DSA/ECDSA, ta có $s_1 \equiv k^{-1}(H(M_1) + x \cdot r) \pmod q$ và $s_2 \equiv k^{-1}(H(M_2) + x \cdot r) \pmod q$ (cùng $r$ vì cùng $k$). Suy ra:
> $$s_1 - s_2 \equiv k^{-1}(H(M_1) - H(M_2)) \pmod q \implies k \equiv (H(M_1) - H(M_2))(s_1 - s_2)^{-1} \pmod q$$
> Có được $k$, kẻ tấn công rút ngay ra khóa bí mật:
> $$x \equiv r^{-1}(k \cdot s_1 - H(M_1)) \pmod q$$
> Do đó trong DSA/ECDSA, việc giữ $k$ bí mật và **không bao giờ dùng lại $k$** (hoặc dùng chuẩn tất định RFC 6979) là sống còn!

### Câu 58: So sánh kích thước đầu ra và hiệu năng giữa **Hàm băm SHA-256**, **HMAC-SHA256** và **Chữ ký số RSA-2048**:
- **A.** SHA-256 và HMAC-SHA256 đều cho đầu ra $256\text{ bit}$ ($32\text{ bytes}$) và tốc độ tính toán cực nhanh (hàng trăm MB/s đến GB/s); trong khi Chữ ký số RSA-2048 cho đầu ra $2048\text{ bit}$ ($256\text{ bytes}$) và tốc độ ký chậm hơn hàng nghìn lần.
- **B.** Chữ ký số RSA-2048 có kích thước $256\text{ bit}$.
- **C.** HMAC-SHA256 chậm hơn RSA-2048.
- **D.** Cả ba đều không dùng khóa.
> **Đáp án:** **A**
> **Giải thích:** Kích thước của chữ ký RSA luôn bằng kích thước của mô-đun $n$ (ví dụ RSA-2048 tạo chữ ký dài $2048\text{ bit} = 256\text{ bytes}$).

### Câu 59: Một công ty phần mềm đăng tải file cài đặt `setup.exe` lên trang chủ kèm theo chuỗi mã băm `SHA-256 = e3b0c442...` đặt ngay trên cùng một trang web HTTP (không có HTTPS và không có chữ ký số). Tại sao cách làm này **chỉ phát hiện được lỗi truyền dẫn ngẫu nhiên** chứ **không chống được hacker tấn công chủ động**?
- **A.** Vì nếu hacker chiếm được trang web hoặc đứng giữa đường truyền HTTP (MitM), hacker có thể thay thế file `setup.exe` bằng file nhiễm mã độc `malware.exe`, đồng thời tự tính lại mã băm `SHA-256(malware.exe)` rồi sửa luôn dòng mã băm hiển thị trên trang web!
- **B.** Vì SHA-256 không băm được file `.exe`.
- **C.** Vì người dùng không biết cách chạy lệnh băm.
- **D.** Vì SHA-256 là thuật toán mã hóa đối xứng.
> **Đáp án:** **A**
> **Giải thích:** Hàm băm không khóa (MDC) chỉ bảo vệ được tính toàn vẹn khi **bản thân giá trị băm $H(M)$ được truyền trên một kênh xác thực an toàn khác** hoặc được **Ký số (Code Signing)**!

### Câu 60: Khi người nhận Bob xác thực chữ ký số $S$ của Alice trên văn bản $M$ và thấy **phép kiểm tra chữ ký thất bại** ($S^e \bmod n \ne H(M)$), Bob có thể kết luận điều gì?
- **A.** Hoặc nội dung văn bản $M$ đã bị thay đổi trên đường truyền, hoặc chữ ký $S$ bị lỗi/giả mạo (không phải được ký bởi khóa bí mật $PR_A$ tương ứng với khóa công khai $PU_A$), hoặc cả hai.
- **B.** Chắc chắn 100% là khóa bí mật của Bob đã bị lộ.
- **C.** Chỉ có văn bản $M$ bị sửa chứ chữ ký $S$ không bao giờ bị sửa.
- **D.** Thuật toán hàm băm đã bị hỏng.
> **Đáp án:** **A**
> **Giải thích:** Bất kỳ sự sai lệch nào ở $M$, ở $S$, hoặc dùng sai khóa $PR_A$ khi ký đều dẫn đến $V_{PU_A}(M, S) = \text{False}$.

---

## CHỦ ĐỀ 5: XÁC THỰC DANH TÍNH, BẢO MẬT MẬT KHẨU, SALT & GIAO THỨC CHALLENGE-RESPONSE (CÂU 61 – 75)

> *(Lưu ý: Các câu hỏi từ 61 đến 75 dưới đây bám sát 100% nội dung đề Quiz Chương 6 — Authentication trên `soict.daotao.ai`!)*

### Câu 61: Xác thực người dùng (User Authentication) dựa trên sự kết hợp của tối đa 3 nhóm nhân tố cơ bản (Authentication Factors) nào?
- **A.**
  1. **Thứ bạn biết (Something you know — Knowledge factor):** Mật khẩu (Password), mã PIN, câu hỏi bí mật.
  2. **Thứ bạn có (Something you have — Possession factor):** Thẻ thông minh (Smartcard), USB Token, ứng dụng sinh mã OTP trên điện thoại.
  3. **Thứ thuộc về bản thân bạn (Something you are / do — Inherence / Biometrics factor):** Vân tay, khuôn mặt (FaceID), mống mắt, giọng nói, nhịp gõ phím.
- **B.** Tên đăng nhập (Username), Địa chỉ IP, và Địa chỉ MAC.
- **C.** Tường lửa, Antivirus, và VPN.
- **D.** Mã hóa, Băm, và Chữ ký số.
> **Đáp án:** **A**
> **Giải thích:** **Xác thực đa nhân tố (MFA / 2FA — Multi-Factor Authentication)** bắt buộc phải kết hợp ít nhất **2 nhân tố thuộc 2 nhóm khác nhau** (ví dụ: Mật khẩu [Know] + SmartOTP trên điện thoại [Have]). Lưu ý: Nhập *Mật khẩu cấp 1 + Mật khẩu cấp 2 (hoặc mã PIN)* chỉ là dùng 2 lần nhân tố "Thứ bạn biết", **không phải là 2FA thực sự**!

### Câu 62 (Câu hỏi chuẩn Quiz MOOC): Những nguyên nhân chính nào sau đây làm **giảm mức độ an toàn của phương thức xác thực bằng Mật khẩu (Password)**? *(Chọn phương án đầy đủ nhất)*
1. Người dùng thường chọn mật khẩu ngắn, dễ đoán (ngày sinh, tên riêng, `123456`, từ có trong từ điển) để dễ nhớ.
2. Người dùng có thói quen **sử dụng lại cùng một mật khẩu (Password Reuse)** trên nhiều trang web/dịch vụ khác nhau (khi một trang web nhỏ bị lộ CSDL, tài khoản ngân hàng/email cũng bị tấn công Credential Stuffing).
3. Mật khẩu dễ bị lộ qua tấn công lừa đảo (**Phishing**), phần mềm gián điệp ghi phím (**Keylogger**), nhìn trộm qua vai (**Shoulder Surfing**) hoặc nghe lén nếu kênh truyền không mã hóa.
4. Nếu máy chủ lưu trữ bảng mật khẩu không đúng cách (lưu bản rõ hoặc băm không có Salt), kẻ tấn công chiếm được CSDL có thể dò ra mật khẩu bằng **Tấn công từ điển (Dictionary Attack)** hoặc **Bảng cầu vồng (Rainbow Table)**.
- **A.** Chỉ (1) và (2).
- **B.** Chỉ (1), (2) và (3).
- **C.** Chỉ (2) và (4).
- **D.** **Cả (1), (2), (3) và (4) đều đúng.**
> **Đáp án:** **D**

### Câu 63 (Câu hỏi chuẩn Quiz MOOC): Tại sao hệ thống máy chủ lại phải **Băm mật khẩu (Password Hashing)** thay vì lưu trực tiếp mật khẩu dạng bản rõ (Plaintext) hoặc mã hóa hai chiều trong Cơ sở dữ liệu?
- **A.** Để ngay cả khi kẻ tấn công khai thác lỗ hổng (như SQL Injection) đọc trộm được toàn bộ bảng `Users` trong CSDL, hoặc quản trị viên nội bộ (DBA) xem bảng dữ liệu, họ cũng **không thể biết ngay lập tức mật khẩu gốc** của người dùng vì hàm băm là hàm một chiều không thể dịch ngược.
- **B.** Để tiết kiệm dung lượng ổ cứng vì chuỗi băm SHA-256 ngắn hơn mật khẩu 6 ký tự.
- **C.** Để người dùng không cần nhớ mật khẩu nữa.
- **D.** Để chống lại tấn công Keylogger trên máy tính của người dùng.
> **Đáp án:** **A**
> **Giải thích:** Băm mật khẩu bảo vệ mật khẩu của người dùng khi **Cơ sở dữ liệu xác thực trên Server bị rò rỉ (Data Breach)**.

### Câu 64 (Câu hỏi chuẩn Quiz MOOC): Nếu máy chủ chỉ lưu trữ mật khẩu dưới dạng băm đơn thuần `H = SHA-256(Password)` (không dùng Salt), những điểm yếu nghiêm trọng nào sẽ xảy ra khi CSDL bị lộ?
- **A.**
  1. Hai người dùng bất kỳ đặt cùng một mật khẩu sẽ có **cùng một giá trị băm giống hệt nhau** trong CSDL (nhìn vào biết ngay ai trùng mật khẩu với ai).
  2. Kẻ tấn công có thể sử dụng **Bảng tính trước / Bảng cầu vồng (Precomputed Hash Tables / Rainbow Tables)** hoặc chạy một lượt **Tấn công từ điển (Offline Dictionary Attack)** duy nhất để tra cứu và bẻ khóa đồng loạt hàng triệu tài khoản cùng lúc trong vài giây!
- **B.** Máy chủ không thể kiểm tra được mật khẩu khi người dùng đăng nhập.
- **C.** Hàm SHA-256 sẽ bị tràn bộ nhớ.
- **D.** Người dùng không thể đổi mật khẩu.
> **Đáp án:** **A**

### Câu 65 (Câu hỏi chuẩn Quiz MOOC): Trong cơ chế bảo mật mật khẩu, **Salt (Muối mật mã)** là gì và nó được lưu trữ như thế nào?
- **A.** **Salt** là một chuỗi bit **ngẫu nhiên, duy nhất cho từng tài khoản người dùng** (unique per user, dài tối thiểu $128\text{ bit} / 16\text{ bytes}$), được ghép vào mật khẩu trước khi đưa qua hàm băm: $H = \text{Hash}(\text{Password} \parallel \text{Salt})$. Giá trị **Salt không cần giữ bí mật** mà được lưu trực tiếp kèm theo bản băm $H$ trong cùng bản ghi của người dùng trong CSDL: `(Username, Salt, Hash)`.
- **B.** Salt là một khóa bí mật duy nhất dùng chung cho toàn bộ các tài khoản trên máy chủ.
- **C.** Salt là mật khẩu do người dùng tự nhập thêm mỗi khi đăng nhập.
- **D.** Salt bắt buộc phải lưu ở một máy chủ vật lý khác và không bao giờ lưu trong CSDL.
> **Đáp án:** **A**
> **Giải thích:** Khi người dùng `Alice` đăng nhập và gửi `Password`, Server đọc bản ghi của `Alice` lấy `Salt_Alice`, tính lại `Hash(Password || Salt_Alice)` và so sánh với cột `Hash` đã lưu. Lưu ý: Khái niệm khóa bí mật dùng chung lưu tách biệt ngoài CSDL trên HSM/Environment được gọi là **Pepper**, còn **Salt** thì mỗi người dùng một giá trị ngẫu nhiên riêng và lưu ngay trong CSDL.

### Câu 66 (Câu hỏi chuẩn Quiz MOOC): Vai trò quan trọng nhất của **Salt** trong việc lưu trữ mật khẩu là gì?
- **A.** Đảm bảo hai người dùng có cùng mật khẩu vẫn tạo ra **hai chuỗi băm hoàn toàn khác nhau**, đồng thời **vô hiệu hóa hoàn toàn Bảng cầu vồng (Rainbow Tables)** và buộc kẻ tấn công từ điển (Offline Dictionary Attack) phải băm lại từ đầu toàn bộ từ điển cho **từng tài khoản riêng lẻ** (làm chi phí tấn công $N$ tài khoản tăng lên gấp $N$ lần).
- **B.** Giúp chống lại tấn công đoán mật khẩu trực tuyến (Online Brute-force) đối với một tài khoản đơn lẻ có mật khẩu yếu như `123456` khi đã biết Salt của tài khoản đó.
- **C.** Giúp người dùng đăng nhập nhanh hơn.
- **D.** Thay thế hoàn toàn cho giao thức HTTPS.
> **Đáp án:** **A**
> **Giải thích:** Cần nhớ kỹ:
> - **Salt CHỐNG ĐƯỢC:** Bảng tính trước (**Rainbow Tables**), Tấn công từ điển hàng loạt nhiều tài khoản cùng lúc (**Mass Offline Dictionary Attack**), và việc phát hiện hai người dùng trùng mật khẩu.
> - **Salt KHÔNG CHỐNG ĐƯỢC:** Việc kẻ tấn công nhắm mục tiêu vét cạn từ điển ngoại tuyến vào **một tài khoản cụ thể duy nhất** nếu tài khoản đó đặt mật khẩu quá yếu (vì kẻ tấn công đã có `Salt` của tài khoản đó trong CSDL bị lộ). Để chống vét cạn trên từng tài khoản đơn lẻ, ta cần **Mật khẩu mạnh (High Entropy)** kết hợp với **Hàm băm mật khẩu chậm (Slow / Key-Stretching Hash Functions)** như **bcrypt, scrypt, PBKDF2, Argon2id**!

### Câu 67 (Câu hỏi chuẩn Quiz MOOC): Trong 4 phương án lưu trữ thông tin xác thực mật khẩu trên CSDL máy chủ dưới đây, phương án nào là **AN TOÀN NHẤT**?
- **A.** Lưu bản rõ `Password`.
- **B.** Lưu `MD5(Password)`.
- **C.** Lưu `SHA-256(Password)`.
- **D.** Lưu `Salt` (ngẫu nhiên duy nhất cho mỗi user) và `SHA-256(Password, Salt)` *(hoặc tốt hơn nữa trong thực tế là `Argon2id / bcrypt / PBKDF2(Password, Salt, Iterations)`)*.
> **Đáp án:** **D**
> **Giải thích:** Trong câu hỏi trắc nghiệm trên MOOC `soict.daotao.ai`, đáp án chuẩn được chọn là **`SHA-256(Password, Salt)`** (kèm cột `Salt`).

### Câu 68: Tại sao trong thực tế hiện đại, các chuyên gia bảo mật khuyến nghị dùng các hàm dẫn xuất khóa chuyên dụng như **bcrypt, PBKDF2, scrypt hoặc Argon2** để băm mật khẩu thay vì chỉ gọi 1 lần hàm `SHA-256(Password || Salt)`?
- **A.** Vì `SHA-256` được thiết kế để chạy **cực nhanh** trên phần cứng (một card đồ họa GPU RTX 4090 có thể tính hàng chục tỷ phép băm SHA-256 mỗi giây), giúp hacker vét cạn mật khẩu 8 ký tự rất nhanh; trong khi **bcrypt / PBKDF2 / Argon2** có tham số **lặp hàng trăm nghìn vòng (Iterations / Work factor) và tiêu tốn bộ nhớ RAM (Memory-hard)**, làm chậm tốc độ băm xuống khoảng $0.1 - 0.5\text{ giây/lần}$, khiến việc vét cạn bằng GPU/ASIC trở nên bất khả thi!
- **B.** Vì SHA-256 đã bị tìm ra đụng độ.
- **C.** Vì bcrypt có đầu ra dài 10,000 bit.
- **D.** Vì SHA-256 không nhận đầu vào có chứa Salt.
> **Đáp án:** **A**
> **Giải thích:** Đây gọi là kỹ thuật **Key Stretching (Kéo giãn khóa)**. Đối với người dùng hợp pháp đăng nhập 1 lần mất $0.2\text{ giây}$ là không đáng kể, nhưng đối với kẻ tấn công muốn thử $10^{10}$ mật khẩu thì thời gian bị kéo dài từ vài giây lên thành hàng trăm năm!

### Câu 69: Trong hệ thống xác thực sinh trắc học (**Biometrics** — vân tay, khuôn mặt), hai loại sai số thống kê cơ bản dùng để đánh giá độ chính xác của cảm biến là gì?
- **A.**
  1. **FAR (False Acceptance Rate — Tỷ lệ chấp nhận sai / Dương tính giả):** Tỷ lệ hệ thống nhận nhầm một kẻ mạo danh là người dùng hợp pháp (*Nguy hiểm trực tiếp đến tính An toàn / Security*).
  2. **FRR (False Rejection Rate — Tỷ lệ từ chối sai / Âm tính giả):** Tỷ lệ hệ thống từ chối nhầm chính người dùng hợp pháp (*Gây phiền hà, ảnh hưởng đến tính Tiện dụng / Usability*).
- **B.** CPU Usage và Memory Usage.
- **C.** Bit Error Rate và Packet Loss Rate.
- **D.** Encryption Rate và Decryption Rate.
> **Đáp án:** **A**
> **Giải thích:** Khi tăng ngưỡng khắt khe (Threshold) của cảm biến sinh trắc học: **FAR giảm xuống** (an toàn hơn) nhưng **FRR lại tăng lên** (người dùng thật hay bị báo lỗi không nhận vân tay). Điểm giao nhau nơi $\text{FAR} = \text{FRR}$ được gọi là **EER (Equal Error Rate — Tỷ lệ lỗi cân bằng)**: giá trị **EER càng nhỏ** thì hệ thống sinh trắc học đó càng tốt!

### Câu 70: Tại sao phương thức xác thực bằng gửi mật khẩu truyền thống qua mạng (ngay cả khi gửi mã băm cố định $H(\text{Password})$) lại dễ bị **Tấn công phát lại (Replay Attack)** nếu kênh truyền bị nghe lén, và giải pháp chuẩn là gì?
- **A.** Vì nếu thông tin xác thực gửi đi cố định không đổi qua các lần đăng nhập, kẻ nghe lén chỉ cần bắt gói tin chứa $H(\text{Password})$ của lần đăng nhập trước rồi gửi lại y nguyên cho Server ở lần sau là đăng nhập thành công mà không cần biết `Password` gốc. Giải pháp chuẩn là dùng **Giao thức Thách đố – Phản hồi (Challenge-Response Protocol)** sử dụng số ngẫu nhiên dùng một lần (**Nonce / Challenge $R$**).
- **B.** Vì hàm băm làm lộ mật khẩu gốc trên đường truyền.
- **C.** Giải pháp là đổi tên người dùng sau mỗi lần đăng nhập.
- **D.** Giải pháp là không dùng mật khẩu nữa mà chỉ gửi Username.
> **Đáp án:** **A**
> **Giải thích:** Đây là lý do ra đời của các giao thức **Challenge-Response** (như CHAP, Kerberos, TLS Client Auth, FIDO2/WebAuthn).

### Câu 71: Trình tự hoạt động chuẩn của **Giao thức xác thực Thách đố – Phản hồi (Challenge-Response)** dùng hàm băm/MAC giữa Client (Alice, biết mật khẩu/khóa $K$) và Server (Bob) diễn ra như thế nào?
- **A.**
  1. Alice gửi định danh `Username` yêu cầu đăng nhập.
  2. Server sinh một số ngẫu nhiên mới tinh **$R$ (Challenge / Nonce — chỉ dùng 1 lần)** và gửi $R$ cho Alice.
  3. Alice tính giá trị phản hồi $\text{Response} = \text{HMAC}_K(R)$ (hoặc $H(\text{Password} \parallel R)$) rồi gửi `Response` về cho Server.
  4. Server tự tính $\text{HMAC}_K(R)$ từ bản sao khóa $K$ của mình và so sánh với `Response`: nếu khớp thì xác thực thành công!
- **B.** Alice tự chọn $R$ cố định bằng `123` rồi gửi `Password` dạng bản rõ cho Server.
- **C.** Server gửi khóa bí mật $K$ cho Alice để Alice kiểm tra.
- **D.** Alice gửi $H(\text{Password})$ cố định cho Server ở mọi phiên.
> **Đáp án:** **A**
> **Giải thích:** Nhờ mỗi phiên đăng nhập Server đều phát ra một số ngẫu nhiên $R$ hoàn toàn mới, gói tin $\text{Response} = \text{HMAC}_K(R)$ của phiên cũ trở nên hoàn toàn vô giá trị ở các phiên sau $\implies$ **Chống Replay Attack tuyệt đối** đồng thời **không bao giờ truyền mật khẩu qua mạng**!

### Câu 72: Trong giao thức **Challenge-Response một chiều** (chỉ Server thách đố Client), kẻ tấn công có thể dựng một máy chủ giả mạo để thực hiện **Tấn công phản chiếu (Reflection Attack)** hoặc **Man-in-the-Middle**. Để cả hai bên cùng xác thực lẫn nhau (**Mutual Authentication — Xác thực hai chiều**), giao thức cần thực hiện như thế nào?
- **A.** Cả Client và Server đều phải tự sinh số ngẫu nhiên riêng của mình ($R_A$ của Alice và $R_B$ của Bob), và mỗi bên đều phải tính hàm phản hồi chứng minh mình sở hữu khóa bí mật trên số ngẫu nhiên của đối phương (kèm định danh của bên nhận để chống Reflection Attack): ví dụ Bob gửi $E_K(R_A \parallel R_B \parallel ID_A)$ và Alice gửi lại $E_K(R_B \parallel ID_B)$.
- **B.** Alice gửi cùng một số $R_A$ hai lần liên tiếp.
- **C.** Bob gửi lại đúng số $R_A$ dạng bản rõ mà không mã hóa.
- **D.** Không thể thực hiện xác thực hai chiều trên mạng máy tính.
> **Đáp án:** **A**
> **Giải thích:** Đưa cả hai Nonce $(R_A, R_B)$ và định danh bên nhận vào trong khối mã hóa/MAC giúp gắn kết chặt chẽ phiên xác thực và ngăn chặn kẻ tấn công lấy chính câu hỏi $R$ của Bob gửi ngược lại cho một phiên khác của Bob (**Reflection Attack**).

### Câu 73: Giao thức xác thực tập trung nổi tiếng **Kerberos** (được sử dụng mặc định trong Windows Active Directory) sử dụng nền tảng mật mã nào làm cốt lõi để cấp vé xác thực (**TGT — Ticket Granting Ticket** và **Service Ticket**)?
- **A.** Chủ yếu dựa trên **Mật mã khóa đối xứng (Symmetric Key Cryptography — chuẩn AES)** kết hợp với **Nhãn thời gian (Timestamps)** và trung tâm phân phối khóa gồm **AS (Authentication Server)** + **TGS (Ticket Granting Server)**.
- **B.** Chỉ sử dụng hàm băm MD5 không khóa.
- **C.** Sử dụng hệ mật cổ điển Caesar và Vigenère.
- **D.** Không sử dụng bất kỳ phép mã hóa nào.
> **Đáp án:** **A**
> **Giải thích:** Kerberos dùng kiến trúc KDC gồm 2 bước:
> 1. Người dùng xác thực với **AS (Authentication Server)** để nhận vé **TGT (Ticket-Granting Ticket)** và khóa phiên $K_{C, \text{TGS}}$ (nhờ đó người dùng chỉ cần nhập mật khẩu 1 lần duy nhất khi đăng nhập máy — **Single Sign-On / SSO**).
> 2. Khi cần truy cập dịch vụ $V$ (File Server, Mail Server...), máy trạm trình vé TGT lên **TGS (Ticket-Granting Server)** để nhận **Vé dịch vụ (Service Ticket)** và khóa phiên $K_{C, V}$ mà không cần hỏi lại mật khẩu người dùng.

### Câu 74: Hai cơ chế sinh **Mật khẩu dùng một lần (OTP — One-Time Password)** chuẩn quốc tế của IETF được sử dụng trong các ứng dụng xác thực như Google Authenticator, Microsoft Authenticator và Token phần cứng là gì?
- **A.** **HOTP** (HMAC-based One-Time Password — RFC 4226, dựa trên bộ đếm sự kiện tăng dần `Counter`) và **TOTP** (Time-based One-Time Password — RFC 6238, dựa trên thời gian thực chia theo bước $30\text{ giây}$ kết hợp với khóa bí mật chia sẻ $K$ qua hàm `HMAC-SHA1 / HMAC-SHA256`).
- **B.** ECB và CBC.
- **C.** RSA và ElGamal.
- **D.** CRC32 và Base64.
> **Đáp án:** **A**
> **Giải thích:**
> - **HOTP:** $\text{HOTP}(K, C) = \text{Truncate}(\text{HMAC}(K, C))$ với $C$ là biến đếm mỗi lần bấm nút.
> - **TOTP:** Thay biến đếm $C$ bằng bước thời gian $T = \lfloor (t - t_0) / 30 \rfloor$, do đó mã 6 chữ số tự động đổi mới sau mỗi **$30\text{ giây}$** mà điện thoại không cần kết nối Internet!

### Câu 75: Khi thiết kế chính sách chống tấn công vét cạn mật khẩu trực tuyến (**Online Brute-force / Password Spraying**) trên cổng đăng nhập Web/SSH, biện pháp kỹ thuật nào sau đây là hiệu quả và chuẩn mực nhất?
- **A.** Kết hợp **Giới hạn tần suất thử sai (Rate Limiting / Throttling)**, **Tăng thời gian chờ lũy tiến sau mỗi lần nhập sai (Exponential Backoff)**, **Khóa tạm thời tài khoản sau $N$ lần sai liên tiếp (Account Lockout)**, yêu cầu **Xác thực đa nhân tố (MFA/2FA)** và giám sát cảnh báo IP bất thường.
- **B.** Cho phép người dùng thử 1 triệu mật khẩu mỗi giây không giới hạn.
- **C.** Hiển thị thông báo chi tiết *"Tên đăng nhập đúng nhưng mật khẩu sai ở ký tự thứ 3"* để hỗ trợ người dùng.
- **D.** Giới hạn độ dài mật khẩu tối đa chỉ được 4 ký tự số.
> **Đáp án:** **A**
> **Giải thích:** Ngoài ra, thông báo lỗi khi đăng nhập thất bại phải luôn dùng thông điệp chung: *"Tên đăng nhập hoặc mật khẩu không đúng"* (Generic Error Message) để chống kẻ tấn công dò danh sách tài khoản tồn tại (**Username Enumeration**).
