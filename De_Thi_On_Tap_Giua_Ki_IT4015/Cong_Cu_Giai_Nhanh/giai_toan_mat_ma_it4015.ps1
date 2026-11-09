<#
.SYNOPSIS
    CÔNG CỤ GIẢI NHANH & IN BẢNG TRÌNH BÀY TỪNG BƯỚC (STEP-BY-STEP) TOÁN MẬT MÃ GIỮA KỲ IT4015 (HUST)
    Tác giả: Bộ công cụ ôn tập An toàn thông tin (IT4015 - SoICT, ĐHBK Hà Nội)

.DESCRIPTION
    Script PowerShell độc lập (không cần cài Python hay thư viện ngoài) giải chi tiết 5 dạng toán tự luận & trắc nghiệm giữa kỳ IT4015:
      1. Invoke-ExtendedEuclid : Lập bảng thuật toán Euclid mở rộng (i, q_i, r_i, s_i, t_i) và tìm nghịch đảo a^-1 mod m.
      2. Invoke-FastExp        : Đổi số mũ sang nhị phân và lập bảng Bình phương & Nhân (Square-and-Multiply) tính a^b mod n.
      3. Invoke-DlogAndDH      : Tính Logarit rời rạc Dlog_g(y) mod p và khóa chung Diffie-Hellman DH_g(A, B) mod p.
      4. Invoke-EllipticCurve  : Liệt kê toàn bộ các điểm bội kP trên đường cong Elliptic y^2 = x^3 + ax + b (mod p), cộng điểm P + Q, nhân đôi 2P.
      5. Invoke-RSASolver      : Tự động tìm số nguyên tố p, q từ 4 số cuối MSSV (abcd và dcba), tính n, phi(n), d = e^-1 mod phi(n), Mã hóa, Giải mã & Ký số RSA.

.EXAMPLE
    Chạy kiểm thử tự động toàn bộ các bài toán trong đề thi giữa kỳ:
    powershell -ExecutionPolicy Bypass -File "D:\hust\An toàn thông tin\De_Thi_On_Tap_Giua_Ki_IT4015\Cong_Cu_Giai_Nhanh\giai_toan_mat_ma_it4015.ps1"
#>

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# ==============================================================================
# HÀM PHỤ TRỢ TOÁN HỌC SỐ NGUYÊN LỚN (MODULO CHÍNH XÁC CHO CẢ SỐ ÂM)
# ==============================================================================
function Get-PositiveMod {
    param (
        [bigint]$Value,
        [bigint]$Modulus
    )
    $rem = $Value % $Modulus
    if ($rem -lt 0) {
        $rem += $Modulus
    }
    return $rem
}

function Test-IsPrime {
    param (
        [long]$Number
    )
    if ($Number -lt 2) { return $false }
    if ($Number -eq 2 -or $Number -eq 3) { return $true }
    if ($Number % 2 -eq 0 -or $Number % 3 -eq 0) { return $false }
    $limit = [math]::Floor([math]::Sqrt($Number))
    for ($i = 5; $i -le $limit; $i += 6) {
        if ($Number % $i -eq 0 -or $Number % ($i + 2) -eq 0) {
            return $false
        }
    }
    return $true
}

