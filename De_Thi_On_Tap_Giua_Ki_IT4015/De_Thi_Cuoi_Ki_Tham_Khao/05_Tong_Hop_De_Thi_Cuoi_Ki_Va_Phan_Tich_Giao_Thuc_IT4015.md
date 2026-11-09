# TỔNG HỢP ĐỀ THI CUỐI KỲ VÀ CÂU HỎI TỰ LUẬN MỞ RỘNG MÔN NHẬP MÔN AN TOÀN THÔNG TIN (IT4015)
## Phân tích Giao thức, An toàn Mạng Không dây (WEP/WPA), Tràn Bộ Đệm (Buffer Overflow) & Kiểm soát Truy nhập (DAC/MAC/RBAC)

> **Trường Đại học Bách khoa Hà Nội (HUST) – Trường Công nghệ Thông tin và Truyền thông (SoICT)**  
> **Biên soạn theo chuẩn bài giảng và đề thi của:** PGS.TS. Nguyễn Khanh Văn, PGS.TS. Nguyễn Linh Giang, TS. Bùi Trọng Tùng.  
> **Mục đích tài liệu:** Cung cấp lời giải chi tiết cho các đề thi cuối kỳ và các dạng bài tự luận mở rộng có liên hệ mật thiết với phần kiểm tra giữa kỳ và cuối kỳ học phần IT4015 / IT4010E.

---

