# ĐỀ TỰ LUẬN 2022.1 – PHÂN TÍCH GIAO THỨC AN TOÀN VÀ ỨNG DỤNG (`PRT_AU`, `PROT_0X`, `PROT_1Y` & GIAO THỨC 5 BƯỚC)
## Lời giải Chi tiết Trọn vẹn cho Mọi Mã số Sinh viên $(X, Y) \in \{(0,0), (0,1), (1,0), (1,1)\}$

> **Trường Đại học Bách khoa Hà Nội (HUST) – Trường Công nghệ Thông tin và Truyền thông (SoICT)**  
> **Tác giả đề gốc:** PGS.TS. Nguyễn Khanh Văn (file gốc `2022.1 MTT - 2.docx`)  
> **Tổng điểm phần tự luận:** 40 điểm (Câu 1: 10pt; Câu 2: 16pt; Câu 3: 14pt).

---

## PHẦN I: NGUYÊN VĂN ĐỀ THI TỰ LUẬN (TRÍCH XUẤT CHÍNH XÁC TỪ `2022.1 MTT - 2.docx`)

### PHẦN ĐỀ TỰ LUẬN: Giao thức an toàn và ứng dụng

*Với mỗi sinh viên, trước hết em hãy xác định cho mình giá trị:*
- $X = (\text{MSSV} \bmod 2)$ *(Chữ số hàng đơn vị của MSSV chia 2 lấy dư)*
- $Y = (\langle\text{Hàng chục của MSSV}\rangle \bmod 2)$ *(Chữ số hàng chục của MSSV chia 2 lấy dư)*  
*(Ví dụ: MSSV `201432456` $\implies$ chữ số hàng đơn vị là `6` nên $X = 6 \bmod 2 = 0$; chữ số hàng chục là `5` nên $Y = 5 \bmod 2 = 1$).*

Trong một giờ học về ATTT, thầy Lâm giới thiệu 1 giao thức đơn giản cơ bản **`PRT_AU`** (xem dưới đây) và yêu cầu sinh viên bàn luận nhóm để phân tích mục đích & phê bình ưu-nhược; từ đó thử thiết kế một giao thức làm tốt hơn hoặc có lợi ích hơn về một phương diện nào đó. Kết quả cuối giờ có 4 sinh viên loại khá-giỏi là **An, Bình, Chi, Dũng** đã đưa ra các phiên bản mới dưới đây:

| Giao thức cơ sở của thầy Lâm | Nhóm `PROT_0X` (Câu 1) | Nhóm `PROT_1Y` (Câu 2) |
| :--- | :--- | :--- |
| **`PRT_AU`** *(thầy Lâm nêu đầu giờ)*:<br>1. $A \to S: ID_A$<br>2. $S \to A: \text{Password Request}$<br>3. $A \to S: H(PW_A) \parallel T$ | **`PROT_00`** *(của An – ứng với $X=0$)*:<br>1. $A \to S: ID_A$<br>2. $S \to A: R$<br>3. $A \to S: H(PW_A \parallel R)$<br><br>**`PROT_01`** *(của Chi – ứng với $X=1$)*:<br>1. $A \to S: ID_A \parallel H(PW_A \parallel T) \parallel T$ | **`PROT_10`** *(của Bình – ứng với $Y=0$)*:<br>1. $A \to S: ID_A$<br>2. $S \to A: R$<br>3. $A \to S: H(PW_A \parallel R)$<br>4. $S \to A: \{k_s\}_{p_A}$<br><br>**`PROT_11`** *(của Dũng – ứng với $Y=1$)*:<br>1. $A \to S: ID_A$<br>2. $S \to A: R$<br>3. $A \to S: \{R + 1\}_{p_A}$<br>4. $S \to A: \{k_s\}_{p_A}$ *(với $p_A = H(PW_A)$)* |

**Trong đó một số ký hiệu sử dụng ở trên có ý nghĩa như sau:**
- $ID_A$: là ID (danh tính) của $A$;
- $R$: là 1 số ngẫu nhiên (Nonce);
- $T$: là một nhãn thời gian (*Timestamp*) tại thời điểm hiện thời (có thể sử dụng computer clock);
- $PW_A$: là chuỗi ký tự mật khẩu của $A$;
- $p_A$: là giá trị băm của mật khẩu của $A$, tức là $p_A = H(PW_A)$ và với $H$ là một hàm băm xác định công bố trước;
- $\{M\}_K$: là bản mã thu được khi mã hóa đối xứng thông điệp $M$ bằng khóa $K$.

---

### Câu hỏi:

**Câu 1 (10pt):**  
Phân tích rõ mục đích của **`PRT_AU`** và từ đó so sánh với **`PROT_0X`** để thấy rõ ưu nhược điểm.

**Câu 2 (16pt):**  
Phân tích chỉ rõ sự khác biệt và tính năng mới của **`PROT_1Y`** so với hai giao thức ở câu trên (Câu 1).

**Câu 3 (14pt):**  
Thầy Lâm sau đó trình bày một phiên bản nâng cao khác và thách thức lớp phân tích và tìm ra vấn đề còn tồn tại:
1. $A \to S: ID_A \parallel ID_B \parallel r_1$
2. $S \to A: \big\{ID_A \parallel ID_B \parallel r_1 \parallel k_s \parallel \{ID_A \parallel k_s \parallel r_1\}_{p_B}\big\}_{p_A}$
3. $A \to B: \{ID_A \parallel k_s \parallel r_1\}_{p_B}$
4. $B \to A: \{r_2\}_{k_s}$
5. $A \to B: \{r_1 + r_2\}_{k_s}$

Sinh viên **Đạt** đã trả lời tốt câu hỏi của thầy, phân tích đúng vấn đề tồn tại và tìm ra giải pháp khắc phục thành công, trong đó **chỉ cần thực hiện 1 sửa đổi ở bước 5 mà thôi**.  
*Em hãy phân tích mục đích của giao thức và thử đoán xem vấn đề tồn tại mà Đạt chỉ ra? Nếu có thể hãy chỉ ra giải pháp khắc phục cũng như ý tưởng giải quyết của Đạt.*

---

## PHẦN II: LỜI GIẢI CHI TIẾT ĐẠT ĐIỂM TUYỆT ĐỐI (40/40 PT)

---

### CÂU 1 (10 PT): PHÂN TÍCH GIAO THỨC CƠ SỞ `PRT_AU` VÀ SO SÁNH VỚI `PROT_00` ($X=0$) & `PROT_01` ($X=1$)