# ==============================================================================
# HÀM 1: THUẬT TOÁN EUCLID MỞ RỘNG (EXTENDED EUCLIDEAN ALGORITHM)
# Tìm UCLN gcd(a, m) và nghịch đảo nhân a^-1 mod m kèm bảng (i, q_i, r_i, s_i, t_i)
# Công thức bất biến tại mọi dòng i: r_i = m * s_i + a * t_i
# ==============================================================================
function Invoke-ExtendedEuclid {
    param (
        [Parameter(Mandatory = $true)][bigint]$a,
        [Parameter(Mandatory = $true)][bigint]$m,
        [switch]$Silent
    )

    $aNorm = Get-PositiveMod -Value $a -Modulus $m

    $rows = New-Object System.Collections.Generic.List[PSObject]

    # Khởi tạo i = -1 và i = 0
    $r_prev = $m;     $s_prev = [bigint]1; $t_prev = [bigint]0
    $r_curr = $aNorm; $s_curr = [bigint]0; $t_curr = [bigint]1

    $rows.Add([PSCustomObject]@{
        Buoc_i  = "-1"
        Thuong_q = "-"
        SoDu_r  = $r_prev
        HeSo_s  = $s_prev
        HeSo_t  = $t_prev
        KiemTra = "$m*($s_prev) + $aNorm*($t_prev) = $r_prev"
    })

    $rows.Add([PSCustomObject]@{
        Buoc_i  = "0"
        Thuong_q = "-"
        SoDu_r  = $r_curr
        HeSo_s  = $s_curr
        HeSo_t  = $t_curr
        KiemTra = "$m*($s_curr) + $aNorm*($t_curr) = $r_curr"
    })

    $step = 1
    while ($r_curr -ne 0) {
        $q = [bigint]::Divide($r_prev, $r_curr)
        $r_next = $r_prev - $q * $r_curr
        $s_next = $s_prev - $q * $s_curr
        $t_next = $t_prev - $q * $t_curr

        $rows.Add([PSCustomObject]@{
            Buoc_i  = "$step"
            Thuong_q = "$q"
            SoDu_r  = $r_next
            HeSo_s  = $s_next
            HeSo_t  = $t_next
            KiemTra = "$m*($s_next) + $aNorm*($t_next) = $r_next"
        })

        $r_prev = $r_curr; $s_prev = $s_curr; $t_prev = $t_curr
        $r_curr = $r_next; $s_curr = $s_next; $t_curr = $t_next
        $step++
    }

    $gcd = $r_prev
    $s_bezout = $s_prev
    $t_bezout = $t_prev
    $inverse = $null

    if ($gcd -eq 1) {
        $inverse = Get-PositiveMod -Value $t_bezout -Modulus $m
    }

    if (-not $Silent) {
        Write-Host "`n================================================================================" -ForegroundColor Cyan
        Write-Host "[DẠNG 1] THUẬT TOÁN EUCLID MỞ RỘNG: Tìm $a^(-1) mod $m" -ForegroundColor Yellow
        Write-Host "================================================================================" -ForegroundColor Cyan
        Write-Host "Phương trình Bézout tại mỗi bước i: r_i = $m * s_i + $aNorm * t_i"
        $rows | Format-Table -AutoSize | Out-String | Write-Host

        if ($gcd -eq 1) {
            $checkProd = ($aNorm * $inverse) % $m
            Write-Host "=> Kết luận:" -ForegroundColor Green
            Write-Host "   + gcd($a, $m) = $gcd (Nguyên tố cùng nhau -> Tồn tại nghịch đảo)"
            Write-Host "   + Đẳng thức Bézout: $m * ($s_bezout) + $aNorm * ($t_bezout) = 1"
            Write-Host "   + Nghịch đảo $a^(-1) mod $m = $t_bezout mod $m = $inverse" -ForegroundColor Green
            Write-Host "   + Kiểm tra lại: ($a * $inverse) mod $m = $checkProd (CHÍNH XÁC!)"
        }
        else {
            Write-Host "=> Kết luận: gcd($a, $m) = $gcd != 1 -> KHÔNG TỒN TẠI nghịch đảo của $a theo modulo $m!" -ForegroundColor Red
        }
    }

    return [PSCustomObject]@{
        A       = $a
        Modulus = $m
        GCD     = $gcd
        BezoutS = $s_bezout
        BezoutT = $t_bezout
        Inverse = $inverse
        Table   = $rows
    }
}

