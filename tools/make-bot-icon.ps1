# 記事で使う試用 Bot のアイコン (640x640 PNG) を作る。
# 使い方: pwsh -File tools/make-bot-icon.ps1   → docs/bot-icon.png
param([string]$Out = (Join-Path $PSScriptRoot '..\docs\bot-icon.png'))
Add-Type -AssemblyName System.Drawing

$size = 640
$bmp = New-Object System.Drawing.Bitmap $size, $size
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = 'AntiAlias'
$g.TextRenderingHint = 'AntiAliasGridFit'

$bg = [System.Drawing.ColorTranslator]::FromHtml('#3B6EA8')
$white = [System.Drawing.Brushes]::White
$accent = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#FFB547'))
$g.Clear($bg)

function RoundRect([float]$x, [float]$y, [float]$w, [float]$h, [float]$r) {
    $p = New-Object System.Drawing.Drawing2D.GraphicsPath
    $p.AddArc($x, $y, $r * 2, $r * 2, 180, 90)
    $p.AddArc($x + $w - $r * 2, $y, $r * 2, $r * 2, 270, 90)
    $p.AddArc($x + $w - $r * 2, $y + $h - $r * 2, $r * 2, $r * 2, 0, 90)
    $p.AddArc($x, $y + $h - $r * 2, $r * 2, $r * 2, 90, 90)
    $p.CloseFigure()
    return $p
}

# アンテナ
$g.FillRectangle($white, 312, 110, 16, 70)
$g.FillEllipse($accent, 290, 80, 60, 60)

# 顔
$g.FillPath($white, (RoundRect 150 170 340 260 70))
$eye = New-Object System.Drawing.SolidBrush $bg
$g.FillEllipse($eye, 225, 250, 60, 60)
$g.FillEllipse($eye, 355, 250, 60, 60)
$g.FillPath($eye, (RoundRect 260 350 120 26 13))

# 文字
$font = New-Object System.Drawing.Font 'Segoe UI', 64, ([System.Drawing.FontStyle]::Bold), ([System.Drawing.GraphicsUnit]::Pixel)
$fmt = New-Object System.Drawing.StringFormat
$fmt.Alignment = 'Center'
$g.DrawString('API BOT', $font, $white, (New-Object System.Drawing.RectangleF 0, 470, $size, 100), $fmt)

$g.Dispose()
$bmp.Save((Resolve-Path -LiteralPath (Split-Path $Out) | Join-Path -ChildPath (Split-Path $Out -Leaf)), [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
"saved $Out"