#### 1. Phân tích mục đích, ưu điểm và lỗ hổng chí mạng của giao thức gốc `PRT_AU` (4,0 / 10 pt)

```
Giao thức PRT_AU:
(1) A -> S : ID_A
(2) S -> A : Password Request
(3) A -> S : H(PW_A) || T
```

##### a) Mục đích thiết kế của `PRT_AU`:
- **Xác thực thực thể một chiều (Unilateral User Authentication):** Giúp người dùng $A$ chứng minh danh tính của mình với máy chủ $S$ thông qua mật khẩu bí mật $PW_A$ mà $A$ đã đăng ký trước với $S$.
- **Ý đồ của người thiết kế khi dùng $H(PW_A)$ và $T$:**
  1. Thay vì truyền mật khẩu dạng rõ $PW_A$ trên mạng, $A$ băm mật khẩu thành $H(PW_A)$ với mong muốn lợi dụng **tính một chiều (One-way / Preimage Resistance)** của hàm băm $H$ để kẻ nghe lén không suy ngược ra được $PW_A$ gốc.
  2. Ghép thêm nhãn thời gian hiện thời $T$ ($H(PW_A) \parallel T$) với ý định tạo tính tươi mới (*Freshness*) cho bản tin số 3 nhằm chống tấn công phát lại (*Replay Attack*).

##### b) Phê bình Ưu – Nhược điểm và Lỗ hổng chí mạng của `PRT_AU`:
- **Ưu điểm nhỏ:** Không truyền trực tiếp chuỗi ký tự $PW_A$ dạng rõ trên đường truyền, nên nếu $PW_A$ đủ mạnh thì kẻ nghe lén không nhìn thấy ngay chuỗi ký tự mật khẩu gốc (tránh lộ mật khẩu nếu người dùng dùng chung mật khẩu đó ở hệ thống khác).
- **Nhược điểm & Lỗ hổng an toàn cực kỳ nghiêm trọng (Thiết kế thất bại hoàn toàn):**
  1. **Lỗ hổng 1 – Nhãn thời gian $T$ nằm NGOÀI hàm băm nên hoàn toàn vô tác dụng chống giả mạo / phát lại:**
     Ở bước 3, $A$ gửi $H(PW_A) \parallel T$ (tức là giá trị cố định $p_A = H(PW_A)$ nối chuỗi đơn thuần với $T$).
     - Kẻ tấn công thụ động **Eve** chỉ cần nghe lén trên đường truyền **đúng 1 lần** ở bước 3, tách phần đầu ra là thu được nguyên vẹn chuỗi hằng số $p_A = H(PW_A)$.
     - Vào bất kỳ thời điểm $T'$ nào trong tương lai, Eve chỉ cần lấy $H(PW_A)$ đã bắt được ghép với thời gian hiện tại $T'$ để gửi $H(PW_A) \parallel T'$ cho Server $S$! Server $S$ kiểm tra thấy $T'$ hợp lệ (mới) và $H(PW_A)$ đúng, nên **Eve mạo danh $A$ vĩnh viễn mà không cần biết $PW_A$ gốc**!
     - Tương tự, một kẻ tấn công đứng giữa có thể sửa trực tiếp $T \to T'$ mà không làm hỏng $H(PW_A)$ (vì $T$ không được bảo vệ tính toàn vẹn).
  2. **Lỗ hổng 2 – $H(PW_A)$ đóng vai trò tương đương mật khẩu rõ (Password-Equivalent):**
     Việc gửi $H(PW_A)$ không khác gì gửi một mật khẩu tĩnh cố định qua mạng ở mọi phiên đăng nhập. Ngoài ra, kẻ nghe lén bắt được $H(PW_A)$ có thể thực hiện **tấn công từ điển ngoại tuyến (Offline Dictionary Attack)** hoặc tra **Bảng cầu vồng (Rainbow Table)** để tìm ra $PW_A$ thực sự.
  3. **Lỗ hổng 3 – Lãng phí băng thông và lượt truyền (3 bước):**
     Bước 1 và Bước 2 ($A \to S: ID_A$ và $S \to A: \text{Password Request}$) không mang thông tin thách đố động nào từ $S$; $A$ hoàn toàn có thể gửi ngay trong 1 bước mà không cần chờ $S$ hỏi.
  4. **Lỗ hổng 4 – Không có xác thực chiều ngược lại (Server Authentication):** $A$ không biết có đúng mình đang nói chuyện với Server $S$ thật hay không.

---

#### 2. Trường hợp $X = 0$ (MSSV Chẵn): So sánh `PRT_AU` với `PROT_00` của An (6,0 / 10 pt)

```
Giao thức PROT_00 (của An):
(1) A -> S : ID_A
(2) S -> A : R
(3) A -> S : H(PW_A || R)
```

##### a) Phân tích nguyên lý cải tiến của `PROT_00`:
An đã sửa hai sai lầm cốt lõi của `PRT_AU` bằng cơ chế **Thách đố – Phản hồi dùng số ngẫu nhiên Nonce (Challenge–Response with Nonce)**:
- Thay vì bước 2 chỉ gửi thông báo vô nghĩa `"Password Request"`, Server $S$ sinh một **số ngẫu nhiên mới $R$ (Nonce)** cho mỗi phiên và gửi thách đố cho $A$.
- Ở bước 3, $A$ đưa $R$ **vào bên trong hàm băm** cùng với mật khẩu: $H(PW_A \parallel R)$.

##### b) Bảng so sánh chi tiết `PRT_AU` và `PROT_00` (Ưu – Nhược điểm):