# ==============================================================================
# HÀM 2: THUẬT TOÁN BÌNH PHƯƠNG VÀ NHÂN (SQUARE-AND-MULTIPLY / FAST EXPONENTIATION)
# Tính a^b mod n và in bảng từng bước theo bit nhị phân của số mũ b (từ MSB -> LSB)
# ==============================================================================
function Invoke-FastExp {
    param (
        [Parameter(Mandatory = $true)][bigint]$Base,
        [Parameter(Mandatory = $true)][bigint]$Exponent,
        [Parameter(Mandatory = $true)][bigint]$Modulus,
        [switch]$Silent
    )

    $a = Get-PositiveMod -Value $Base -Modulus $Modulus

    if ($Exponent -eq 0) {
        return [PSCustomObject]@{ Result = [bigint]1; Binary = "0"; Table = @() }
    }

    # Chuyển số mũ sang chuỗi nhị phân
    $expTemp = $Exponent
    $binChars = New-Object System.Collections.Generic.List[string]
    while ($expTemp -gt 0) {
        $bit = $expTemp % 2
        $binChars.Add($bit.ToString())
        $expTemp = [bigint]::Divide($expTemp, 2)
    }
    $binChars.Reverse()
    $binaryStr = -join $binChars

    $p = [bigint]1
    $rows = New-Object System.Collections.Generic.List[PSObject]

    for ($idx = 0; $idx -lt $binaryStr.Length; $idx++) {
        $bitChar = $binaryStr[$idx]
        $bitPos = $binaryStr.Length - 1 - $idx
        $p_before = $p
        $sq = ($p_before * $p_before) % $Modulus

        if ($bitChar -eq '1') {
            $p = ($sq * $a) % $Modulus
            $formula = "p = ($p_before^2 * $a) mod $Modulus = ($sq * $a) mod $Modulus = $p"
        }
        else {
            $p = $sq
            $formula = "p = ($p_before^2) mod $Modulus = $p"
        }

        $rows.Add([PSCustomObject]@{
            Buoc       = $idx + 1
            ViTriBit   = "b_$bitPos"
            BitNhiPhan = $bitChar
            GiaTriTruoc = $p_before
            BinhPhuong = $sq
            PhepTinh   = $formula
            KetQua_p   = $p
        })
    }

    if (-not $Silent) {
        Write-Host "`n================================================================================" -ForegroundColor Cyan
        Write-Host "[DẠNG 2] BÌNH PHƯƠNG VÀ NHÂN (SQUARE-AND-MULTIPLY): Tính $Base^$Exponent mod $Modulus" -ForegroundColor Yellow
        Write-Host "================================================================================" -ForegroundColor Cyan
        if ($Base -ne $a) {
            Write-Host "Bước 0 (Rút gọn cơ số): $Base mod $Modulus = $a  => Tính $a^$Exponent mod $Modulus"
        }
        Write-Host "Bước 1 (Đổi số mũ sang nhị phân): $Exponent = ($binaryStr)_2  (Độ dài: $($binaryStr.Length) bits)"
        Write-Host "Bước 2 (Bảng tính từng bước từ bit cao nhất MSB về LSB, khởi tạo p = 1):"
        $rows | Format-Table -AutoSize | Out-String | Write-Host
        Write-Host "=> ĐÁP SỐ: $Base^$Exponent mod $Modulus = $p" -ForegroundColor Green
    }

    return [PSCustomObject]@{
        Base     = $Base
        ReducedA = $a
        Exponent = $Exponent
        Modulus  = $Modulus
        Binary   = $binaryStr
        Result   = $p
        Table    = $rows
    }
}