## MỤC LỤC CHUYÊN ĐỀ
1. [Chuyên đề 1: Phân tích Lỗ hổng Giao thức Trao đổi Khóa qua Bên thứ ba tin cậy $C$ (KDC) & Kerberos](#chuyên-đề-1-phân-tích-lỗ-hổng-giao-thức-trao-đổi-khóa-qua-bên-thứ-ba-tin-cậy-c-kdc--kerberos)
2. [Chuyên đề 2: Bảo mật Mạng Không dây (WEP, WPA, WPA2/WPA3) & Phân tích Lỗ hổng WEP](#chuyên-đề-2-bảo-mật-mạng-không-dây-wep-wpa-wpa2wpa3--phân-tích-lỗ-hổng-wep)
3. [Chuyên đề 3: An toàn Chương trình – Tấn công Tràn Bộ Đệm (Stack Buffer Overflow) & Cách Phòng chống](#chuyên-đề-3-an-toàn-chương-trình--tấn-công-tràn-bộ-đệm-stack-buffer-overflow--cách-phòng-chống)
4. [Chuyên đề 4: Kiểm soát Truy nhập (Access Control: DAC, MAC, RBAC) & Mô hình Bell–LaPadula / Biba](#chuyên-đề-4-kiểm-soát-truy-nhập-access-control-dac-mac-rbac--mô-hình-belllapadula--biba)
5. [Chuyên đề 5: Đề thi Cuối kỳ Mẫu Tổng hợp (90 phút) kèm Đáp án Chi tiết](#chuyên-đề-5-đề-thi-cuối-kỳ-mẫu-tổng-hợp-90-phút-kèm-đáp-án-chi-tiết)

---

## CHUYÊN ĐỀ 1: PHÂN TÍCH LỖ HỔNG GIAO THỨC TRAO ĐỔI KHÓA QUA BÊN THỨ BA TIN CẬY $C$ (KDC) & KERBEROS

*(Đây là câu hỏi tự luận "kinh điển" luôn chiếm 2,5 – 3,5 điểm trong đề thi của thầy Nguyễn Khanh Văn và thầy Nguyễn Linh Giang).*

### Bài toán 1: Phân tích giao thức trao đổi khóa phiên giữa $A$ và $B$ qua Trung tâm $C$ (Biến thể rút gọn của Needham–Schroeder)

**Đề bài:**  
Hai thực thể $A$ và $B$ muốn thiết lập khóa phiên đối xứng $K_{AB}$ thông qua trung tâm phân phối khóa tin cậy $C$ (với $K_{AC}$ là khóa dài hạn giữa $A$ và $C$; $K_{BC}$ là khóa dài hạn giữa $B$ và $C$). Xét các phiên bản giao thức sau:

- **Phiên bản 1:**
  1. $A \to C: ID_A \parallel ID_B$
  2. $C \to A: \{K_{AB}\}_{K_{AC}} \parallel \{K_{AB} \parallel ID_A\}_{K_{BC}}$
  3. $A \to B: \{K_{AB} \parallel ID_A\}_{K_{BC}}$

- **Phiên bản 2 (Needham–Schroeder chuẩn 1978):**
  1. $A \to C: ID_A \parallel ID_B \parallel N_1$
  2. $C \to A: \{N_1 \parallel ID_B \parallel K_{AB} \parallel \{K_{AB} \parallel ID_A\}_{K_{BC}}\}_{K_{AC}}$
  3. $A \to B: \{K_{AB} \parallel ID_A\}_{K_{BC}}$
  4. $B \to A: \{N_2\}_{K_{AB}}$
  5. $A \to B: \{N_2 - 1\}_{K_{AB}}$

*Yêu cầu:*
a) Chỉ ra ít nhất **3 lỗ hổng nghiêm trọng** của **Phiên bản 1**.  
b) **Phiên bản 2** đã khắc phục các lỗ hổng của Phiên bản 1 như thế nào? Tuy nhiên, Phiên bản 2 vẫn còn tồn tại lỗ hổng nổi tiếng nào (tấn công Denning–Sacco)? Nêu 2 cách sửa đổi để khắc phục hoàn toàn.

---

### Lời giải Chi tiết Bài toán 1:

#### a) Phân tích 3 lỗ hổng chí mạng của Phiên bản 1:
1. **Lỗ hổng 1 – Tấn công đánh tráo định danh người nhận ở Bước 1 & 2 (Identity Misbinding Attack):**
   - Ở Bước 1, $A$ gửi $ID_A \parallel ID_B$ dạng rõ. Kẻ tấn công chủ động **Eve ($E$)** chặn bản tin này và sửa thành $ID_A \parallel ID_E$ gửi cho $C$.
   - Ở Bước 2, $C$ trả về $\{K_{AE}\}_{K_{AC}} \parallel \{K_{AE} \parallel ID_A\}_{K_{EC}}$.
   - Vì phần $\{K_{AE}\}_{K_{AC}}$ **không chứa định danh $ID_B$**, khi $A$ giải mã bằng $K_{AC}$, $A$ đinh ninh đây là khóa để nói chuyện với $B$, trong khi thực chất đó là khóa $K_{AE}$ chia sẻ với kẻ tấn công $E$! Khi $A$ gửi thông tin mật mã hóa bằng $K_{AE}$, $E$ giải mã đọc được toàn bộ!
2. **Lỗ hổng 2 – Tấn công phát lại bản tin Bước 2 cho $A$ (Replay Attack against $A$):**
   - Trong Bước 2, $\{K_{AB}\}_{K_{AC}}$ không có số ngẫu nhiên (Nonce $N_1$) hay nhãn thời gian (Timestamp $T$). Nếu một khóa phiên cũ $K_{AB}^{\text{old}}$ bị lộ, kẻ tấn công chỉ việc phát lại bản tin Bước 2 cũ để lừa cả $A$ và $B$ dùng lại khóa cũ $K_{AB}^{\text{old}}$.
3. **Lỗ hổng 3 – Không có bước xác nhận khóa và chống Replay đối với $B$ (Lack of Key Confirmation & Entity Authentication at $B$):**
   - Sau Bước 3 ($A \to B: \{K_{AB} \parallel ID_A\}_{K_{BC}}$), không có bước thách đố – phản hồi giữa $B$ và $A$. Kẻ tấn công có thể phát lại chiếc vé $\{K_{AB} \parallel ID_A\}_{K_{BC}}$ cho $B$ bất kỳ lúc nào để mạo danh $A$ khởi tạo phiên giả, ngay cả khi $A$ không hề trực tuyến.

#### b) Cách Phiên bản 2 khắc phục và Lỗ hổng Denning–Sacco còn tồn tại:
- **Cách Phiên bản 2 khắc phục các lỗi của Phiên bản 1:**
  - Đưa **Nonce $N_1$** và **$ID_B$** vào bên trong bản mã Bước 2 $\{N_1 \parallel ID_B \parallel K_{AB} \parallel \text{Ticket}\}_{K_{AC}}$ giúp $A$ kiểm tra được bản tin từ $C$ là tươi mới (nhờ $N_1$) và đúng là dành cho $B$ (nhờ $ID_B$).
  - Bổ sung **Bước 4 ($B \to A: \{N_2\}_{K_{AB}}$)** và **Bước 5 ($A \to B: \{N_2 - 1\}_{K_{AB}}$)** để $B$ thách đố người gửi chứng minh đang thực sự nắm giữ khóa phiên $K_{AB}$.
- **Lỗ hổng Denning–Sacco (1981) còn tồn tại trong Phiên bản 2:**
  - Quan sát chiếc vé ở Bước 3: $\text{Ticket} = \{K_{AB} \parallel ID_A\}_{K_{BC}}$. Chiếc vé này **hoàn toàn không chứa Timestamp $T$ cũng không chứa Nonce của $B$**!
  - **Kịch bản tấn công:** Giả sử kẻ tấn công $E$ ghi lại chiếc vé cũ $\text{Ticket}_{\text{old}} = \{K_{AB}^{\text{old}} \parallel ID_A\}_{K_{BC}}$ của một phiên trong quá khứ, và sau một thời gian $E$ tìm cách lấy cắp/phá được khóa phiên cũ $K_{AB}^{\text{old}}$ đó.
  - Khi đó, dù $A$ đã ngoại tuyến, $E$ vẫn có thể:
    1. Gửi lại $\text{Ticket}_{\text{old}} = \{K_{AB}^{\text{old}} \parallel ID_A\}_{K_{BC}}$ cho $B$ ở Bước 3.
    2. Nhận $\{N_2\}_{K_{AB}^{\text{old}}}$ từ $B$ ở Bước 4.
    3. Vì $E$ đã biết $K_{AB}^{\text{old}}$, $E$ dễ dàng giải mã lấy $N_2$, tính $\{N_2 - 1\}_{K_{AB}^{\text{old}}}$ gửi trả $B$ ở Bước 5!
    4. $B$ bị lừa hoàn toàn rằng đang nói chuyện trực tiếp với $A$ bằng một khóa phiên mới!
- **Hai giải pháp khắc phục chuẩn:**
  1. **Giải pháp dùng Nhãn thời gian (Timestamp – Áp dụng trong giao thức Kerberos):**
     Đưa nhãn thời gian cấp vé $T_C$ và thời gian sống $L$ (*Lifetime*) vào trong vé:
     $$\text{Ticket} = \{K_{AB} \parallel ID_A \parallel T_C \parallel L\}_{K_{BC}}$$
     Khi đó $B$ kiểm tra nếu vé đã hết hạn ($|T_{\text{now}} - T_C| > L$) thì từ chối ngay.
  2. **Giải pháp dùng Nonce của $B$ (Cải tiến Needham–Schroeder 1987):**
     Trước Bước 1, $A$ liên hệ với $B$ để lấy một số ngẫu nhiên $N_B$ được mã hóa dạng $\{ID_A \parallel N_B\}_{K_{BC}}$ (hoặc $N_B$), rồi $C$ nhúng $N_B$ vào trong Ticket: $\{K_{AB} \parallel ID_A \parallel N_B\}_{K_{BC}}$.

---

## CHUYÊN ĐỀ 2: BẢO MẬT MẠNG KHÔNG DÂY (WEP, WPA, WPA2/WPA3) & PHÂN TÍCH LỖ HỔNG WEP

*(Trích từ Chương 8 – An toàn mạng của thầy Nguyễn Khanh Văn và thầy Bùi Trọng Tùng).*

### Câu hỏi Tự luận Chuẩn Đề thi:
1. Trình bày cơ chế mã hóa và kiểm tra toàn vẹn của chuẩn bảo mật mạng không dây **WEP (Wired Equivalent Privacy - IEEE 802.11)**.
2. Phân tích chi tiết **4 lỗ hổng thiết kế mật mã chí mạng** khiến giao thức WEP bị bẻ gãy hoàn toàn chỉ trong vài phút. Chuẩn **WPA (TKIP)** và **WPA2 (CCMP/AES)** đã khắc phục các lỗ hổng đó như thế nào?

---

### Lời giải Chi tiết Chuyên đề 2:

#### 1. Cơ chế hoạt động của WEP (Wired Equivalent Privacy)
- **Mục tiêu:** Cung cấp tính bí mật (bằng mã dòng **RC4**) và tính toàn vẹn dữ liệu (bằng **CRC-32**) cho mạng WLAN.
- **Quy trình tại bên gửi:**
  1. Cho bản rõ $M$. Tính giá trị kiểm tra toàn vẹn **ICV (Integrity Check Value)** dài 32 bit bằng đa thức kiểm tra dư vòng tuyến tính:
     $$\text{ICV} = \text{CRC-32}(M)$$
  2. Chọn một Vector khởi tạo **IV (Initialization Vector)** có độ dài chỉ **$24$ bit**, ghép nối với khóa gốc tĩnh $K_{\text{root}}$ (dài $40$ bit hoặc $104$ bit) để tạo thành hạt giống khóa $K_{\text{seed}} = IV \parallel K_{\text{root}}$ (dài $64$ hoặc $128$ bit).
  3. Đưa $K_{\text{seed}} = IV \parallel K_{\text{root}}$ vào bộ sinh dòng khóa giả ngẫu nhiên **RC4** để sinh dòng khóa $\text{RC4}(IV \parallel K_{\text{root}})$.
  4. Thực hiện phép XOR với $(M \parallel \text{ICV})$ và gửi kèm $IV$ dạng rõ ở đầu khung tin:
     $$\boxed{\text{Frame WEP} = IV \;\parallel\; \Big((M \parallel \text{CRC-32}(M)) \oplus \text{RC4}(IV \parallel K_{\text{root}})\Big)}$$

---

#### 2. Bốn lỗ hổng mật mã chí mạng của WEP

1. **Lỗ hổng 1 – Kích thước $IV$ quá ngắn ($24$ bit) và tái sử dụng khóa tĩnh $K_{\text{root}}$ dẫn đến trùng lặp dòng khóa (Keystream Reuse / Two-Time Pad):**
   - $IV$ chỉ dài $24$ bit nên chỉ có tối đa $2^{24} \approx 16,77$ triệu giá trị khác nhau (và theo nghịch lý ngày sinh nhật – *Birthday Paradox*, chỉ sau khoảng $\sqrt{2^{24}} = 2^{12} = 4096$ khung tin ngẫu nhiên là bắt đầu có xác suất cao trùng $IV$; thậm chí nhiều card mạng khởi tạo lại $IV = 0$ mỗi khi bật máy).
   - Vì khóa gốc $K_{\text{root}}$ không đổi, khi hai gói tin có cùng $IV$, bộ sinh $\text{RC4}(IV \parallel K_{\text{root}})$ sinh ra **hai dòng khóa giống hệt nhau**!
   - Kẻ nghe lén lấy hai bản mã XOR với nhau: $C_1 \oplus C_2 = P_1 \oplus P_2$, triệt tiêu hoàn toàn dòng khóa RC4!
2. **Lỗ hổng 2 – Cách ghép trực tiếp $IV \parallel K_{\text{root}}$ làm lộ khóa gốc qua điểm yếu của thuật toán lập lịch khóa RC4 (FMS / KoreK / PTW Attack):**
   - Trong WEP, $IV$ công khai được nối trực tiếp vào đầu khóa bí mật $K_{\text{root}}$ rồi đưa thẳng vào thuật toán khởi tạo mảng hoán vị KSA (*Key Scheduling Algorithm*) của RC4 mà không qua hàm băm.
   - Một số giá trị $IV$ yếu (*Weak IVs*) làm các byte đầu tiên của dòng khóa RC4 rò rỉ thông tin thống kê trực tiếp về các byte của khóa gốc $K_{\text{root}}$ (tấn công **Fluhrer–Mantin–Shamir - FMS** và tấn công **PTW** cho phép tìm ra toàn bộ khóa WEP chỉ sau $40.000$ – $85.000$ gói tin ARP!).
3. **Lỗ hổng 3 – Dùng hàm tuyến tính CRC-32 không có khóa làm mã kiểm tra toàn vẹn (Linearity of CRC-32):**
   - CRC-32 được thiết kế để phát hiện lỗi truyền thông ngẫu nhiên, **không phải là hàm băm mật mã hay MAC**.
   - Đặc biệt, CRC-32 có **tính chất tuyến tính đối với phép XOR**:
     $$\text{CRC-32}(M \oplus \Delta) = \text{CRC-32}(M) \oplus \text{CRC-32}(\Delta)$$
   - Do mã dòng RC4 cũng dùng phép XOR, kẻ tấn công muốn sửa bản rõ $M$ thành $M' = M \oplus \Delta$ (mà không cần biết $M$ và không cần biết khóa $K_{\text{root}}$!) chỉ việc tính $\text{CRC-32}(\Delta)$ và XOR $(\Delta \parallel \text{CRC-32}(\Delta))$ trực tiếp vào bản mã $C$:
     $$C' = C \oplus (\Delta \parallel \text{CRC-32}(\Delta)) = \big((M \oplus \Delta) \parallel \text{CRC-32}(M \oplus \Delta)\big) \oplus \text{RC4}(IV \parallel K_{\text{root}})$$
     Điểm truy cập (AP) khi giải mã sẽ thấy CRC-32 hoàn toàn hợp lệ!
4. **Lỗ hổng 4 – Không có cơ chế quản lý và cập nhật khóa phiên tự động & Xác thực Challenge–Response yếu:**
   - Mọi người dùng dùng chung một khóa tĩnh $K_{\text{root}}$ thủ công.
   - Chế độ xác thực *Shared Key Authentication* của WEP gửi thách đố $R$ dạng rõ và nhận về $R \oplus \text{RC4}(IV \parallel K_{\text{root}})$, vô tình tặng không cho kẻ nghe lén đúng 128 byte dòng khóa $\text{RC4}(IV \parallel K_{\text{root}})$!

---

#### 3. Cách WPA và WPA2/WPA3 khắc phục triệt để các lỗ hổng của WEP

| Điểm yếu của WEP | Cách khắc phục trong **WPA (TKIP)** *(Giải pháp chuyển tiếp trên phần cứng cũ)* | Cách khắc phục trong **WPA2 (CCMP / AES)** *(Giải pháp chuẩn dài hạn)* |
| :--- | :--- | :--- |
| **$IV$ 24-bit quá ngắn** | Tăng kích thước $IV$ (Sequence Counter – TSC) lên **$48$ bit** ($2^{48}$ gói tin) và kiểm tra thứ tự tăng dần để chống Replay. | Dùng **Packet Number (PN) $48$ bit** kết hợp trong chế độ **AES-CCM**. |
| **Ghép trần $IV \parallel K_{\text{root}}$** | Dùng hàm trộn khóa 2 pha (**Per-packet Key Mixing**) trộn khóa tạm thời $TK$, địa chỉ MAC và $IV$ 48-bit tạo khóa mới cho từng gói tin trước khi đưa vào RC4. | Thay thế hoàn toàn RC4 bằng mã khối chuẩn **AES-128** ở chế độ **Counter Mode (CTR)**. |
| **Toàn vẹn tuyến tính CRC-32** | Bổ sung mã xác thực thông điệp có khóa **Michael (64-bit MIC)**. | Sử dụng chuẩn **CBC-MAC (64-bit MIC)** tích hợp trong chế độ **CCMP** (Mã hóa có xác thực – Authenticated Encryption). |
| **Khóa tĩnh dùng chung** | Thiết lập khóa phiên động thông qua bắt tay 4 bước (**4-Way Handshake**) hoặc xác thực **IEEE 802.1X / RADIUS Server**. | Bắt tay 4 bước (**4-Way Handshake**) sinh khóa phiên PTK mới cho mỗi phiên kết nối; WPA3 nâng cấp lên giao thức **SAE (Dragonfly)** chống tấn công từ điển ngoại tuyến. |

---

## CHUYÊN ĐỀ 3: AN TOÀN CHƯƠNG TRÌNH – TẤN CÔNG TRÀN BỘ ĐỆM (STACK BUFFER OVERFLOW) & CÁCH PHÒNG CHỐNG

*(Trích từ Chương 9 – An toàn chương trình của thầy Nguyễn Khanh Văn và thầy Bùi Trọng Tùng).*

### Câu hỏi Tự luận Chuẩn Đề thi:
1. Vẽ sơ đồ bố cục ngăn xếp (**Stack Frame Layout**) trên kiến trúc x86 khi một hàm `func(int a, int b)` được gọi, trong đó hàm khai báo một mảng cục bộ `char buf[64]`. Chỉ rõ chiều phát triển của Stack và chiều ghi dữ liệu vào mảng `buf`.
2. Giải thích cơ chế tấn công **Tràn bộ đệm trên ngăn xếp (Stack-based Buffer Overflow / Stack Smashing)** để chiếm quyền điều khiển luồng thực thi CPU. Vai trò của chuỗi lệnh `NOP Sled` (`0x90`) và `Shellcode` là gì?
3. Trình bày các biện pháp phòng chống tràn bộ đệm ở cấp độ: (i) Lập trình viên, (ii) Trình biên dịch (*Stack Canary*), và (iii) Hệ điều hành / Phần cứng (*DEP/NX bit* và *ASLR*).

---

### Lời giải Chi tiết Chuyên đề 3:

#### 1. Sơ đồ bố cục Ngăn xếp (Stack Frame) trên kiến trúc x86
Trên kiến trúc x86/x86-64, ngăn xếp (**Stack**) phát triển từ **địa chỉ bộ nhớ cao xuống địa chỉ bộ nhớ thấp** (khi thực hiện lệnh `PUSH`), trong khi việc ghi dữ liệu vào mảng/chuỗi C (`buf[0], buf[1], ...`) lại ghi từ **địa chỉ thấp lên địa chỉ cao**!

```
Địa chỉ bộ nhớ CAO (High Memory Address)
  +---------------------------------------------------+
  | Tham số thứ 2 của hàm: b                          |  [EBP + 12]
  +---------------------------------------------------+
  | Tham số thứ 1 của hàm: a                          |  [EBP + 8]
  +---------------------------------------------------+
  | ĐỊA CHỈ TRẢ VỀ (Saved Return Address - RET)       |  [EBP + 4]  <-- Mục tiêu ghi đè của Attacker!
  +---------------------------------------------------+
  | Con trỏ khung ngăn xếp cũ (Saved Frame Pointer)   |  [EBP]      <-- Thanh ghi EBP trỏ vào đây
  +---------------------------------------------------+
  | (Stack Canary - nếu trình biên dịch bật bảo vệ)   |  [EBP - 4]
  +---------------------------------------------------+
  | Biến cục bộ (Local Buffer): char buf[64]          |  ▲ Chiều ghi chuỗi strcpy/gets (Thấp -> Cao)
  |   buf[63] ...                                     |  │
  |   ...                                             |  │ (Nếu ghi > 64 bytes sẽ tràn qua EBP
  |   buf[0]                                          |  │  và ghi đè lên Return Address RET!)
  +---------------------------------------------------+  ▼ Chiều phát triển của Stack (Cao -> Thấp)
Địa chỉ bộ nhớ THẤP (Low Memory Address)                 <-- Thanh ghi đỉnh ngăn xếp ESP
```

---

#### 2. Cơ chế Tấn công Stack Buffer Overflow để chiếm quyền điều khiển CPU
- **Nguyên nhân gốc rễ:** Ngôn ngữ C/C++ không tự động kiểm tra giới hạn mảng (*No automatic bounds checking*). Khi lập trình viên sử dụng các hàm không an toàn như `gets()`, `strcpy()`, `strcat()`, `sprintf()`, `scanf("%s", ...)` để đọc dữ liệu từ người dùng vào bộ đệm `buf[64]` mà dữ liệu đầu vào dài hơn $64$ bytes:
- **Các bước diễn biến cuộc tấn công:**
  1. Dữ liệu vượt quá kích thước `buf[64]` sẽ tràn lên các ô nhớ có địa chỉ cao hơn, lần lượt ghi đè lên các biến cục bộ lân cận, ghi đè lên `Saved EBP`, và ghi đè lên **Địa chỉ trả về (`Saved Return Address - RET`)** tại `[EBP + 4]`.
  2. Kẻ tấn công thiết kế một chuỗi đầu vào độc hại (**Payload**) gồm 3 phần:
     $$\boxed{\text{Payload} = \underbrace{\text{NOP Sled }(\texttt{0x90}\dots\texttt{0x90})}_{\text{Vùng trượt lệnh rỗng}} \;\parallel\; \underbrace{\text{Shellcode}}_{\text{Mã máy mở shell } \texttt{/bin/sh}} \;\parallel\; \underbrace{\text{Địa chỉ mới } \texttt{RET'}}_{\text{Trỏ về vùng NOP Sled}}}$$
  3. Khi hàm `func()` thực thi xong và gọi lệnh `RET` (tương đương `POP EIP`), CPU lấy giá trị tại ô nhớ `Return Address` nạp vào thanh ghi con trỏ lệnh `EIP` (hoặc `RIP`).
  4. Do `Return Address` đã bị ghi đè thành địa chỉ `RET'` trỏ vào vùng `NOP Sled` trong `buf`, CPU nhảy tới vùng `NOP Sled`, trượt dọc qua các lệnh `NOP` (`0x90` – không làm gì cả, giúp kẻ tấn công không cần đoán chính xác tuyệt đối địa chỉ byte đầu của Shellcode) rồi thực thi **Shellcode** với đúng quyền hạn của tiến trình đang chạy (ví dụ quyền `root` nếu là chương trình `setuid`)!

---

#### 3. Các lớp cơ chế phòng chống Tràn bộ đệm

1. **Ở mức Lập trình viên (Secure Coding Practices):**
   - Tuyệt đối không dùng các hàm không giới hạn độ dài (`gets`, `strcpy`, `strcat`, `sprintf`); thay thế bằng các hàm có kiểm tra kích thước bộ đệm như `fgets()`, `strncpy()`, `strncat()`, `snprintf()`.
   - Kiểm tra chặt chẽ chiều dài và định dạng dữ liệu đầu vào (*Input Validation*) hoặc sử dụng các ngôn ngữ an toàn bộ nhớ (*Memory-safe languages* như Rust, Java, Go, Python).
2. **Ở mức Trình biên dịch – Stack Canary (`StackGuard` / `gcc -fstack-protector`):**
   - Khi hàm bắt đầu thực thi, trình biên dịch chèn một giá trị ngẫu nhiên bí mật gọi là **Canary** vào ngay giữa biến cục bộ `buf` và `Saved EBP / Return Address`.
   - Trước khi hàm thực hiện lệnh `RET`, chương trình kiểm tra xem giá trị `Canary` trên Stack có còn nguyên vẹn hay không. Vì tấn công tràn bộ đệm tuần tự từ `buf` lên `Return Address` bắt buộc phải đi ngang qua và làm hỏng `Canary`, chương trình sẽ phát hiện sự thay đổi và lập tức dừng tiến trình (`__stack_chk_fail`) trước khi lệnh `RET` kịp chạy!
3. **Ở mức Hệ điều hành và Phần cứng:**
   - **DEP (Data Execution Prevention) / NX bit (No-eXecute) / $W \oplus X$:** Đánh dấu các vùng nhớ dữ liệu như **Stack** và **Heap** là **Chỉ đọc/ghi, KHÔNG được phép thực thi mã lệnh (Non-Executable)**. Nếu CPU nhảy `EIP` vào Stack để chạy Shellcode, phần cứng MMU sẽ ném ngoại lệ lỗi phân đoạn (*Segmentation Fault*) ngay lập tức. *(Kẻ tấn công phải chuyển sang kỹ thuật nâng cao hơn như Return-to-libc hoặc ROP – Return-Oriented Programming).*
   - **ASLR (Address Space Layout Randomization):** Ngẫu nhiên hóa vị trí địa chỉ cơ sở của Stack, Heap, và các thư viện liên kết động (`libc`) trong bộ nhớ ảo mỗi lần chương trình khởi chạy, khiến kẻ tấn công không thể biết trước địa chỉ cố định để điền vào `RET'`.

---

## CHUYÊN ĐỀ 4: KIỂM SOÁT TRUY NHẬP (ACCESS CONTROL: DAC, MAC, RBAC) & MÔ HÌNH BELL–LAPADULA / BIBA

*(Trích từ Chương 7 – Kiểm soát truy nhập của thầy Nguyễn Khanh Văn và thầy Bùi Trọng Tùng).*

### Câu hỏi Tự luận Chuẩn Đề thi:
1. Phân biệt 3 chính sách kiểm soát truy nhập cơ bản: **DAC (Discretionary Access Control)**, **MAC (Mandatory Access Control)** và **RBAC (Role-Based Access Control)**. Nêu cấu trúc biểu diễn Ma trận kiểm soát truy nhập (*Access Control Matrix*) theo hai cách: **ACL (Access Control List)** và **Capability List**.
2. Trong mô hình đa mức bảo mật **Bell–LaPadula (BLP)**: Hãy phát biểu hai quy tắc **Simple Security Property (No Read Up)** và **\*-Property (Star Property – No Write Down)**. Tại sao cần cả hai quy tắc này để bảo vệ **Tính bí mật (Confidentiality)** chống lại phần mềm gián điệp **Trojan Horse**? So sánh ngắn gọn với mô hình **Biba** bảo vệ **Tính toàn vẹn (Integrity)**.

---

### Lời giải Chi tiết Chuyên đề 4:

#### 1. So sánh 3 mô hình Kiểm soát truy nhập DAC, MAC, RBAC và ACL vs Capability

| Mô hình | Nguyên lý cốt lõi | Ưu điểm & Nhược điểm chính | Ví dụ thực tế |
| :--- | :--- | :--- | :--- |
| **DAC**<br>*(Discretionary Access Control – Kiểm soát truy nhập tùy quyền)* | **Chủ sở hữu (Owner)** của đối tượng dữ liệu có toàn quyền quyết định cấp hoặc thu hồi quyền truy nhập (`Read`, `Write`, `Execute`) cho các chủ thể khác. | - **Ưu:** Linh hoạt, dễ quản trị cho người dùng cá nhân.<br>- **Nhược:** **Bị tấn công bởi Trojan Horse** (vì tiến trình chạy dưới quyền của người dùng kế thừa toàn bộ quyền của người dùng đó và có thể tự ý sao chép file mật ra file công khai). | Quyền file truyền thống trên UNIX/Linux (`rwxr-xr-x`, `chmod`, `chown`) và Windows NTFS ACL. |
| **MAC**<br>*(Mandatory Access Control – Kiểm soát truy nhập bắt buộc)* | Hệ thống trung tâm gắn **Nhãn bảo mật (Security Labels / Clearances)** cho mọi Chủ thể ($S$) và Đối tượng ($O$). Ngay cả chủ sở hữu tạo ra file cũng **không được tự ý cấp quyền** trái với quy tắc nhãn của hệ thống. | - **Ưu:** Bảo mật cực cao, **chống được Trojan Horse**, kiểm soát chặt luồng thông tin (*Information Flow*).<br>- **Nhược:** Cứng nhắc, chi phí quản trị và gán nhãn cao. | Hệ thống quân sự, SELinux, AppArmor, cơ sở dữ liệu đa mức. |
| **RBAC**<br>*(Role-Based Access Control – Kiểm soát truy nhập dựa trên vai trò)* | Quyền hạn không gán trực tiếp cho từng cá nhân mà gán cho các **Vai trò (Roles)** theo chức danh công việc; người dùng được gán vào các Vai trò tương ứng: $\text{Users} \leftrightarrow \text{Roles} \leftrightarrow \text{Permissions}$. | - **Ưu:** Quản trị doanh nghiệp cực kỳ hiệu quả, dễ áp dụng nguyên tắc **Đặc quyền tối thiểu (Least Privilege)** và **Phân tách nhiệm vụ (Separation of Duties - SoD)**. | Hệ thống ERP, Ngân hàng, IAM trên Cloud (AWS/Azure), Quản trị CSDL. |

- **Hai cách cài đặt Ma trận kiểm soát truy nhập $M[S, O]$:**
  - **ACL (Access Control List – Phân rã theo CỘT / Đối tượng):** Gắn với mỗi **Đối tượng (File)** một danh sách các $(Subject, Rights)$. Thuận tiện khi cần tra cứu *"Ai có quyền truy nhập vào file $O_j$ này?"*.
  - **Capability List (Danh sách khả năng – Phân rã theo HÀNG / Chủ thể):** Gắn với mỗi **Chủ thể (User/Process)** một danh sách các "vé" không thể làm giả $(Object, Rights)$. Thuận tiện khi cần tra cứu *"Tiến trình $S_i$ này được phép làm gì?"*.

---

#### 2. Mô hình Bell–LaPadula (BLP) chống Trojan Horse và So sánh với Mô hình Biba

Giả sử các mức phân loại an toàn được sắp thứ tự: $\text{Top Secret (TS)} > \text{Secret (S)} > \text{Confidential (C)} > \text{Unclassified (U)}$. Ký hiệu $L(S)$ là mức thẩm tra an ninh (*Clearance*) của chủ thể $S$, và $L(O)$ là mức phân loại (*Classification*) của đối tượng $O$.

##### a) Hai quy tắc vàng của mô hình Bell–LaPadula (Bảo vệ Tính bí mật – Confidentiality):
1. **Quy tắc Bảo mật đơn giản (Simple Security Property – *"No Read Up" / Không đọc lên*):**
   - Chủ thể $S$ chỉ được phép **ĐỌC (Read)** đối tượng $O$ khi và chỉ khi:
     $$L(S) \ge L(O)$$
   - *Ý nghĩa:* Một nhân viên có mức `Secret` không được phép đọc tài liệu mức `Top Secret`.
2. **Quy tắc Sao (\*-Property / Star Property – *"No Write Down" / Không ghi xuống*):**
   - Chủ thể $S$ đang hoạt động ở mức $L(S)$ chỉ được phép **GHI (Write / Append)** vào đối tượng $O$ khi và chỉ khi:
     $$L(S) \le L(O)$$
   - *Tại sao bắt buộc phải có quy tắc "No Write Down" để chống Trojan Horse?*
     Giả sử chỉ có quy tắc *"No Read Up"*: Một con **Trojan Horse** ẩn trong phần mềm soạn thảo văn bản được một vị tướng có quyền `Top Secret` chạy. Tiến trình Trojan này kế thừa mức quyền $L(S) = \text{Top Secret}$, nên nó hợp pháp đọc được file mật $O_1$ (`Top Secret`). Nếu không có quy tắc *"No Write Down"*, con Trojan này sẽ lập tức **ghi (sao chép) nội dung vừa đọc được xuống một file công khai $O_2$ ở mức `Unclassified`** để kẻ tấn công bên ngoài đọc! Nhờ quy tắc **No Write Down ($L(S) \le L(O)$)**, tiến trình mức `Top Secret` bị cấm tuyệt đối việc ghi dữ liệu xuống file mức `Secret` hay `Unclassified`, chặn đứng hoàn toàn việc rò rỉ thông tin từ mức cao xuống mức thấp!

##### b) So sánh đối ngẫu giữa Bell–LaPadula (Confidentiality) và Biba (Integrity):

| Mô hình | Mục tiêu bảo vệ | Quy tắc ĐỌC (Read) | Quy tắc GHI (Write) | Hướng luồng thông tin cho phép |
| :--- | :--- | :--- | :--- | :--- |
| **Bell–LaPadula (BLP)** | **Tính bí mật (Confidentiality)** | **No Read Up:** $L(S) \ge L(O)$ | **No Write Down:** $L(S) \le L(O)$ | Chỉ cho phép thông tin chảy từ **Mức thấp $\longrightarrow$ Mức cao**. |
| **Biba** | **Tính toàn vẹn (Integrity)** | **No Read Down:** $I(S) \le I(O)$ *(Chủ thể mức tin cậy cao không đọc dữ liệu bẩn ở mức thấp)* | **No Write Up:** $I(S) \ge I(O)$ *(Chủ thể mức tin cậy thấp không được ghi làm bẩn dữ liệu mức cao)* | Chỉ cho phép thông tin chảy từ **Mức toàn vẹn cao $\longrightarrow$ Mức toàn vẹn thấp**. |

---

## CHUYÊN ĐỀ 5: ĐỀ THI CUỐI KỲ MẪU TỔNG HỢP (90 PHÚT) KÈM ĐÁP ÁN CHI TIẾT

### ĐỀ THI CUỐI KỲ MẪU HỌC PHẦN IT4015 (Thời gian: 90 phút)

- **Câu 1 (2,0 điểm):** Cho hệ mật RSA với $p = 47, q = 71, e = 79$.
  a) Tìm khóa riêng $d$ bằng thuật toán Euclid mở rộng.  
  b) Ký số lên giá trị băm $H(M) = 100$ của thông điệp $M$ và trình bày cách xác minh chữ ký.
- **Câu 2 (2,5 điểm):** Xét giao thức xác thực hai chiều dùng khóa công khai giữa $A$ và $B$:
  1. $A \to B: E_{PU_B}(N_A \parallel ID_A)$
  2. $B \to A: E_{PU_A}(N_A \parallel N_B)$
  3. $A \to B: E_{PU_B}(N_B)$
  Hãy chỉ ra tấn công **Man-in-the-Middle (Tấn công Lowe trên Needham–Schroeder Public-Key)** khi $A$ chủ động khởi tạo phiên với kẻ nội gián $E$ (trong đó $E$ là một người dùng hợp lệ trong hệ thống có cặp khóa $(PU_E, PR_E)$), và $E$ lợi dụng thông tin đó để mạo danh $A$ trước $B$! Nêu cách sửa đúng 1 chi tiết ở Bước 2 để vá lỗ hổng.
- **Câu 3 (2,5 điểm):** Phân tích cơ chế tấn công **SQL Injection** trên câu truy vấn đăng nhập:
  `SELECT * FROM Users WHERE username = '` + `u_input` + `' AND password = '` + `p_input` + `';`
  Nếu kẻ tấn công nhập `u_input` là `admin' -- ` (hoặc `' OR '1'='1`), câu lệnh SQL thực thi sẽ biến đổi như thế nào? Nêu giải pháp khắc phục triệt để bằng *Prepared Statements (Parameterized Queries)*.
- **Câu 4 (3,0 điểm):** Cho hệ thống có 3 mức bảo mật `Top Secret (TS) > Secret (S) > Public (P)` và 2 danh mục (Categories) `{NUC, EUR}`. Áp dụng mô hình mạng tinh thể (*Lattice*) trong Bell–LaPadula với quan hệ thống trị nhãn $(L_1, C_1) \text{ dom } (L_2, C_2) \iff (L_1 \ge L_2) \land (C_1 \supseteq C_2)$:
  Xác định xem Chủ thể $S_1 = (\text{Secret}, \{\text{NUC}, \text{EUR}\})$ có được phép Đọc hoặc Ghi lên các Đối tượng $O_1 = (\text{Secret}, \{\text{NUC}\})$, $O_2 = (\text{Top Secret}, \{\text{NUC}, \text{EUR}\})$ và $O_3 = (\text{Public}, \{\text{NUC}, \text{EUR}, \text{ASIA}\})$ hay không? Giải thích.

---

### ĐÁP ÁN CHI TIẾT ĐỀ THI CUỐI KỲ MẪU

#### Giải Câu 1 (2,0 điểm):
1. **Tính $n, \phi(n)$ và tìm $d$:**
   - $n = p \times q = 47 \times 71 = 3337$.
   - $\phi(n) = (47 - 1)(71 - 1) = 46 \times 70 = 3220$.
   - Tìm $d = 79^{-1} \pmod{3220}$ bằng Euclid mở rộng:
     - $3220 = 40 \times 79 + 60 \implies r_1 = 60, \; t_1 = -40$
     - $79 = 1 \times 60 + 19 \implies r_2 = 19, \; t_2 = 1 - 1(-40) = 41$
     - $60 = 3 \times 19 + 3 \implies r_3 = 3, \; t_3 = -40 - 3(41) = -163$
     - $19 = 6 \times 3 + 1 \implies r_4 = 1, \; t_4 = 41 - 6(-163) = 41 + 978 = \mathbf{1019}$.
     Vậy khóa riêng là $\boxed{d = 1019}$ (Kiểm tra: $79 \times 1019 = 80501 = 25 \times 3220 + 1$).
2. **Tạo và xác minh chữ ký số cho $H(M) = 100$:**
   - **Ký số (bằng khóa riêng $d = 1019$):**
     $$\sigma = H(M)^d \bmod n = 100^{1019} \bmod 3337 = 1608$$
   - **Xác minh chữ ký (bằng khóa công khai $e = 79$):**
     Người nhận tính $\sigma^e \bmod n = 1608^{79} \bmod 3337 = 100 = H(M) \implies$ Chữ ký hợp lệ.

---

#### Giải Câu 2 (2,5 điểm) – Tấn công Lowe (1995) trên Needham–Schroeder Public-Key:
- **Kịch bản tấn công Man-in-the-Middle của Gavin Lowe:**
  Giả sử người dùng trung thực $A$ chủ động bắt đầu một phiên giao tiếp hợp lệ với $E$ (một thực thể trong mạng nhưng là kẻ xấu), và $E$ đồng thời mở phiên thứ hai với $B$ để mạo danh $A$:
  1. **Bước 1a ($A \to E$):** $A$ gửi cho $E$: $E_{PU_E}(N_A \parallel ID_A)$.
  2. **Bước 1b ($E(A) \to B$):** $E$ dùng khóa riêng $PR_E$ giải mã lấy được $N_A$, rồi mã hóa lại bằng $PU_B$ gửi cho $B$ dưới danh nghĩa $A$:
     $$E(A) \longrightarrow B: \quad E_{PU_B}(N_A \parallel ID_A)$$
  3. **Bước 2b ($B \to E(A)$):** $B$ tưởng đang nói chuyện với $A$, nên sinh $N_B$ và mã hóa bằng $PU_A$ gửi trả:
     $$B \longrightarrow E(A): \quad E_{PU_A}(N_A \parallel N_B)$$
  4. **Bước 2a ($E \to A$):** Vì bản tin trên được mã hóa bằng $PU_A$, $E$ không tự giải mã được, nhưng $E$ **chuyển tiếp nguyên xi** bản tin $E_{PU_A}(N_A \parallel N_B)$ đó cho $A$ như thể đó là câu trả lời Bước 2 của $E$ trong phiên thứ nhất!
  5. **Bước 3a ($A \to E$):** $A$ giải mã bằng $PR_A$, thấy đúng số $N_A$ mình vừa gửi cho $E$ ở Bước 1a (vì Bước 2 **không hề có định danh của người trả lời**!), nên $A$ ngoan ngoãn giải mã lấy $N_B$, mã hóa lại bằng $PU_E$ và gửi cho $E$:
     $$A \longrightarrow E: \quad E_{PU_E}(N_B)$$
  6. **Bước 3b ($E(A) \to B$):** $E$ dùng $PR_E$ giải mã lấy được $N_B$, rồi mã hóa bằng $PU_B$ gửi cho $B$:
     $$E(A) \longrightarrow B: \quad E_{PU_B}(N_B)$$
     $B$ kiểm tra thấy đúng $N_B$ $\implies$ **$B$ tin tưởng tuyệt đối rằng đang kết nối với $A$ và dùng chung cặp bí mật $(N_A, N_B)$ với $A$, trong khi thực chất người ở đầu dây bên kia là $E$!**
- **Giải pháp khắc phục của Gavin Lowe (Sửa đúng Bước 2):**
  Đưa định danh của người phản hồi ($ID_B$) vào bên trong bản mã Bước 2:
  $$\boxed{\text{Bước 2 đã sửa:} \quad B \longrightarrow A: \quad E_{PU_A}(N_A \parallel N_B \parallel \mathbf{ID_B})}$$
  Khi đó ở Bước 4 của kịch bản tấn công, khi $E$ chuyển tiếp $E_{PU_A}(N_A \parallel N_B \parallel ID_B)$ cho $A$, $A$ giải mã ra thấy bên trong ghi $ID_B$ trong khi $A$ đang mở phiên với $ID_E$ ($ID_B \neq ID_E$), nên $A$ phát hiện ngay cuộc tấn công và hủy phiên!

---

#### Giải Câu 3 (2,5 điểm) – Phân tích SQL Injection và Cách khắc phục:
- Khi kẻ tấn công nhập `u_input` là `admin' -- ` (và `p_input` bất kỳ, ví dụ `abc`), chuỗi câu lệnh SQL được ghép nối động trở thành:
  ```sql
  SELECT * FROM Users WHERE username = 'admin' -- ' AND password = 'abc';
  ```
- Trong SQL, ký hiệu `-- ` biến toàn bộ phần phía sau (`' AND password = 'abc';`) thành **chú thích (Comment)** bị trình thông dịch SQL bỏ qua! Câu truy vấn thực tế chỉ còn lại:
  ```sql
  SELECT * FROM Users WHERE username = 'admin';
  ```
  Hệ thống trả về bản ghi của `admin` mà **bỏ qua hoàn toàn bước kiểm tra mật khẩu**, cho phép kẻ tấn công đăng nhập thẳng vào tài khoản quản trị!
- *(Hoặc nếu nhập `' OR '1'='1`, điều kiện `WHERE` trở thành `username = '' OR '1'='1'`, luôn đúng (`TRUE`), trả về toàn bộ bảng `Users`).*
- **Giải pháp khắc phục triệt để:**
  Sử dụng **Prepared Statements (Parameterized Queries – Truy vấn tham số hóa)**:
  ```sql
  PREPARE stmt FROM 'SELECT * FROM Users WHERE username = ? AND password_hash = ?';
  ```
  Khi dùng Prepared Statements, cây cú pháp SQL (*SQL Execution Plan*) được biên dịch cố định trước khi nạp tham số; mọi dữ liệu người dùng nhập vào dấu `?` chỉ được coi là **giá trị hằng chuỗi thuần túy (Literal Data)** chứ không bao giờ được thông dịch thành mã lệnh SQL.

---

#### Giải Câu 4 (3,0 điểm) – Bài tập Mạng tinh thể (Lattice) trong Bell–LaPadula:
Cho Chủ thể $S_1 = (\text{Secret}, \{\text{NUC}, \text{EUR}\})$.
- Theo định nghĩa quan hệ thống trị (*Dominates* – ký hiệu $\text{dom}$):
  $$(L_A, C_A) \text{ dom } (L_B, C_B) \iff (L_A \ge L_B) \text{ và } (C_A \supseteq C_B)$$
  - Quy tắc **No Read Up (Simple Security):** $S_1$ đọc được $O_i \iff S_1 \text{ dom } O_i$.
  - Quy tắc **No Write Down (\*-Property):** $S_1$ ghi được vào $O_i \iff O_i \text{ dom } S_1$.

1. **Xét Đối tượng $O_1 = (\text{Secret}, \{\text{NUC}\})$:**
   - So sánh mức độ: $\text{Secret} \ge \text{Secret}$ (Đúng).
   - So sánh tập danh mục: $\{\text{NUC}, \text{EUR}\} \supseteq \{\text{NUC}\}$ (Đúng), nhưng $\{\text{NUC}\} \not\supseteq \{\text{NUC}, \text{EUR}\}$.
   - Vậy $S_1 \text{ dom } O_1$ (nhưng $O_1$ không dom $S_1$).
   - **Kết luận cho $O_1$:** $S_1$ **ĐƯỢC ĐỌC (Read)** $O_1$, nhưng **KHÔNG ĐƯỢC GHI (No Write)** vào $O_1$ (vì nếu ghi vào $O_1$ sẽ làm lộ thông tin thuộc danh mục `EUR` sang file chỉ có nhãn `NUC`).

2. **Xét Đối tượng $O_2 = (\text{Top Secret}, \{\text{NUC}, \text{EUR}\})$:**
   - Ta có $\text{Top Secret} > \text{Secret}$ và $\{\text{NUC}, \text{EUR}\} \supseteq \{\text{NUC}, \text{EUR}\}$.
   - Vậy $O_2 \text{ dom } S_1$ (nhưng $S_1$ không dom $O_2$).
   - **Kết luận cho $O_2$:** $S_1$ **KHÔNG ĐƯỢC ĐỌC (No Read)** $O_2$ (vi phạm No Read Up), nhưng **ĐƯỢC PHÉP GHI / APPEND (Write)** vào $O_2$ (thỏa mãn \*-Property).

3. **Xét Đối tượng $O_3 = (\text{Public}, \{\text{NUC}, \text{EUR}, \text{ASIA}\})$:**
   - Về mức độ: $L(S_1) = \text{Secret} > L(O_3) = \text{Public}$.
   - Về tập danh mục: $C(S_1) = \{\text{NUC}, \text{EUR}\} \subset C(O_3) = \{\text{NUC}, \text{EUR}, \text{ASIA}\}$.
   - Do đó: $S_1$ **không dom** $O_3$ (vì thiếu danh mục `ASIA`), và $O_3$ cũng **không dom** $S_1$ (vì mức `Public` thấp hơn `Secret`). Hai nhãn này **không so sánh được (Non-comparable)** trong mạng tinh thể Lattice!
   - **Kết luận cho $O_3$:** $S_1$ **KHÔNG ĐƯỢC ĐỌC và CŨNG KHÔNG ĐƯỢC GHI** đối với $O_3$!