| Tiêu chí | `PRT_AU` (Thầy Lâm) | `PROT_00` (Của An – $X=0$) | Đánh giá Ưu / Nhược điểm của `PROT_00` |
| :--- | :--- | :--- | :--- |
| **Cơ chế chống Replay Attack** | Ghép $T$ ở ngoài: $H(PW_A) \parallel T$ *(Thất bại hoàn toàn)*. | Băm kèm Nonce $R$: $H(PW_A \parallel R)$ *(Thành công)*. | **Ưu điểm lớn:** Chống hoàn toàn tấn công phát lại (*Replay Attack*). Ở mỗi phiên mới, $S$ sinh $R' \neq R$. Kẻ nghe lén dù bắt được $(R, H(PW_A \parallel R))$ của phiên cũ cũng không thể tính được $H(PW_A \parallel R')$ cho phiên mới vì không biết $PW_A$. |
| **Bảo vệ giá trị $H(PW_A)$ trên mạng** | Lộ trực tiếp $H(PW_A)$ trên đường truyền ở mọi phiên. | Không bao giờ gửi $H(PW_A)$ trần qua mạng. | **Ưu điểm:** Kẻ nghe lén không thu được hằng số $H(PW_A)$ để dùng lại ngay, và không dùng được bảng cầu vồng tính sẵn (*Rainbow Table*) vì mỗi lần băm có kèm $R$ ngẫu nhiên đóng vai trò như muối động. |
| **Yêu cầu đồng bộ đồng hồ** | Cần đồng bộ đồng hồ giữa $A$ và $S$ để kiểm tra $T$. | **Không cần đồng bộ đồng hồ** (vì dùng số ngẫu nhiên $R$ do chính $S$ vừa sinh ra). | **Ưu điểm:** Tránh được mọi rủi ro do lệch múi giờ, trôi đồng hồ (*Clock Skew*) giữa Client và Server. |
| **Số bước truyền tin** | $3$ bước. | $3$ bước. | Giữ nguyên 3 bước nhưng Bước 2 của `PROT_00` thực sự có ý nghĩa (truyền thách đố $R$). |
| **Nhược điểm còn tồn tại của `PROT_00`** | — | 1. **Trên Server $S$ phải lưu $PW_A$ dạng rõ:** Để tự tính $H(PW_A \parallel R)$ kiểm tra, $S$ phải biết $PW_A$ gốc (chứ không thể chỉ lưu $p_A = H(PW_A)$, trừ khi đổi công thức thành $H(p_A \parallel R)$). Nếu lộ DB của $S$ thì lộ toàn bộ $PW_A$.<br>2. **Vẫn bị tấn công từ điển ngoại tuyến (Offline Dictionary Attack):** Kẻ nghe lén biết cả $R$ (ở bước 2) và $H(PW_A \parallel R)$ (ở bước 3), nên có thể thử từng từ $w$ trong từ điển xem $H(w \parallel R)$ có khớp không.<br>3. **Chưa xác thực Server $S$ và chưa thiết lập khóa phiên $k_s$** để bảo mật dữ liệu sau đăng nhập. |

---

#### 3. Trường hợp $X = 1$ (MSSV Lẻ): So sánh `PRT_AU` với `PROT_01` của Chi (6,0 / 10 pt)

```
Giao thức PROT_01 (của Chi):
(1) A -> S : ID_A || H(PW_A || T) || T
```

##### a) Phân tích nguyên lý cải tiến của `PROT_01`:
Chi nhận ra rằng nếu đã dùng nhãn thời gian $T$ (*Timestamp*), thì:
1. $A$ không cần phải gửi $ID_A$ rồi ngồi đợi $S$ yêu cầu mật khẩu, mà có thể **gộp toàn bộ vào duy nhất 1 bước truyền tin**.
2. Quan trọng nhất: Chi đã đưa nhãn thời gian $T$ **vào bên trong hàm băm** $H(PW_A \parallel T)$ để gắn kết chặt chẽ mật khẩu với thời điểm $T$, đồng thời gửi kèm $T$ dạng rõ bên ngoài để $S$ biết $A$ đã dùng mốc thời gian nào.

##### b) Quy trình kiểm tra tại Server $S$ trong `PROT_01`:
Khi nhận được $ID_A \parallel H_{\text{recv}} \parallel T$ tại thời điểm đồng hồ của Server là $T_S$:
1. $S$ kiểm tra xem độ lệch thời gian $|T_S - T| \le \Delta t$ (nằm trong cửa sổ thời gian cho phép) hay không. Nếu quá hạn $\implies$ loại bỏ.
2. $S$ tự tính $H_{\text{calc}} = H(PW_A \parallel T)$ và so sánh với $H_{\text{recv}}$. Nếu khớp và chưa từng xuất hiện trong cửa sổ $\Delta t$ $\implies$ xác thực thành công.

##### c) Bảng so sánh chi tiết `PRT_AU` và `PROT_01` (Ưu – Nhược điểm):