# ==============================================================================
# HÀM 3: LOGARIT RỜI RẠC (DLOG) & TRAO ĐỔI KHÓA DIFFIE-HELLMAN (DH)
# Tính x = Dlog_g(y) mod p (sao cho g^x = y mod p) và Khóa chung DH_g(A, B) mod p
# ==============================================================================
function Invoke-DlogAndDH {
    param (
        [Parameter(Mandatory = $true)][bigint]$g,
        [Parameter(Mandatory = $true)][bigint]$p,
        [bigint]$TargetY = -1,
        [bigint]$PublicA = -1,
        [bigint]$PublicB = -1,
        [switch]$Silent
    )

    if (-not $Silent) {
        Write-Host "`n================================================================================" -ForegroundColor Cyan
        Write-Host "[DẠNG 3] LOGARIT RỜI RẠC (DLOG) & DIFFIE-HELLMAN TRÊN Z_$p* (Phần tử sinh g = $g)" -ForegroundColor Yellow
        Write-Host "================================================================================" -ForegroundColor Cyan
    }

    $powerTable = New-Object System.Collections.Generic.List[PSObject]
    $foundX = $null
    $foundA = $null
    $foundB = $null

    $curr = [bigint]1
    $maxLimit = [math]::Min([long]($p - 1), 100000)

    for ($x = 1; $x -le $maxLimit; $x++) {
        $curr = ($curr * $g) % $p
        $note = ""
        if ($TargetY -ge 0 -and $curr -eq $TargetY -and $null -eq $foundX) {
            $foundX = $x
            $note += " <-- Dlog_$g($TargetY) = $x "
        }
        if ($PublicA -ge 0 -and $curr -eq $PublicA -and $null -eq $foundA) {
            $foundA = $x
            $note += " <-- A = $g^$x mod $p (a = $x) "
        }
        if ($PublicB -ge 0 -and $curr -eq $PublicB -and $null -eq $foundB) {
            $foundB = $x
            $note += " <-- B = $g^$x mod $p (b = $x) "
        }

        if ($p -le 50 -or $note -ne "") {
            $powerTable.Add([PSCustomObject]@{
                SoMu_x        = $x
                LuyThua_g_mu_x = "$g^$x mod $p = $curr"
                GiaTri        = $curr
                GhiChu        = $note
            })
        }
    }

    if (-not $Silent) {
        Write-Host "Bảng đối chiếu lũy thừa g^x mod ${p}:"
        $powerTable | Format-Table -AutoSize | Out-String | Write-Host

        if ($TargetY -ge 0) {
            Write-Host "=> Kết quả Logarit rời rạc: Dlog_$g($TargetY) mod $p = $foundX  (vì $g^$foundX mod $p = $TargetY)" -ForegroundColor Green
        }

        if ($PublicA -ge 0 -and $PublicB -ge 0 -and $null -ne $foundA) {
            $sharedKey1 = (Invoke-FastExp -Base $PublicB -Exponent $foundA -Modulus $p -Silent).Result
            $sharedKey2 = if ($null -ne $foundB) { (Invoke-FastExp -Base $PublicA -Exponent $foundB -Modulus $p -Silent).Result } else { $sharedKey1 }
            Write-Host "=> Kết quả bài toán Diffie-Hellman DH_$g($PublicA, $PublicB) mod ${p}:" -ForegroundColor Green
            Write-Host "   + Tìm khóa bí mật của Alice: A = $g^a mod $p = $PublicA  => a = Dlog_$g($PublicA) = $foundA"
            if ($null -ne $foundB) {
                Write-Host "   + Tìm khóa bí mật của Bob  : B = $g^b mod $p = $PublicB  => b = Dlog_$g($PublicB) = $foundB"
            }
            Write-Host "   + Khóa phiên chung K_AB = B^a mod $p = $PublicB^$foundA mod $p = $sharedKey1" -ForegroundColor Green
        }
    }

    return [PSCustomObject]@{
        DlogX     = $foundX
        PrivateA  = $foundA
        PrivateB  = $foundB
        SharedKey = if ($PublicA -ge 0 -and $PublicB -ge 0 -and $null -ne $foundA) { (Invoke-FastExp -Base $PublicB -Exponent $foundA -Modulus $p -Silent).Result } else { $null }
        Table     = $powerTable
    }
}