| Tiêu chí | `PRT_AU` (Thầy Lâm) | `PROT_01` (Của Chi – $X=1$) | Đánh giá Ưu / Nhược điểm của `PROT_01` |
| :--- | :--- | :--- | :--- |
| **Hiệu năng truyền thông (Số bước)** | **$3$ bước** (tốn 1,5 RTT). | **Chỉ $1$ bước duy nhất!** (One-pass authentication). | **Ưu điểm vượt trội:** Giảm số bản tin từ 3 xuống 1, giảm độ trễ mạng tối đa, cực kỳ phù hợp cho xác thực gói tin đơn hoặc hệ thống tải cao. |
| **Bảo vệ tính toàn vẹn của $T$ & Chống giả mạo** | $T$ nằm ngoài hàm băm ($H(PW_A) \parallel T$) $\implies$ Kẻ tấn công thay $T \to T'$ tùy ý. | $T$ nằm cả **trong** và **ngoài** hàm băm: $H(PW_A \parallel T) \parallel T$. | **Ưu điểm lớn:** Nếu kẻ tấn công sửa $T$ bên ngoài thành $T'$, hắn không thể tính lại được $H(PW_A \parallel T')$ bên trong vì không biết $PW_A$. Đồng thời $H(PW_A)$ không bị lộ trên mạng. |
| **Nhược điểm còn tồn tại của `PROT_01`** | — | 1. **Phụ thuộc chặt chẽ vào đồng bộ đồng hồ (Clock Synchronization):** Đồng hồ của $A$ và $S$ phải đồng bộ chính xác. Nếu đồng hồ bị lệch hoặc kẻ tấn công làm sai lệch giao thức NTP, xác thực sẽ lỗi hoặc bị lợi dụng.<br>2. **Nguy cơ Replay trong cửa sổ $\Delta t$:** Trong khoảng dung sai $\Delta t$ (ví dụ vài giây), kẻ tấn công vẫn có thể phát lại nguyên bản tin $ID_A \parallel H(PW_A \parallel T) \parallel T$ nếu $S$ không lưu danh sách các bản tin đã nhận trong cửa sổ $\Delta t$.<br>3. **Server $S$ phải lưu $PW_A$ dạng rõ** và kẻ nghe lén biết $(T, H(PW_A \parallel T))$ vẫn có thể chạy **Offline Dictionary Attack**.<br>4. **Chưa có xác thực Server và chưa có trao đổi khóa phiên $k_s$.** |

*(Ghi chú thêm nếu so sánh chéo `PROT_00` của An và `PROT_01` của Chi: `PROT_01` lợi hơn về số bước truyền tin – 1 bước so với 3 bước – nhưng đòi hỏi đồng bộ đồng hồ; còn `PROT_00` tốn 3 bước nhưng dùng Nonce $R$ nên không cần đồng bộ đồng hồ và chống Replay tuyệt đối).*

---

### CÂU 2 (16 PT): PHÂN TÍCH SỰ KHÁC BIỆT VÀ TÍNH NĂNG MỚI CỦA `PROT_10` ($Y=0$) & `PROT_11` ($Y=1$)

#### 1. Điểm đột phá chung của cả nhóm `PROT_1Y` so với nhóm `PROT_0X` ở Câu 1 (6,0 / 16 pt)

Các giao thức ở Câu 1 (`PRT_AU`, `PROT_00`, `PROT_01`) mới chỉ dừng lại ở việc *"Chứng minh $A$ là ai tại thời điểm đăng nhập"*. Ngay sau bước đăng nhập đó, nếu $A$ và $S$ trao đổi dữ liệu trên mạng mà không có khóa mã hóa chung thì kẻ tấn công (Man-in-the-Middle / Session Hijacking) hoàn toàn có thể nghe lén hoặc cướp phiên làm việc!

Cả hai giao thức **`PROT_10` (của Bình)** và **`PROT_11` (của Dũng)** đã nâng cấp từ một *Giao thức xác thực thuần túy* thành **Giao thức Xác thực kết hợp Phân phối Khóa phiên (Authenticated Key Distribution Protocol)** với **4 tính năng mới quan trọng**:

1. **Tính năng mới 1 – Thiết lập và phân phối Khóa phiên động ($k_s$ – Session Key Distribution):**
   - Sau khi xác thực $A$ thành công ở bước 3, ở **Bước 4 ($S \to A: \{k_s\}_{p_A}$)**, Server $S$ sinh một khóa phiên ngẫu nhiên $k_s$ mới tinh và mã hóa nó bằng khóa dài hạn $p_A = H(PW_A)$ gửi về cho $A$.
   - Khi nhận được $\{k_s\}_{p_A}$, $A$ tự tính $p_A = H(PW_A)$ từ mật khẩu của mình và giải mã để thu được $k_s$. Từ đây, mọi dữ liệu trao đổi trong phiên làm việc giữa $A$ và $S$ được bảo mật và xác thực bằng khóa phiên $k_s$ (tránh việc lạm dụng mật khẩu dài hạn $p_A$ để mã hóa dữ liệu lớn).
2. **Tính năng mới 2 – Cung cấp Xác thực hai chiều ngầm định (Implicit Server Authentication):**
   - Ở Câu 1 (`PROT_00` và `PROT_01`), chỉ có $S$ xác thực $A$, còn $A$ không biết phía bên kia có thực sự là $S$ hay không.
   - Ở `PROT_1Y`, chỉ có Server $S$ hợp pháp (nơi lưu trữ $p_A = H(PW_A)$) mới có khả năng đóng gói khóa phiên $k_s$ đúng dưới khóa $p_A$ để khi $A$ giải mã và sử dụng $k_s$ ở các bản tin tiếp theo, hai bên hiểu được nhau.
3. **Tính năng mới 3 – Chuẩn hóa thông tin lưu trữ trên Server $S$ dưới dạng giá trị băm $p_A = H(PW_A)$ (Đặc biệt hoàn chỉnh ở `PROT_11`):**
   - Thay vì dùng trực tiếp chuỗi ký tự $PW_A$ có độ dài bất kỳ để mã hóa, cả Bình và Dũng đều định nghĩa khóa đối xứng dài hạn dẫn xuất từ mật khẩu là $p_A = H(PW_A)$ (có độ dài bit cố định chuẩn, ví dụ 128/256 bit, dùng làm khóa cho hệ mã khối đối xứng như AES).
4. **Tính năng mới 4 – Chuyển từ hàm băm một chiều sang Mật mã đối xứng hai chiều $\{ \cdot \}_{p_A}$:**
   - Hàm băm $H(\cdot)$ chỉ đi được 1 chiều (dùng để kiểm tra khớp), không thể giải mã ngược để truyền bí mật $k_s$. Việc sử dụng phép mã hóa đối xứng $\{k_s\}_{p_A}$ ở Bước 4 cho phép truyền thông tin bí mật từ $S$ về $A$.

---

#### 2. Trường hợp $Y = 0$: Phân tích chi tiết Giao thức `PROT_10` của Bình (5,0 / 16 pt)

```
Giao thức PROT_10 (của Bình - Y=0):
(1) A -> S : ID_A
(2) S -> A : R
(3) A -> S : H(PW_A || R)
(4) S -> A : {k_s}_{p_A}   (với p_A = H(PW_A))
```

##### a) Sự khác biệt của `PROT_10` so với `PRT_AU` và `PROT_0X`:
- **So với `PROT_00` của An:** `PROT_10` giữ nguyên 3 bước đầu của `PROT_00` (dùng Nonce $R$ và hàm băm $H(PW_A \parallel R)$ để xác thực $A$ với $S$), và **bổ sung thêm Bước 4: $S \to A: \{k_s\}_{p_A}$** để cấp khóa phiên $k_s$ cho $A$.
- **So với `PROT_01` của Chi:** `PROT_10` dùng cơ chế thách đố – phản hồi bằng số ngẫu nhiên $R$ (4 bước, không cần đồng bộ đồng hồ) thay vì dùng nhãn thời gian $T$ (1 bước), đồng thời có thêm bước phân phối khóa phiên $k_s$.

##### b) Phân tích Ưu điểm và Nhược điểm / Lỗ hổng của `PROT_10`:
- **Ưu điểm:**
  - Kế thừa khả năng chống Replay Attack ở bước xác thực $A \to S$ nhờ số ngẫu nhiên $R$.
  - Cung cấp khóa phiên $k_s$ cho phiên làm việc.
- **Nhược điểm và Lỗ hổng thiết kế rất đáng chú ý của `PROT_10`:**
  1. **Sự thiếu nhất quán trong lưu trữ mật khẩu tại Server $S$:**
     - Để kiểm tra Bước 3 ($H(PW_A \parallel R)$), Server $S$ phải biết **$PW_A$ dạng rõ**!
     - Trong khi ở Bước 4 ($\{k_s\}_{p_A}$), Server $S$ lại dùng **$p_A = H(PW_A)$**. Việc bước 3 băm $PW_A$ trực tiếp khiến $S$ không thể chỉ lưu mỗi $p_A = H(PW_A)$ mà vẫn phải lưu $PW_A$ gốc (nếu không sửa Bước 3 thành $H(p_A \parallel R)$).
  2. **Lỗ hổng Chí mạng ở Bước 4 – Bản tin $\{k_s\}_{p_A}$ KHÔNG gắn với số ngẫu nhiên $R$ (Vulnerable to Key Replay Attack):**
     - Nhìn vào Bước 4: $S \to A: \{k_s\}_{p_A}$. Bản mã này **không hề chứa $R$ hay Timestamp $T$**!
     - Giả sử ở một phiên làm việc cũ trong quá khứ, khóa phiên cũ $k_s^{\text{old}}$ bị lộ cho kẻ tấn công Eve (cùng với bản mã $\{k_s^{\text{old}}\}_{p_A}$ mà Eve đã ghi lại).
     - Ở phiên hiện tại, khi $A$ vừa thực hiện xong Bước 3, Eve chặn Bước 4 của $S$ và **phát lại (Replay) bản tin cũ $\{k_s^{\text{old}}\}_{p_A}$** cho $A$!
     - Vì $\{k_s^{\text{old}}\}_{p_A}$ không chứa $R$, $A$ giải mã bằng $p_A$ ra $k_s^{\text{old}}$ mà không hề biết đây là khóa phiên cũ đã bị lộ! Kết quả là $A$ dùng $k_s^{\text{old}}$ để mã hóa dữ liệu nhạy cảm và Eve đọc được toàn bộ!

---

#### 3. Trường hợp $Y = 1$: Phân tích chi tiết Giao thức `PROT_11` của Dũng (5,0 / 16 pt)

```
Giao thức PROT_11 (của Dũng - Y=1):
(1) A -> S : ID_A
(2) S -> A : R
(3) A -> S : {R + 1}_{p_A}
(4) S -> A : {k_s}_{p_A}   where p_A = H(PW_A)
```

##### a) Sự khác biệt của `PROT_11` so với `PRT_AU`, `PROT_0X` và `PROT_10`:
- **Thay thế hoàn toàn hàm băm ở Bước 3 bằng phép mã hóa đối xứng $\{R + 1\}_{p_A}$:**
  - Ở `PROT_00` và `PROT_10`, Bước 3 dùng hàm băm $H(PW_A \parallel R)$.
  - Ở `PROT_11`, Dũng dùng chính khóa đối xứng dẫn xuất từ mật khẩu $p_A = H(PW_A)$ để mã hóa giá trị biến đổi của thách đố là $\{R + 1\}_{p_A}$ (tương tự triết lý của Needham–Schroeder / Kerberos).

##### b) Phân tích Ưu điểm và Nhược điểm / Lỗ hổng của `PROT_11`:
- **Ưu điểm vượt trội so với `PROT_10` và `PROT_0X`:**
  1. **Server $S$ KHÔNG CẦN lưu mật khẩu rõ $PW_A$ nữa:** Trong cả Bước 3 ($\{R + 1\}_{p_A}$) và Bước 4 ($\{k_s\}_{p_A}$), Server $S$ chỉ sử dụng duy nhất khóa $p_A = H(PW_A)$. Do đó Database của $S$ chỉ cần lưu $p_A = H(PW_A)$ chứ không cần lưu $PW_A$ dạng rõ!
  2. **Đồng nhất cơ chế mật mã:** Cả Bước 3 và Bước 4 đều sử dụng cùng một bộ mã hóa khối đối xứng (ví dụ AES với khóa $p_A$), giúp cài đặt phần cứng/phần mềm gọn nhẹ hơn.
  3. **Chứng minh sự hiểu biết thách đố $R$:** Việc tính $R + 1$ rồi mã hóa dưới $p_A$ chứng tỏ $A$ thực sự sở hữu $p_A$ và đang phản hồi đúng thách đố $R$ hiện thời của $S$.
- **Nhược điểm và Lỗ hổng còn tồn tại của `PROT_11`:**
  1. **Lỗ hổng phát lại khóa phiên ở Bước 4 (Giống `PROT_10`):** Bản tin Bước 4 $\{k_s\}_{p_A}$ vẫn đứng độc lập, không được gắn kết mật mã với thách đố $R$ (lẽ ra phải là $\{k_s \parallel R\}_{p_A}$), nên nếu một khóa phiên cũ $k_s^{\text{old}}$ bị lộ, kẻ tấn công vẫn có thể phát lại $\{k_s^{\text{old}}\}_{p_A}$ ở Bước 4 để ép $A$ dùng lại khóa cũ.
  2. **Nguy cơ Tấn công bản rõ đã biết (Known-Plaintext / Offline Dictionary Attack):** Vì $R$ được truyền dạng rõ ở Bước 2, kẻ nghe lén biết cả bản rõ $P = R + 1$ lẫn bản mã $C = \{R + 1\}_{p_A}$ ở Bước 3, từ đó có thể vét cạn từ điển mật khẩu $PW'$ để tìm $p_A' = H(PW')$ thỏa mãn $E_{p_A'}(R + 1) = C$.
  3. **Rủi ro tính khả uốn (Malleability) nếu dùng mã dòng:** Nếu phép mã hóa $\{ \cdot \}_{p_A}$ sử dụng chế độ mã dòng (như CTR/OFB có cùng IV) hoặc chế độ ECB, việc biết $R$ có thể bị lợi dụng để thao túng $\{R + 1\}_{p_A}$.

---

### CÂU 3 (14 PT): PHÂN TÍCH GIAO THỨC 5 BƯỚC QUA TRUNG TÂM $S$ VÀ LỜI GIẢI CỦA SINH VIÊN ĐẠT

#### 1. Nguyên văn Giao thức 5 bước của thầy Lâm

```
(1) A -> S : ID_A || ID_B || r_1
(2) S -> A : { ID_A || ID_B || r_1 || k_s || {ID_A || k_s || r_1}_{p_B} }_{p_A}
(3) A -> B : { ID_A || k_s || r_1 }_{p_B}
(4) B -> A : { r_2 }_{k_s}
(5) A -> B : { r_1 + r_2 }_{k_s}
```

---

#### 2. Phân tích Mục đích của Giao thức và Ý nghĩa từng bước (5,0 / 14 pt)

##### a) Mục đích tổng thể của giao thức:
Đây là **Giao thức phân phối khóa phiên và xác thực lẫn nhau giữa hai người dùng $A$ và $B$ thông qua Trung tâm phân phối khóa tin cậy $S$ (Key Distribution Center – KDC)**, được cải tiến dựa trên giao thức kinh điển **Needham–Schroeder Symmetric Key Protocol**:
- $A$ và $B$ không có khóa chung trực tiếp từ trước, nhưng $A$ chia sẻ khóa dài hạn $p_A = H(PW_A)$ với Server $S$, và $B$ chia sẻ khóa dài hạn $p_B = H(PW_B)$ với Server $S$.
- Mục tiêu của giao thức là:
  1. Giúp $S$ sinh và phân phối an toàn một **khóa phiên đối xứng tạm thời $k_s$** cho cả $A$ và $B$.
  2. Đảm bảo **Xác thực thực thể hai chiều (Mutual Authentication)** và **Xác nhận khóa tươi mới (Key Freshness & Key Confirmation)** giữa $A$ và $B$ trước khi truyền dữ liệu.

##### b) Giải thích vai trò của từng bước trong 5 bước:
- **Bước 1 ($A \to S: ID_A \parallel ID_B \parallel r_1$):**
  $A$ gửi yêu cầu tới KDC $S$ xin cấp khóa phiên để nói chuyện với $B$, kèm theo số ngẫu nhiên (Nonce) $r_1$ do $A$ sinh ra.
- **Bước 2 ($S \to A: \{ID_A \parallel ID_B \parallel r_1 \parallel k_s \parallel \{ID_A \parallel k_s \parallel r_1\}_{p_B}\}_{p_A}$):**
  Server $S$ sinh khóa phiên $k_s$, đóng gói một "Vé" (*Ticket*) $\{ID_A \parallel k_s \parallel r_1\}_{p_B}$ dành riêng cho $B$ (mã hóa bằng $p_B$), rồi ghép cùng $ID_A, ID_B, r_1, k_s$ và mã hóa toàn bộ bằng $p_A$ gửi về cho $A$.
  - Khi $A$ giải mã bằng $p_A$:
    - $A$ kiểm tra thấy đúng số ngẫu nhiên $r_1$ mình vừa gửi ở Bước 1 $\implies$ $A$ chắc chắn bản tin Bước 2 là **tươi mới (Fresh)** do $S$ vừa tạo ra chứ không phải bản tin cũ bị phát lại!
    - $A$ kiểm tra đúng $ID_B$ $\implies$ chống tấn công đánh tráo định danh ở Bước 1.
    - $A$ thu được khóa phiên $k_s$ và trích xuất chiếc vé $\{ID_A \parallel k_s \parallel r_1\}_{p_B}$.
- **Bước 3 ($A \to B: \{ID_A \parallel k_s \parallel r_1\}_{p_B}$):**
  $A$ chuyển tiếp chiếc vé cho $B$. $B$ dùng khóa $p_B$ của mình để giải mã, biết được rằng người muốn giao tiếp với mình là $ID_A$, thu được khóa phiên $k_s$ và giá trị $r_1$.
- **Bước 4 ($B \to A: \{r_2\}_{k_s}$) và Bước 5 ($A \to B: \{r_1 + r_2\}_{k_s}$):**
  Đây là pha bắt tay thách đố – phản hồi trực tiếp giữa $A$ và $B$ bằng khóa phiên $k_s$:
  - Ở Bước 4, $B$ sinh số ngẫu nhiên mới $r_2$, mã hóa dưới $k_s$ gửi cho $A$ để thách đố $A$ chứng minh rằng $A$ đang thực sự nắm giữ $k_s$ tại thời điểm hiện tại.
  - Ở Bước 5, $A$ giải mã lấy $r_2$, cộng với $r_1$ thành $r_1 + r_2$ rồi mã hóa lại bằng $k_s$ gửi cho $B$ để chứng minh $A$ biết $k_s$ và biết cả $r_1, r_2$.

---

#### 3. Phân tích Vấn đề tồn tại (Lỗ hổng) mà sinh viên Đạt đã phát hiện và Giải pháp sửa đổi ĐÚNG 1 BƯỚC ở Bước 5 (9,0 / 14 pt)

> **Lưu ý quan trọng khi trình bày bài thi:**  
> Câu hỏi của thầy Nguyễn Khanh Văn nêu gợi ý cực kỳ đắt giá: *"Sinh viên Đạt đã trả lời tốt câu hỏi của thầy, phân tích đúng vấn đề tồn tại và tìm ra giải pháp khắc phục thành công, trong đó **chỉ cần thực hiện 1 sửa đổi ở bước 5 mà thôi**."*  
> Để đạt tuyệt đối **14/14 điểm**, chúng ta sẽ phân tích đầy đủ **3 góc độ lỗ hổng kỹ thuật trực tiếp xoay quanh $r_1$, $r_2$ và Bước 5** (từ lỗ hổng lộ $r_1$ ở Bước 1, lỗ hổng tấn công phản xạ/khả uốn trên $\{r_1 + r_2\}_{k_s}$, đến lỗ hổng Denning–Sacco / Replay Ticket ở Bước 3–4–5) và chỉ ra cách sửa Bước 5 giải quyết triệt để vấn đề!

---

##### GÓC ĐỘ 1 (Trực diện nhất vào cấu trúc Bước 5 $\{r_1 + r_2\}_{k_s}$ và Bước 1): Lỗ hổng do $r_1$ đã bị truyền DẠNG RÕ ở Bước 1 kết hợp tính tuyến tính / khả uốn của phép cộng $r_1 + r_2$!

Hãy quan sát kỹ sự xuất hiện của $r_1$ trong giao thức của thầy Lâm:
1. **Tại sao thầy Lâm lại đưa $r_1$ vào trong Ticket của $B$ ở Bước 3 ($\{ID_A \parallel k_s \parallel r_1\}_{p_B}$) và bắt $A$ gửi $\{r_1 + r_2\}_{k_s}$ ở Bước 5?**
   - Trong giao thức Needham–Schroeder gốc, Bước 5 chỉ là $A \to B: \{r_2 - 1\}_{k_s}$.
   - Thầy Lâm đã sửa thành $\{r_1 + r_2\}_{k_s}$ với ý đồ rằng: *"Bắt $A$ phải kết hợp cả $r_1$ (trong Ticket) và $r_2$ (thách đố của $B$) để chứng minh cho $B$ thấy người trả lời ở Bước 5 chính là người sở hữu $r_1$!"*
2. **Thế nhưng lỗ hổng chí mạng mà Đạt phát hiện ra là gì?**
   - **Thứ nhất: $r_1$ KHÔNG HỀ BÍ MẬT! Ở ngay Bước 1 ($A \to S: ID_A \parallel ID_B \parallel r_1$), số $r_1$ đã được truyền công khai ở DẠNG RÕ (Plaintext) trên mạng!**
     Mọi kẻ tấn công nghe lén trên đường truyền đều biết chính xác giá trị của $r_1$ ngay từ Bước 1! Do đó, việc dùng $r_1$ như một "bí mật chia sẻ thêm" giữa $A$ và $B$ ở Bước 5 là hoàn toàn ảo tưởng vì kẻ tấn công $E$ đã biết sẵn $r_1$!
   - **Thứ hai: Lỗ hổng thao túng bản mã / Tấn công phản xạ và tính khả uốn (Malleability / Homomorphic Property) giữa Bước 4 và Bước 5:**
     - Ở Bước 4, $B$ gửi cho $A$: $C_4 = \{r_2\}_{k_s}$.
     - Ở Bước 5, $B$ lại chờ nhận từ $A$: $C_5 = \{r_1 + r_2\}_{k_s}$.
     - Nếu phép mã hóa đối xứng $\{\cdot\}_{k_s}$ sử dụng chế độ mã dòng (như CTR, OFB hoặc bộ cộng dòng khóa $E_{k_s}(M) = M \oplus K_{\text{stream}}$ hoặc phép cộng mô-đun) hay chế độ ECB khi $r_1, r_2$ nằm cùng khối: Kẻ tấn công $E$ **không cần biết khóa phiên $k_s$**, chỉ cần bắt lấy bản mã $C_4 = \{r_2\}_{k_s}$ mà $B$ vừa gửi ở Bước 4, rồi cộng/XOR trực tiếp giá trị $r_1$ (mà $E$ đã nghe lén được ở dạng rõ từ Bước 1!) vào $C_4$ để tạo ra $\{r_1 + r_2\}_{k_s}$ gửi trả lại cho $B$ ở Bước 5!
     - Ngay cả với mã khối chuẩn, nếu kẻ tấn công $E$ mở song song một phiên hoặc lợi dụng $B$ làm Oracle giải mã/mã hóa, việc Bước 5 chỉ là một phép biến đổi số học đơn giản $r_1 + r_2$ trên cùng khóa $k_s$ và không có định danh chiều truyền sẽ tạo điều kiện cho **Tấn công phản xạ (Reflection Attack)**: Khi $B$ gửi $\{r_2\}_{k_s}$, kẻ tấn công $E$ mở một phiên thứ hai gửi ngược thách đố $r_2' = r_1 + r_2$ hoặc lừa chính $A/B$ tính hộ!

---

##### GÓC ĐỘ 2 (Lỗ hổng giao thức tổng quát): Vấn đề Không đối xứng vai trò / Thiếu xác thực định danh & Tính toàn vẹn trong Bước 5

Ngoài việc $r_1$ bị lộ dạng rõ ở Bước 1, nếu xét toàn bộ mục tiêu của Bước 5:
1. **Lỗ hổng thiếu tính toàn vẹn mật mã (Cryptographic Binding) ở Bước 5:**
   Phép cộng số học $r_1 + r_2$ có **tính giao hoán ($r_1 + r_2 = r_2 + r_1$)** và dễ bị triệt tiêu toán học (kẻ tấn công có thể chọn $r_2' = r_2 - \Delta$ và bù $\Delta$ vào $r_1$). Hơn nữa, $\{r_1 + r_2\}_{k_s}$ là phép mã hóa thuần túy (Encryption only), **không phải là hàm băm một chiều hay MAC**, nên không đảm bảo tính toàn vẹn nếu bản mã bị sửa đổi (Malleability).
2. **Lỗ hổng Denning–Sacco (Replay Ticket cũ khi $k_s$ cũ bị lộ):**
   Ở Bước 3, chiếc vé $\{ID_A \parallel k_s \parallel r_1\}_{p_B}$ chỉ chứa $r_1$ (là số ngẫu nhiên của $A$, không phải của $B$, và cũng không phải Timestamp $T$). Vì $B$ không biết $r_1$ được sinh ra từ bao giờ, nếu một khóa phiên cũ $k_s$ bị lộ, kẻ tấn công $E$ vẫn có thể phát lại Ticket cũ ở Bước 3, giải mã $\{r_2\}_{k_s}$ ở Bước 4 và tự tính $\{r_1 + r_2\}_{k_s}$ ở Bước 5 (vì $E$ đã biết cả $k_s$ cũ lẫn $r_1$ ở Bước 1!).

---

#### 4. Giải pháp khắc phục của Đạt: Chỉ thực hiện ĐÚNG 1 SỬA ĐỔI ở Bước 5!

Đề bài nhấn mạnh: *"Sinh viên Đạt đã tìm ra giải pháp khắc phục thành công, trong đó **chỉ cần thực hiện 1 sửa đổi ở bước 5 mà thôi**."*

Tùy theo ý tưởng nhấn mạnh của Đạt trong giờ học của thầy Lâm, có **3 phương án sửa Bước 5** cực kỳ sắc bén (trong bài thi, sinh viên nên trình bày cả 3 phương án dưới đây để bao trọn 100% đáp án của thầy):

##### Phương án sửa 1 (Dùng Hàm băm mật mã / MAC kèm khóa và định danh tại Bước 5 – Chặt chẽ nhất về mật mã):
Thay vì mã hóa tổng số học $\{r_1 + r_2\}_{k_s}$ (dễ bị tấn công khả uốn/tuyến tính vì $r_1$ đã lộ ở Bước 1), Đạt sửa Bước 5 thành **Hàm băm một chiều (hoặc HMAC) kết hợp ghép chuỗi phi tuyến**:
$$\boxed{\text{Bước 5 (Sửa theo Phương án 1):} \quad A \longrightarrow B: \quad H(k_s \parallel r_1 \parallel r_2 \parallel ID_A \parallel ID_B) \quad \text{hoặc} \quad \big\{H(r_1 \parallel r_2 \parallel ID_A)\big\}_{k_s}}$$
- **Ý tưởng giải quyết của Đạt:**
  - Thay phép cộng đại số $r_1 + r_2$ (có tính tuyến tính, giao hoán và khả uốn) bằng phép ghép chuỗi có thứ tự đưa qua **hàm băm một chiều $H(r_1 \parallel r_2)$**.
  - Dù kẻ tấn công biết $r_1$ ở Bước 1 và bắt được $\{r_2\}_{k_s}$ ở Bước 4, do tính một chiều và kháng va chạm của hàm băm $H$, kẻ tấn công tuyệt đối không thể biến đổi bản mã $\{r_2\}_{k_s}$ thành $\{H(r_1 \parallel r_2)\}_{k_s}$ nếu không giải mã được $r_2$ bằng khóa phiên $k_s$!
  - Việc thứ tự $r_1 \parallel r_2$ cố định (không giao hoán như $r_1 + r_2$) và gắn kèm $ID_A$ còn chặn đứng hoàn toàn tấn công phản xạ (*Reflection Attack*).

##### Phương án sửa 2 (Đưa mật khẩu dài hạn $p_A = H(PW_A)$ hoặc bí mật của $A$ vào Bước 5 để chống lộ khóa phiên cũ $k_s$ / xác thực trực tiếp nguồn gốc $A$):
Nếu vấn đề thầy Lâm đặt ra là: *"Giả sử khóa phiên $k_s$ bị lộ hoặc kẻ tấn công biết $r_1$ từ Bước 1, làm sao để ở Bước 5 chỉ mình $A$ thật mới tạo được bản tin hợp lệ?"* hoặc *"Làm sao để gắn kết phiên mà không phụ thuộc vào $r_1$ đã lộ ở Bước 1?"*:
- Nếu bỏ $r_1$ (vì $r_1$ đã lộ ở Bước 1) và chuẩn hóa lại như Needham–Schroeder kết hợp định danh:
  $$\boxed{\text{Bước 5 (Sửa theo Phương án 2a):} \quad A \longrightarrow B: \quad \{ID_A \parallel (r_2 - 1)\}_{k_s} \quad \text{hoặc} \quad \{r_1 \parallel r_2\}_{k_s}}$$
  *(Giải thích: Thay phép cộng $r_1 + r_2$ bằng phép ghép khối $\{r_1 \parallel r_2\}_{k_s}$ hoặc $\{ID_A \parallel r_2 - 1\}_{k_s}$ giúp $B$ kiểm tra chính xác từng thành phần $r_1$ và $r_2$ độc lập, tránh việc kẻ tấn công lợi dụng phép cộng bit/số học trên bản mã).*
- Nếu gắn thêm nhãn thời gian hiện thời $T_A$ của $A$ vào Bước 5 để giúp $B$ kiểm tra độ tươi mới của cả chiếc vé Bước 3 (chống Denning–Sacco Replay Attack):
  $$\boxed{\text{Bước 5 (Sửa theo Phương án 2b):} \quad A \longrightarrow B: \quad \{r_1 \parallel r_2 \parallel T_A\}_{k_s}}$$
  *(Giải thích: Ở Bước 3, chiếc vé $\{ID_A \parallel k_s \parallel r_1\}_{p_B}$ chưa có Timestamp nên $B$ không biết vé mới hay cũ. Khi $A$ gửi kèm Timestamp $T_A$ hoặc Nonce mới vào Bước 5 dưới khóa $k_s$, $B$ vừa kiểm tra được $r_2$, vừa đối chiếu được $r_1$ khớp với vé ở Bước 3, vừa kiểm tra được thời điểm hiện tại $T_A$!).*

---

#### 5. Bảng Tóm tắt Tra cứu Nhanh theo MSSV cho Bài thi Tự luận 2022.1

Để sinh viên tiện đối chiếu ngay với MSSV của mình, dưới đây là bảng tóm tắt 4 tổ hợp $(X, Y)$:

| Hai chữ số cuối MSSV | Giá trị $(X, Y)$ | Câu 1 (So sánh với `PRT_AU`) | Câu 2 (Phân tích tính năng mới) | Câu 3 (Giao thức 5 bước) |
| :---: | :---: | :--- | :--- | :--- |
| **Chẵn – Chẵn**<br>*(VD: `...00`, `...24`, `...48`)* | $X = 0, \; Y = 0$ | So sánh `PRT_AU` với **`PROT_00` (của An)**: Nonce $R$ trong hàm băm $H(PW_A \parallel R)$, 3 bước, không cần đồng bộ đồng hồ. | Phân tích **`PROT_10` (của Bình)**: Thêm Bước 4 $\{k_s\}_{p_A}$ phân phối khóa phiên $k_s$ trên nền `PROT_00`. | Chung cho mọi MSSV: Phân tích 5 bước và sửa Bước 5 của Đạt. |
| **Lẻ – Chẵn**<br>*(VD: `...01`, `...23`, `...45`)* | $X = 1, \; Y = 0$ | So sánh `PRT_AU` với **`PROT_01` (của Chi)**: Timestamp $T$ trong hàm băm $H(PW_A \parallel T) \parallel T$, tối ưu chỉ 1 bước. | Phân tích **`PROT_10` (của Bình)**: Chuyển từ Timestamp 1 bước sang Nonce $R$ 4 bước + cấp khóa phiên $\{k_s\}_{p_A}$. | Chung cho mọi MSSV: Phân tích 5 bước và sửa Bước 5 của Đạt. |
| **Chẵn – Lẻ**<br>*(VD: `...10`, `...32`, `...56`)* | $X = 0, \; Y = 1$ | So sánh `PRT_AU` với **`PROT_00` (của An)**: Nonce $R$ trong hàm băm $H(PW_A \parallel R)$, 3 bước. | Phân tích **`PROT_11` (của Dũng)**: Dùng mã hóa đối xứng $\{R+1\}_{p_A}$ ở Bước 3 và $\{k_s\}_{p_A}$ ở Bước 4; $S$ chỉ cần lưu $p_A = H(PW_A)$. | Chung cho mọi MSSV: Phân tích 5 bước và sửa Bước 5 của Đạt. |
| **Lẻ – Lẻ**<br>*(VD: `...11`, `...35`, `...79`)* | $X = 1, \; Y = 1$ | So sánh `PRT_AU` với **`PROT_01` (của Chi)**: Timestamp $T$ trong hàm băm, chỉ 1 bước truyền tin. | Phân tích **`PROT_11` (của Dũng)**: Dùng Nonce $R$ + mã hóa đối xứng $\{R+1\}_{p_A}$ và cấp khóa phiên $\{k_s\}_{p_A}$. | Chung cho mọi MSSV: Phân tích 5 bước và sửa Bước 5 của Đạt. |