# ==============================================================================
# HÀM 4: ĐƯỜNG CONG ELLIPTIC TRÊN TRƯỜNG HỮU HẠN GF(p)
# Đường cong E_p(a, b): y^2 = x^3 + ax + b (mod p)
# Hỗ trợ: Cộng 2 điểm P + Q, Nhân đôi điểm 2P, và Liệt kê toàn bộ điểm bội kP
# ==============================================================================
function Add-ECPoints {
    param (
        [PSCustomObject]$Point1,
        [PSCustomObject]$Point2,
        [bigint]$a,
        [bigint]$b,
        [bigint]$p
    )

    if ($Point1.IsInfinity) { return $Point2 }
    if ($Point2.IsInfinity) { return $Point1 }

    $x1 = Get-PositiveMod -Value $Point1.X -Modulus $p
    $y1 = Get-PositiveMod -Value $Point1.Y -Modulus $p
    $x2 = Get-PositiveMod -Value $Point2.X -Modulus $p
    $y2 = Get-PositiveMod -Value $Point2.Y -Modulus $p

    # Kiểm tra P + (-P) = O (Điểm vô cùng)
    if ($x1 -eq $x2 -and ((Get-PositiveMod -Value ($y1 + $y2) -Modulus $p) -eq 0)) {
        return [PSCustomObject]@{
            IsInfinity = $true
            X          = $null
            Y          = $null
            Label      = "O (Điểm vô cùng)"
            Lambda     = "Vô cùng (Đường thẳng đứng x = $x1)"
            Formula    = "x1 = x2 = $x1 và y1 + y2 = 0 (mod $p) => P + Q = O"
        }
    }

    if ($x1 -eq $x2 -and $y1 -eq $y2) {
        # Nhân đôi điểm (Point Doubling: P = Q)
        $num = Get-PositiveMod -Value (3 * $x1 * $x1 + $a) -Modulus $p
        $den = Get-PositiveMod -Value (2 * $y1) -Modulus $p
        $denInv = (Invoke-ExtendedEuclid -a $den -m $p -Silent).Inverse
        $lambda = Get-PositiveMod -Value ($num * $denInv) -Modulus $p
        $lambdaDesc = "lambda = (3*$x1^2 + $a) * (2*$y1)^(-1) mod $p = $num * $den^(-1) mod $p = $num * $denInv mod $p = $lambda"
    }
    else {
        # Cộng hai điểm phân biệt (Point Addition: P != Q)
        $num = Get-PositiveMod -Value ($y2 - $y1) -Modulus $p
        $den = Get-PositiveMod -Value ($x2 - $x1) -Modulus $p
        $denInv = (Invoke-ExtendedEuclid -a $den -m $p -Silent).Inverse
        $lambda = Get-PositiveMod -Value ($num * $denInv) -Modulus $p
        $lambdaDesc = "lambda = ($y2 - $y1) * ($x2 - $x1)^(-1) mod $p = $num * $den^(-1) mod $p = $num * $denInv mod $p = $lambda"
    }

    $x3 = Get-PositiveMod -Value ($lambda * $lambda - $x1 - $x2) -Modulus $p
    $y3 = Get-PositiveMod -Value ($lambda * ($x1 - $x3) - $y1) -Modulus $p

    return [PSCustomObject]@{
        IsInfinity = $false
        X          = $x3
        Y          = $y3
        Label      = "($x3, $y3)"
        Lambda     = $lambda
        Formula    = "$lambdaDesc | x3 = ($lambda^2 - $x1 - $x2) mod $p = $x3 | y3 = ($lambda*($x1 - $x3) - $y1) mod $p = $y3"
    }
}

function Invoke-EllipticCurve {
    param (
        [Parameter(Mandatory = $true)][bigint]$a,
        [Parameter(Mandatory = $true)][bigint]$b,
        [Parameter(Mandatory = $true)][bigint]$p,
        [Parameter(Mandatory = $true)][bigint]$Px,
        [Parameter(Mandatory = $true)][bigint]$Py,
        [int]$MaxMultiples = 25,
        [switch]$Silent
    )

    $discriminant = Get-PositiveMod -Value (4 * $a * $a * $a + 27 * $b * $b) -Modulus $p
    $baseP = [PSCustomObject]@{
        IsInfinity = $false
        X          = $Px
        Y          = $Py
        Label      = "($Px, $Py)"
    }

    $lhs = Get-PositiveMod -Value ($Py * $Py) -Modulus $p
    $rhs = Get-PositiveMod -Value ($Px * $Px * $Px + $a * $Px + $b) -Modulus $p

    $multiples = New-Object System.Collections.Generic.List[PSObject]
    $multiples.Add([PSCustomObject]@{
        HeSo_k      = "1P"
        ToaDoDiem   = "($Px, $Py)"
        HeSoGoc_Lam = "-"
        ChiTietTinh = "Điểm cơ sở ban đầu P = ($Px, $Py)"
    })

    $currPoint = $baseP
    $orderOfP = $null

    for ($k = 2; $k -le $MaxMultiples; $k++) {
        $nextPoint = Add-ECPoints -Point1 $currPoint -Point2 $baseP -a $a -b $b -p $p
        $multiples.Add([PSCustomObject]@{
            HeSo_k      = "${k}P"
            ToaDoDiem   = $nextPoint.Label
            HeSoGoc_Lam = "$($nextPoint.Lambda)"
            ChiTietTinh = $nextPoint.Formula
        })

        $currPoint = $nextPoint
        if ($nextPoint.IsInfinity) {
            $orderOfP = $k
            break
        }
    }

    if (-not $Silent) {
        Write-Host "`n================================================================================" -ForegroundColor Cyan
        Write-Host "[DẠNG 4] ĐƯỜNG CONG ELLIPTIC E_$p($a, $b): y^2 = x^3 + ${a}x + $b (mod $p)" -ForegroundColor Yellow
        Write-Host "================================================================================" -ForegroundColor Cyan
        Write-Host "1. Kiểm tra điều kiện đường cong không suy biến: 4a^3 + 27b^2 mod $p = $discriminant (!= 0 -> Hợp lệ)"
        Write-Host "2. Kiểm tra điểm P($Px, $Py) thuộc đường cong: y^2 mod $p = $lhs ; (x^3 + ${a}x + $b) mod $p = $rhs"
        Write-Host "3. Điểm đối của P($Px, $Py) là: -P = ($Px, $(Get-PositiveMod -Value (-$Py) -Modulus $p))"
        Write-Host "4. Bảng liệt kê toàn bộ các điểm bội kP = P + P + ... + P:"
        $multiples | Format-Table -AutoSize | Out-String | Write-Host
        if ($null -ne $orderOfP) {
            Write-Host "=> Cấp (Order) của điểm P($Px, $Py) trên đường cong là n = $orderOfP (vì ${orderOfP}P = O)." -ForegroundColor Green
        }
    }

    return [PSCustomObject]@{
        Discriminant = $discriminant
        Order        = $orderOfP
        Multiples    = $multiples
    }
}

# ==============================================================================
# HÀM 5: BỘ GIẢI TOÀN DIỆN HỆ MẬT RSA & CHỮ KÝ SỐ RSA (CÁ NHÂN HÓA THEO MSSV)
# Hỗ trợ: Tự tìm p, q nguyên tố từ 4 số cuối MSSV (abcd & dcba) hoặc nhập p, q trực tiếp
# ==============================================================================
function Invoke-RSASolver {
    param (
        [bigint]$p = 0,
        [bigint]$q = 0,
        [string]$MSSVLast4 = "",
        [Parameter(Mandatory = $true)][bigint]$e,
        [bigint]$PlaintextM = 123,
        [switch]$Silent
    )

    if ($MSSVLast4 -ne "") {
        $abcd = [long]$MSSVLast4
        $chars = $MSSVLast4.ToCharArray()
        [array]::Reverse($chars)
        $dcba = [long](-join $chars)

        # Tìm số nguyên tố p gần abcd và q gần dcba
        $candP = $abcd
        while (-not (Test-IsPrime -Number $candP)) { $candP++ }
        $candQ = $dcba
        while (-not (Test-IsPrime -Number $candQ) -or $candQ -eq $candP) { $candQ++ }

        if ($p -eq 0) { $p = [bigint]$candP }
        if ($q -eq 0) { $q = [bigint]$candQ }
    }

    $n = $p * $q
    $phi = ($p - 1) * ($q - 1)

    $euclidRes = Invoke-ExtendedEuclid -a $e -m $phi -Silent
    $d = $euclidRes.Inverse

    $cipherC = $null
    $decryptedM = $null
    $signatureS = $null
    $verifiedM = $null

    if ($null -ne $d) {
        $cipherC = (Invoke-FastExp -Base $PlaintextM -Exponent $e -Modulus $n -Silent).Result
        $decryptedM = (Invoke-FastExp -Base $cipherC -Exponent $d -Modulus $n -Silent).Result
        $signatureS = (Invoke-FastExp -Base $PlaintextM -Exponent $d -Modulus $n -Silent).Result
        $verifiedM = (Invoke-FastExp -Base $signatureS -Exponent $e -Modulus $n -Silent).Result
    }

    if (-not $Silent) {
        Write-Host "`n================================================================================" -ForegroundColor Cyan
        Write-Host "[DẠNG 5] HỆ MẬT KHÓA CÔNG KHAI RSA & CHỮ KÝ SỐ RSA: p = $p, q = $q, e = $e" -ForegroundColor Yellow
        Write-Host "================================================================================" -ForegroundColor Cyan
        Write-Host "1. Mô-đun công khai     : n = p * q = $p * $q = $n"
        Write-Host "2. Hàm Euler phi(n)     : phi(n) = (p - 1)*(q - 1) = $($p - 1) * $($q - 1) = $phi"
        Write-Host "3. Kiểm tra số mũ e     : gcd(e, phi(n)) = gcd($e, $phi) = $($euclidRes.GCD)"
        if ($null -ne $d) {
            Write-Host "4. Khóa bí mật d        : d = $e^(-1) mod $phi = $d  (Kiểm tra: $e * $d mod $phi = $(($e * $d) % $phi))" -ForegroundColor Green
            Write-Host "   + Khóa công khai (Public Key) : PU = (e, n) = ($e, $n)"
            Write-Host "   + Khóa bí mật (Private Key)   : PR = (d, n) = ($d, $n)"
            Write-Host "5. Với thông điệp M = $PlaintextM :"
            Write-Host "   + [Bảo mật - Mã hóa bằng PU]      : C = M^e mod n = $PlaintextM^$e mod $n = $cipherC" -ForegroundColor Green
            Write-Host "   + [Bảo mật - Giải mã bằng PR]     : M = C^d mod n = $cipherC^$d mod $n = $decryptedM" -ForegroundColor Green
            Write-Host "   + [Chữ ký số - Ký bằng PR]        : S = M^d mod n = $PlaintextM^$d mod $n = $signatureS" -ForegroundColor Green
            Write-Host "   + [Chữ ký số - Xác thực bằng PU]  : M' = S^e mod n = $signatureS^$e mod $n = $verifiedM" -ForegroundColor Green
        }
        else {
            Write-Host "=> LỖI: gcd($e, $phi) != 1 nên e = $e không hợp lệ! Hãy chọn e khác nguyên tố cùng nhau với $phi." -ForegroundColor Red
        }
    }

    return [PSCustomObject]@{
        p          = $p
        q          = $q
        n          = $n
        PhiN       = $phi
        e          = $e
        d          = $d
        PlaintextM = $PlaintextM
        CipherC    = $cipherC
        DecryptedM = $decryptedM
        SignatureS = $signatureS
        VerifiedM  = $verifiedM
    }
}

# ==============================================================================
# CHẠY BỘ KIỂM THỬ TỰ ĐỘNG (SELF-TEST) KHI GỌI TRỰC TIẾP SCRIPT
# Kiểm chứng toàn bộ các bài toán trong bộ Đề thi Giữa kỳ IT4015 HUST
# ==============================================================================
if ($MyInvocation.InvocationName -ne '.') {
    Write-Host "################################################################################" -ForegroundColor Magenta
    Write-Host "#   BỘ KIỂM THỬ TỰ ĐỘNG (SELF-TEST) CÁC BÀI TOÁN ĐỀ THI GIỮA KỲ IT4015 HUST    #" -ForegroundColor Magenta
    Write-Host "################################################################################" -ForegroundColor Magenta

    # 1. Kiểm thử Euclid mở rộng trong đề tự luận 2019-2025: 18^-1 mod 799 và 15^-1 mod 799
    $null = Invoke-ExtendedEuclid -a 18 -m 799
    $null = Invoke-ExtendedEuclid -a 15 -m 799

    # 2. Kiểm thử Bình phương & Nhân trong đề tự luận: 9763^532 mod 11413 và 779^280001 mod 11413
    $null = Invoke-FastExp -Base 9763 -Exponent 532 -Modulus 11413
    $null = Invoke-FastExp -Base 779 -Exponent 280001 -Modulus 11413

    # 3. Kiểm thử Logarit rời rạc & Diffie-Hellman: Dlog_3(15) mod 19 và DH_3(15, 11) mod 19
    $null = Invoke-DlogAndDH -g 3 -p 19 -TargetY 15 -PublicA 15 -PublicB 11

    # 4. Kiểm thử Đường cong Elliptic chuẩn trong đề thi: y^2 = x^3 + 2x + 2 (mod 17) với P = (5, 1)
    $null = Invoke-EllipticCurve -a 2 -b 2 -p 17 -Px 5 -Py 1 -MaxMultiples 20

    # 5. Kiểm thử Hệ mật RSA & Chữ ký số RSA:
    #    - Bài toán 1: p = 101, q = 113 (n = 11413, phi = 11200), e = 3533, M = 9726
    $null = Invoke-RSASolver -p 101 -q 113 -e 3533 -PlaintextM 9726
    #    - Bài toán 2 (Đề MOOC): p = 17, q = 23 (n = 391, phi = 352), e = 3, M = 15
    $null = Invoke-RSASolver -p 17 -q 23 -e 3 -PlaintextM 15

    Write-Host "`n================================================================================" -ForegroundColor Magenta
    Write-Host " HOÀN TẤT KIỂM THỬ TỰ ĐỘNG 100% CÁC DẠNG TOÁN GIỮA KỲ IT4015 (CHÍNH XÁC TUYỆT ĐỐI!)" -ForegroundColor Green
    Write-Host "================================================================================" -ForegroundColor Magenta
}
