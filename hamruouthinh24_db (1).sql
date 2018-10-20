-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 20, 2018 lúc 07:15 AM
-- Phiên bản máy phục vụ: 10.1.22-MariaDB
-- Phiên bản PHP: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hamruouthinh24_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `job_title`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '', '$2y$10$nfCNB/Gb9/Moch4IdsA97.LIWKu55Ybkh4sEFP2bm7MdyxTGJCDy6', 'S4iIike15B3f102pdY7TM4MRjrJFTeU9zTWF3NOMBhhJ63lg8HoLBSjmQSg8', NULL, NULL),
(2, 'maymymy_admin', 'maymymy_admin@maymymy.vn', '', '$2y$10$6Ji2vqAjzfEZS54WfwHzJu4Sy2.7OzK0zYq14j8beZeBmYVkHk.1q', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, '[\"ee6MwruPQnHmfT3XjWsXui5L5Ndmo9OaMYBT5JGH.jpeg\",\"tCqnV0uSaCTpn4xM3TuReLTDHP1hiZ3WcVQX4jMB.jpeg\"]', NULL, '2018-10-19 17:31:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blog`
--

INSERT INTO `blog` (`id`, `category_id`, `type`, `title`, `slug`, `image`, `description`, `content`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'test', 'test', 'blogs/YrH2sfM7GLgDi8moepW7D5wL7ynnJyYEEXjdcob1.jpeg', 'test', '<p>test</p>', 1, '2018-09-26 07:27:42', '2018-10-13 04:04:24'),
(2, 1, 0, 'test 1', 'test-1', 'blogs/kGHmQwXJ9liCKzG3CapiAC9FyqtLrm55mbIrSHJo.png', 'test 1', '<p>test 1</p>', 1, '2018-09-26 09:11:37', '2018-10-13 04:05:19'),
(3, 1, 0, 'NHỮNG LỢI ÍCH KHI UỐNG RƯỢU VANG MÀ BẠN NÊN BIẾT', 'nhung-loi-ich-khi-uong-ruou-vang-ma-ban-nen-biet', 'blogs/kvhaDnObQ78LynXkrwOz2B4ISowzhATjCjjric1Y.png', 'Rượu vang là một trong những loại thức uống làm say mê bất cứ ai lần đầu thưởng thức. Hương vị dịu nhẹ, ngọt thanh của rượu vang từ từ ngấm vào vị giác và kích thích thần kinh hoạt động tốt hơn. Đó là lý do mà rượu vang được rất nhiều người ưa chuộng. Tuy nhiên, không phải ai cũng hiểu hết được những lợi ích khi uống rượu vang mang lại.', '<p style=\"text-align: justify;\"><strong>Uống rượu vang gi&uacute;p ph&ograve;ng ngừa c&aacute;c bệnh về tim mạch</strong><br />T&aacute;c dụng đầu ti&ecirc;n của việc uống rượu vang đ&oacute; ch&iacute;nh l&agrave; trong rượu vang c&oacute; nhiều th&agrave;nh phần c&oacute; khả năng ph&ograve;ng ngừa c&aacute; bệnh về tim mạch cực tốt. Kh&ocirc;ng chỉ vậy, người bị bệnh tim cũng c&oacute; thể sử dụng một lượng rượu vang vừa đủ sẽ gi&uacute;p tim được khỏe mạnh hơn, hạn chế t&igrave;nh trạng đau tim, suy tim.</p>\r\n<p style=\"text-align: justify;\"><br /><strong>Uống rượu vang ph&ograve;ng ngừa ung thư hiệu quả</strong><br />Hơn nữa, rượu vang c&ograve;n c&oacute; t&aacute;c dụng ngăn ngừa bệnh ung thư một c&aacute;ch hiệu quả. V&igrave; thế việc uống rượu vang khoa học cũng l&agrave; c&aacute;ch gi&uacute;p bạn ph&ograve;ng ngừa được c&aacute;c bệnh nguy hiểm. Trong đ&oacute; c&oacute; ung thư. Đ&acirc;y l&agrave; căn bệnh qu&aacute;i &aacute;c v&agrave; dường như chưa c&oacute; c&aacute;ch điều trị v&igrave; thế ch&uacute;ng ta cần ph&ograve;ng ngừa ch&uacute;ng qua những việc rất đơn giản như vậy.</p>\r\n<p style=\"text-align: justify;\"><strong>Giảm stress v&agrave; ngăn ngừa b&eacute;o ph&igrave;&nbsp;</strong><br />Trong cuộc sống hiện đại ch&uacute;ng ta thường hay bị căng thẳng, mệt mỏi stress nặng. Do đ&oacute;, lu&ocirc;n cảm thấy bức bối kh&oacute; chịu. Nhưng chỉ cần ch&uacute;ng ta sử dụng rượu vang đ&uacute;ng c&aacute;ch th&igrave; mọi căng thẳng mệt mỏi sẽ được tan biết, uống rượu vang gi&uacute;p cơ thể của ch&uacute;ng ta trở n&ecirc;n khoan kho&aacute;i, dễ chịu hơn rất nhiều.&nbsp;</p>\r\n<p style=\"text-align: justify;\"><br />Ngo&agrave;i ra, rượu vang c&ograve;n gi&uacute;p ch&uacute;ng ta giảm được t&igrave;nh trạng b&eacute;o ph&igrave;, giảm c&acirc;n hiệu quả nhờ đ&oacute; tr&aacute;nh được c&aacute;c nguy cơ mỡ trong m&aacute;u.&nbsp;</p>\r\n<p style=\"text-align: justify;\"><br /><strong>Giảm thiểu nguy cơ đột quỵ v&agrave; tiểu đường loại 2</strong><br />B&ecirc;n cạnh đ&oacute;, uống rượu vang c&ograve;n c&oacute; t&aacute;c dụng giảm thiểu ngu cơ bị đột quỵ hay căn bệnh phổ biến như tiểu đường tu&yacute;p 2. Nhờ đ&oacute; m&agrave; cuộc sống của con người trở n&ecirc;n l&agrave;nh mạnh, sức khỏe tốt hơn. Đ&acirc;y l&agrave; hai căn bệnh nguy hiểm v&agrave; l&agrave; nỗi lo &nbsp;của to&agrave;n x&atilde; hội. Do đ&oacute;, sử dụng rượu vang cực kỳ đơn giản những mang lại lợi &iacute;t rất tốt trong ph&ograve;ng chống hai căn bệnh n&agrave;y. Kh&ocirc;ng c&oacute; l&yacute; do g&igrave; m&agrave; ch&uacute;ng ta bỏ qua thức uống tốt như rượu vang.&nbsp;</p>\r\n<p style=\"text-align: justify;\"><br /><strong>Gi&uacute;p hệ ti&ecirc;u h&oacute;a hoạt động tốt, ngăn ngừa mất tr&iacute; nhớ</strong><br />Kh&ocirc;ng chỉ vậy, uống rượu vang c&ograve;n gi&uacute;p hệ ti&ecirc;u h&oacute;a của ch&uacute;ng ta hoạt động tốt hơn v&agrave; ngăn ngừa t&igrave;nh trạng mất tr&iacute; nhớ hay xảy ra ở người trung ni&ecirc;n. Với những lợi &iacute;ch n&agrave;y th&igrave; ch&uacute;ng ta n&ecirc;n bổ sung rượu vang v&agrave;o cuộc sống của m&igrave;nh để gi&uacute;p sức khỏe tốt hơn, sống thọ hơn.</p>', 0, '2018-10-13 04:05:14', '2018-10-13 04:05:14'),
(4, 1, 0, 'NHỮNG LÍ DO NÊN LỰA CHỌN RƯỢU VANG LÀM QUÀ TẶNG', 'nhung-li-do-nen-lua-chon-ruou-vang-lam-qua-tang', 'blogs/9ksecgNeofEiARYo7ihwUbkYcw7uf7Cm2ZInEnJ7.png', 'Trong cuộc sống hiện nay thì những món quà cho những người thân, những người đồng nghiệp hay những người sếp của bạn dần trở thành một nét văn hóa đẹp bởi món quà sẽ giúp cho mối quan hệ của bạn trở nên tốt đẹp hơn và nếu món quà mà bạn định tặng đó là rượu vang thì thực sự sẽ mang đến nhiều ý nghĩa tốt đẹp cũng như vẻ sang trọng hơn rất nhiều.', '<p style=\"text-align: justify;\"><strong>M&oacute;n qu&agrave; tặng rượu vang</strong><br />Đối với những nước phương t&acirc;y th&igrave; sản phẩm rượu vang như một thứ đồ uống d&acirc;n gian đ&atilde; c&oacute; từ rất nhiều năm trước bởi đ&acirc;y l&agrave; một loại đồ uống v&ocirc; c&ugrave;ng thơm ngon cũng như sang trọng kể cả trong việc uống hay l&agrave;m qu&agrave;.</p>\r\n<p style=\"text-align: justify;\"><br />Bạn c&oacute; thể thấy khi v&agrave;o những nh&agrave; h&agrave;ng sang trọng hay tr&ecirc;n b&agrave;n ăn của những thương gia hoặc doanh nh&acirc;n l&agrave;m việc lớn thường lu&ocirc;n c&oacute; những chai rượu vang v&ocirc; cung sang trọng đặt ở đ&oacute; v&agrave; nếu như trong căn ph&ograve;ng kh&aacute;ch nh&agrave; bạn c&oacute; một tủ lưu niệm những sản phẩm rượu vang kh&aacute;c nhau th&igrave; đ&oacute; quả thật l&agrave; một điều tuyệt vời.</p>\r\n<p style=\"text-align: justify;\"><strong>Lựa chọn rượu vang</strong><br />Rượu vang l&agrave; một sản phẩm c&oacute; từ rất nhiều năm trước cho n&ecirc;n trong thời k&igrave; ph&aacute;t triển của n&oacute; đ&atilde; c&oacute; rất nhiều th&agrave;nh tựu cũng như đ&atilde; được ph&aacute;t triển th&agrave;nh rất nhiều c&aacute;c loại rượu với m&ugrave;i vị kh&aacute;c nhau n&ecirc;n để chọn được một loại rượu vang ngon l&agrave;m qu&agrave; bạn cũng cần phải lưu &yacute; rất nhiều điều.</p>\r\n<p style=\"text-align: justify;\"><br />Đầu ti&ecirc;n bạn cần quan t&acirc;m tới nơi sản xuất n&ecirc;n loại rượu v&igrave; rằng ở những nước phương t&acirc;y th&igrave; sản phẩm rượu vang lu&ocirc;n được sản xuất dưới một d&acirc;y chuyền kinh nghiệm hơn rất nhiều n&ecirc;n thường cho ra được những chai rượu vang thơm ngon v&agrave; chất lượng tốt hơn ở những nơi kh&aacute;c.</p>\r\n<p style=\"text-align: justify;\"><br />Tiếp theo đ&oacute; bạn cần quan t&acirc;m tới c&aacute;ch sản xuất, thời gian ủ rượu v&agrave; c&aacute;c phương ph&aacute;p sử dụng trong chế biến rượu bởi rằng c&aacute;ch sản xuất loại rượu n&agrave;y c&oacute; thể hiểu một c&aacute;ch đơn giản đ&oacute; ch&iacute;nh l&agrave; l&ecirc;n men sản phẩm quả nho để cho ra những m&ugrave;i vị thơm ngon ấy.</p>\r\n<p style=\"text-align: justify;\"><br />Trong qu&aacute; tr&igrave;nh l&ecirc;n men th&igrave; một chai rượu tốt hơn v&agrave; ngon hơn sẽ được nh&agrave; sản xuất sử dụng những qui tr&igrave;nh đặc biệt kh&aacute;c nhau hoặc th&ecirc;m bớt những gia vị kh&ocirc;ng được tiết lộ ra ngo&agrave;i để h&atilde;ng rượu của m&igrave;nh c&oacute; được những sản phẩm tốt hơn để c&oacute; thể cạnh tranh tr&ecirc;n thị trường bu&ocirc;n b&aacute;n với những h&atilde;ng kh&aacute;c.</p>\r\n<p style=\"text-align: justify;\"><br />V&igrave; vậy khi lựa chọn sản phẩm rượu bạn cần phải rất lưu &yacute; để c&oacute; được một m&oacute;n qu&agrave; tặng vừa chất lượng lại vừa sang trọng nhất cho những người th&acirc;n, bạn b&egrave; hay những người sếp của bạn.<br />Cảm ơn c&aacute;c bạn đ&atilde; quan t&acirc;m v&agrave; đọc hết b&agrave;i viết n&agrave;y.</p>', 0, '2018-10-13 04:06:23', '2018-10-13 04:06:23'),
(5, 1, 0, 'RƯỢU VANG – THỨC UỐNG ĐƯỢM VỊ CHO NGÀY GIÁNG SINH ĐẾN GẦN', 'ruou-vang-thuc-uong-duom-vi-cho-ngay-giang-sinh-den-gan', 'blogs/uyIwJlPZKRr24QKSevYinHg7fYAeDGCRJfiQypap.png', 'Hơi thở mùa đông đã bắt đầu nhen nhóm trên khắp các con phố và đường làng, chính điều này nên ngay từ bây giờ chúng ta chuẩn bị sẵn những nguyên liệu, thực phẩm và thức ăn cho ngày đông lạnh lẽo chính là điều cần thực hiện. Bạn nghĩ sao khi sử dụng một chai rượu vang trong bữa tiệc giáng sinh ấm áp trong gia đình và bên cạnh những người thân thiết của mình nhỉ', '<p><strong>Mua rượu vang chất lượng ở đ&acirc;u?</strong><br />Những chai rượu vang chất lượng, được bảo quản trong một chu tr&igrave;nh kh&eacute;p k&iacute;n, hợp l&yacute;, bảo to&agrave;n m&ugrave;i vị phục vụ cho người kh&aacute;ch h&agrave;ng c&oacute; nhu cầu t&igrave;m mua chỉ c&oacute; mặt tại Wine Plaza, đảm bảo đến với Wine Plaza bạn sẽ chọn được cho m&igrave;nh những d&ograve;ng rượu vang chất lượng nhất, những chai rượu đến từ nhiều thương hiệu nổi tiếng Thế giới để phục vụ cho nhu cầu sử dụng của bạn với c&aacute;c mức gi&aacute; th&agrave;nh hết sức hợp l&yacute;.</p>\r\n<p style=\"text-align: justify;\"><strong>Rượu vang c&oacute; thể sử dụng trong những trường hợp n&agrave;o m&ugrave;a gi&aacute;ng sinh?</strong><br />Một chai rượu vang chất lượng được mua tại Wine Plaza khi sử dụng bạn c&oacute; thể d&ugrave;ng n&oacute; như một m&oacute;n qu&agrave; &yacute; nghĩa trong m&ugrave;a noel đang đến gần cho người th&acirc;n, người bạn đặc biệt v&agrave; thậm ch&iacute; l&agrave; một người đối t&aacute;c quan trọng trong việc l&agrave;m ăn của m&igrave;nh.</p>\r\n<p style=\"text-align: justify;\"><br />Chai rượu vang được mua tại Wine Plaza c&oacute; đảm bảo về chất lượng khi sử dụng n&ecirc;n bạn c&oacute; thể y&ecirc;n t&acirc;m sử dụng n&oacute; như một thức uống trong một bữa tiệc ấm c&uacute;ng ng&agrave;y noel lạnh lẽo c&ugrave;ng gia đ&igrave;nh, người th&acirc;n, đồng nghiệp của m&igrave;nh nhằm l&agrave;m cho cuộc sống của ch&uacute;ng ta th&ecirc;m m&agrave;u sắc v&agrave; tạo được kh&ocirc;ng kh&iacute; l&atilde;ng mạng đ&aacute;ng ghi nhớ trong dịp noel.</p>\r\n<p style=\"text-align: justify;\"><br /><strong>Nồng n&agrave;ng vị cay cho ng&agrave;y gi&aacute;ng sinh tr&agrave;n niềm vui</strong><br />Mua rượu vang tại Wine Plaza để sử dụng bạn sẽ nhận được những ly rượu thơm ngon, sử dụng một cốc rượu vang thơm lừng, nồng vị cay nhẹ nơi đầu lưỡi, đượm hơi men nhẹ nh&agrave;ng nhưng l&acirc;u phai cho ng&agrave;y gi&aacute;ng sinh ch&iacute;nh l&agrave; n&eacute;t ẩm thực v&ocirc; c&ugrave;ng hiện đại, sang trọng v&agrave; tinh tế cho cuộc sống của những người hiện đại hiện nay.</p>\r\n<p style=\"text-align: justify;\"><br />Một ly rượu vang được cầm tr&ecirc;n tay, nhấp một ngụm nhỏ sau khi lắc đều ly rượu sẽ k&iacute;ch th&iacute;ch cho vị gi&aacute;c v&agrave; tinh thần của ch&uacute;ng ta rất nhiều, tạo n&ecirc;n sự hưng phấn cho những th&agrave;nh vi&ecirc;n c&ugrave;ng tham gia bữa tiệc noel đầy th&uacute; vị v&agrave; l&agrave; sự gắn kết cho những gi&aacute; trị tinh thần ng&agrave;y đ&ocirc;ng.</p>\r\n<p style=\"text-align: justify;\"><br />Wine Plaza tự tin l&agrave; nơi để kh&aacute;ch h&agrave;ng c&oacute; đam m&ecirc; với thức uống hiện đại n&agrave;y t&igrave;m đến thực hiện mua v&agrave; thưởng thức những tinh t&uacute;y của sự hiện đại v&agrave; c&oacute; được nhiều gi&aacute; trị sống thật &yacute; nghĩa trong cuộc sống hiện nay.</p>', 0, '2018-10-13 04:07:16', '2018-10-13 04:07:16'),
(6, 4, 0, 'bai viet cgo test', 'bai-viet-cgo-test', 'blogs/TPm33ActxXs487mXw5ZXWktrHkpRmkvoBf50vsba.jpeg', 'asdasdas', '<p>addadasd</p>', 0, '2018-10-18 04:24:36', '2018-10-18 04:24:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog_category`
--

CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` text,
  `description` text,
  `type` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `blog_category`
--

INSERT INTO `blog_category` (`id`, `title`, `slug`, `image`, `description`, `type`, `created_at`, `updated_at`, `is_active`, `is_deleted`) VALUES
(1, 'Tin Tức', 'tin-tuc', 'blogCategories/uhtgOSuqaXU1nWExXT4oGO2eB1naOWloizgFwsWr.png', 'Tin Tức', 1, '2018-09-26 04:33:07', '2018-09-26 08:16:10', 1, 0),
(2, 'Tư Vấn', 'tu-van', 'advises/category/yLwi7WEQ7BpobpMZIe1PSIiIi0pGgcaJ1iOGz1cu.png', 'Tư Vấn', 0, '2018-09-26 04:34:01', '2018-09-26 04:34:01', 1, 0),
(3, 'Tuyển dụng', 'tuyen-dung', 'news/category/j5ptkT3OcSX46NlIRXNFtOL5NbSdNb1lfLiEXnRt.jpeg', 'Tuyển dụng', 1, '2018-09-26 07:09:31', '2018-09-26 08:17:06', 1, 0),
(4, 'test', 'test', 'blogCategories/2VYZEqCdj08MHmWh2alIOjdzxsJMFCbHmVSz23W9.jpeg', 'test', NULL, '2018-10-18 04:23:54', '2018-10-18 04:23:54', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(4) DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blog_comment`
--

INSERT INTO `blog_comment` (`id`, `blog_id`, `author`, `email`, `url`, `ip`, `content`, `is_approved`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'a', 'admin@admin.com', NULL, NULL, 'asd', 0, 0, '2018-09-26 09:05:17', '2018-09-26 09:05:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberphone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `company`, `address`, `numberphone`, `email`, `website`, `map`, `created_at`, `updated_at`) VALUES
(1, 'CTY TNHH MTV TM hóa mỹ phẩm Nam Anh Khương', '11/B6 KP. Bình Thuận 2, P.Thuận Giao, TX.Thuận An, Bình Dương', '(0274) 3717 508 - 0933 457 345', 'namanhkhuong@yahoo.com.vn', 'www.hoamyphamnamanhkhuong.com', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.925653583093!2d105.78706381422545!3d21.03566058599462!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab49e86439d1%3A0x3e1480876f45a0c7!2sH%E1%BB%93ng+Minh+Baby+Store!5e0!3m2!1svi!2s!4v1539970769042\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', NULL, '2018-10-19 17:39:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `id` int(10) UNSIGNED NOT NULL,
  `library_id` int(11) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `library_id`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'MALVAN.jpg', NULL, NULL, NULL),
(2, 1, 'PRIMITIVO DI MANDURIA RISERVA DEL FONDATORE piccola.jpg', NULL, NULL, NULL),
(3, 1, 'PRIM-SALEN1.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `introduce`
--

CREATE TABLE `introduce` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `introduce`
--

INSERT INTO `introduce` (`id`, `title`, `slug`, `image`, `description`, `content`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Về chúng tôi', 've-chung-toi', 'introduce/s8ZEzY18Dk193BB4nrsiTugshpjkBYWCV8NLCsHX.jpeg', '', '<p>Được th&agrave;nh lập từ năm 2013 bởi th&agrave;nh quả hợp t&aacute;c của chuy&ecirc;n gia rượu vang v&agrave; những người bạn đồng h&agrave;nh đam m&ecirc; rượu vang, Wineplaza hội tụ đầy đủ những yếu tố để trở th&agrave;nh người cung cấp rượu vang h&agrave;ng đầu tại Việt Nam v&agrave; Thế Giới. Hiểu r&otilde; gu thưởng thức của kh&aacute;ch h&agrave;ng, mọi sản phẩm tại <strong>Hamruou24h</strong> đều được nhập khẩu trực tiếp từ c&aacute;c nh&agrave; sản xuất danh tiếng, sau đ&oacute; được c&aacute;c chuy&ecirc;n gia rượu vang h&agrave;ng đầu kiểm tra v&agrave; thử nghiệm kĩ lưỡng trước khi giới thiệu tới người ti&ecirc;u d&ugrave;ng. Mục đ&iacute;ch cuối c&ugrave;ng của ch&uacute;ng t&ocirc;i l&agrave; đảm bảo bạn được thưởng thức những sản phẩm tuyệt hảo với mức gi&aacute; thấp nhất c&oacute; thể.</p>\r\n<p><strong>Những đối t&aacute;c lớn của Hamruou24h c&oacute; thể kể tới như:</strong>&nbsp;Haidangplaza, ...</p>\r\n<p>&nbsp;</p>', 0, NULL, '2018-10-20 04:50:12'),
(2, 'Tầm nhìn chiến lược', 'tam-nhin-chien-luoc', 'introduce/DAUXK971T0dSwnalxtFsemkwspZrAb5hFlnWAje1.jpeg', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae velit ac risus cursus pretium eget id arcu. Cras non turpis ligula. Nunc placerat justo eget libero blandit pharetra. Suspendisse quis mauris a eros lobortis interdum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec venenatis, nibh non ullamcorper condimentum, diam enim volutpat lacus, at bibendum tortor lorem quis mi. Fusce molestie odio tincidunt, consectetur nisi quis, molestie ante. Curabitur risus neque, condimentum nec quam hendrerit, sollicitudin accumsan risus. Nunc commodo sapien dui, non tempor sapien elementum at. Duis euismod est sed rutrum euismod. Etiam ornare placerat orci, id molestie dolor ornare quis. Curabitur finibus ultrices ultricies. Aliquam viverra sagittis efficitur. Duis ullamcorper lorem in nulla vestibulum porttitor non quis ante.</p>\r\n<p>&nbsp;</p>', 0, NULL, '2018-10-18 03:52:15'),
(3, 'Sứ mệnh', 'su-menh', 'introduce/3PoFSgfTrcsF0rNtcjDe7iIPh4anRhHjUAkmlVMn.jpeg', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae velit ac risus cursus pretium eget id arcu. Cras non turpis ligula. Nunc placerat justo eget libero blandit pharetra. Suspendisse quis mauris a eros lobortis interdum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec venenatis, nibh non ullamcorper condimentum, diam enim volutpat lacus, at bibendum tortor lorem quis mi. Fusce molestie odio tincidunt, consectetur nisi quis, molestie ante. Curabitur risus neque, condimentum nec quam hendrerit, sollicitudin accumsan risus. Nunc commodo sapien dui, non tempor sapien elementum at. Duis euismod est sed rutrum euismod. Etiam ornare placerat orci, id molestie dolor ornare quis. Curabitur finibus ultrices ultricies. Aliquam viverra sagittis efficitur. Duis ullamcorper lorem in nulla vestibulum porttitor non quis ante.</p>', 0, NULL, '2018-10-18 03:51:43'),
(4, 'Chứng nhận', 'chung-nhan', 'introduce/z47H97qzTwsB0Ww0LsPCWEBb7HkaPiCAOGVuyhoQ.jpeg', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent gravida tempor lacinia. Nam odio metus, ornare vitae diam in, tempus pellentesque magna. Nullam eget nisi non quam luctus posuere. Quisque sem sapien, congue tincidunt varius in, sagittis in lorem. Aliquam feugiat est quis nisl varius sodales. Curabitur vel nibh dapibus, condimentum nunc ac, fringilla nunc. Praesent enim ex, molestie id sapien sed, tincidunt finibus dui. Praesent quis diam ultrices, iaculis nisi et, condimentum ex. In lacinia augue felis, nec lobortis risus aliquet in. Curabitur id tortor diam. Maecenas id interdum felis. Cras egestas, orci ut cursus dictum, neque purus sodales dui, a elementum mauris enim sed arcu.</p>', 0, NULL, '2017-11-28 07:08:53'),
(5, 'Điểu khoản', 'dieu-khoan', 'introduce/W1cAVHfj4YBGD1yBpx9Wenv2dakH2l8HtScWUdZH.jpeg', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae velit ac risus cursus pretium eget id arcu. Cras non turpis ligula. Nunc placerat justo eget libero blandit pharetra. Suspendisse quis mauris a eros lobortis interdum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec venenatis, nibh non ullamcorper condimentum, diam enim volutpat lacus, at bibendum tortor lorem quis mi. Fusce molestie odio tincidunt, consectetur nisi quis, molestie ante. Curabitur risus neque, condimentum nec quam hendrerit, sollicitudin accumsan risus. Nunc commodo sapien dui, non tempor sapien elementum at. Duis euismod est sed rutrum euismod. Etiam ornare placerat orci, id molestie dolor ornare quis. Curabitur finibus ultrices ultricies. Aliquam viverra sagittis efficitur. Duis ullamcorper lorem in nulla vestibulum porttitor non quis ante.</p>', 0, NULL, '2018-10-18 03:52:41'),
(6, 'Thư viện ảnh', 'thu-vien-anh', 'introduce/lSDOcIRzwjzjY20CS6oDCCMRw9huC3IuqFt4VxSu.jpeg', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent gravida tempor lacinia. Nam odio metus, ornare vitae diam in, tempus pellentesque magna. Nullam eget nisi non quam luctus posuere. Quisque sem sapien, congue tincidunt varius in, sagittis in lorem. Aliquam feugiat est quis nisl varius sodales. Curabitur vel nibh dapibus, condimentum nunc ac, fringilla nunc. Praesent enim ex, molestie id sapien sed, tincidunt finibus dui. Praesent quis diam ultrices, iaculis nisi et, condimentum ex. In lacinia augue felis, nec lobortis risus aliquet in. Curabitur id tortor diam. Maecenas id interdum felis. Cras egestas, orci ut cursus dictum, neque purus sodales dui, a elementum mauris enim sed arcu.</p>', 0, NULL, '2017-11-28 07:09:07'),
(7, 'Đăng ký thử rượu', 'dang-ky-thu-ruou', 'introduce/mBJw2LJSejGOLXqDoh4A21FERCYqfIthTt5bYBDc.jpeg', 'Vivamus ac tempor quam. Maecenas pulvinar tristique malesuada. Donec euismod nibh et dapibus tempor. Nullam elit nulla, rutrum eget eros sollicitudin, ullamcorper ultrices orci. Suspendisse potenti. Ut porta bibendum nibh eu viverra. Sed vel magna ac ligula finibus fermentum fringilla eu lectus. Sed elit ante, ornare nec dui at, molestie congue arcu. Nam at imperdiet neque, non tempus libero. Praesent dolor odio, mattis vulputate est ut, vulputate sollicitudin metus. Nulla id metus turpis. Phasellus non diam nisi. Duis vitae felis et magna elementum dictum. Pellentesque in enim fringilla, ullamcorper lacus et, imperdiet erat.aa', '<ol>\r\n<li>\r\n<h3>Buoc 1:</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquam pretium sapien, et gravida nisl vehicula a. Fusce nec augue eu velit tempus finibus in id diam. Vivamus pellentesque orci molestie justo dapibus, id posuere lectus placerat. Cras ut eros rutrum magna accumsan bibendum. Quisque laoreet, elit sit amet imperdiet euismod, lacus mauris consectetur orci, eget aliquam odio ante a massa. Vestibulum convallis egestas dignissim. Donec sit amet iaculis odio.</p>\r\n<p>Morbi vel maximus ex. Vivamus sit amet cursus orci. Aliquam cursus bibendum lacus, quis congue justo. In volutpat, magna sit amet porta gravida, ante erat sodales eros, eget malesuada magna est vitae magna. Phasellus laoreet pharetra scelerisque. Nunc ex mauris, cursus eu ex a, mollis tempus nisi. Integer eleifend justo quam, a imperdiet urna pretium at. Sed porta nulla ut odio volutpat auctor. Maecenas et metus lacus. Integer metus sem, iaculis vel suscipit vel, aliquam at justo. Quisque quis condimentum nibh. Suspendisse hendrerit consequat ipsum, in malesuada urna vestibulum nec. Ut maximus, mi ut sodales lacinia, mauris eros varius lorem, et convallis felis diam eu sapien. Donec sollicitudin, nisl a blandit euismod, risus mauris tristique lectus, sed dignissim quam risus sit amet massa.</p>\r\n</li>\r\n<li>\r\n<h3>Buoc 2:</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquam pretium sapien, et gravida nisl vehicula a. Fusce nec augue eu velit tempus finibus in id diam. Vivamus pellentesque orci molestie justo dapibus, id posuere lectus placerat. Cras ut eros rutrum magna accumsan bibendum. Quisque laoreet, elit sit amet imperdiet euismod, lacus mauris consectetur orci, eget aliquam odio ante a massa. Vestibulum convallis egestas dignissim. Donec sit amet iaculis odio.</p>\r\n<p>Morbi vel maximus ex. Vivamus sit amet cursus orci. Aliquam cursus bibendum lacus, quis congue justo. In volutpat, magna sit amet porta gravida, ante erat sodales eros, eget malesuada magna est vitae magna. Phasellus laoreet pharetra scelerisque. Nunc ex mauris, cursus eu ex a, mollis tempus nisi. Integer eleifend justo quam, a imperdiet urna pretium at. Sed porta nulla ut odio volutpat auctor. Maecenas et metus lacus. Integer metus sem, iaculis vel suscipit vel, aliquam at justo. Quisque quis condimentum nibh. Suspendisse hendrerit consequat ipsum, in malesuada urna vestibulum nec. Ut maximus, mi ut sodales lacinia, mauris eros varius lorem, et convallis felis diam eu sapien. Donec sollicitudin, nisl a blandit euismod, risus mauris tristique lectus, sed dignissim quam risus sit amet massa.</p>\r\n</li>\r\n<li>\r\n<h3>Buoc 3:</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquam pretium sapien, et gravida nisl vehicula a. Fusce nec augue eu velit tempus finibus in id diam. Vivamus pellentesque orci molestie justo dapibus, id posuere lectus placerat. Cras ut eros rutrum magna accumsan bibendum. Quisque laoreet, elit sit amet imperdiet euismod, lacus mauris consectetur orci, eget aliquam odio ante a massa. Vestibulum convallis egestas dignissim. Donec sit amet iaculis odio.</p>\r\n<p>Morbi vel maximus ex. Vivamus sit amet cursus orci. Aliquam cursus bibendum lacus, quis congue justo. In volutpat, magna sit amet porta gravida, ante erat sodales eros, eget malesuada magna est vitae magna. Phasellus laoreet pharetra scelerisque. Nunc ex mauris, cursus eu ex a, mollis tempus nisi. Integer eleifend justo quam, a imperdiet urna pretium at. Sed porta nulla ut odio volutpat auctor. Maecenas et metus lacus. Integer metus sem, iaculis vel suscipit vel, aliquam at justo. Quisque quis condimentum nibh. Suspendisse hendrerit consequat ipsum, in malesuada urna vestibulum nec. Ut maximus, mi ut sodales lacinia, mauris eros varius lorem, et convallis felis diam eu sapien. Donec sollicitudin, nisl a blandit euismod, risus mauris tristique lectus, sed dignissim quam risus sit amet massa.</p>\r\n</li>\r\n</ol>', 0, '2018-10-19 17:00:00', '2018-10-20 05:12:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kind`
--

CREATE TABLE `kind` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `image` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `kind`
--

INSERT INTO `kind` (`id`, `type_id`, `title`, `slug`, `description`, `is_deleted`, `created_at`, `updated_at`, `is_active`, `image`) VALUES
(21, 34, 'Rượu Vang', 'ruou-vang', 'Rượu Vang', 0, '2018-09-25 09:05:56', '2018-09-25 09:05:56', 1, 'laku-vina-requingua-premium-590x787.jpg'),
(22, 35, 'Bia Đức', 'bia-duc', 'Bia Đức', 0, '2018-09-25 09:07:04', '2018-09-25 09:07:04', 1, 'bia-becks-5-duc-lon-cao-500-ml.png'),
(23, 34, 'Vang đỏ / Red Wines', 'vang-do-red-wines', 'GIới thiệu', 0, '2018-10-06 04:19:34', '2018-10-06 04:19:34', 1, 'ruou_vang_do_agentina_-_pascual_toso_malbec_reserve_master.jpg'),
(24, 34, 'Vang trắng / White Wines', 'vang-trang-white-wines', 'Vang trắng / White Wines', 0, '2018-10-06 04:20:09', '2018-10-06 04:20:09', 1, '1-ruou_vang_do_agentina_-_pascual_toso_malbec_reserve_master.jpg'),
(25, 34, 'Vang nổ / Sparkling Wines', 'vang-no-sparkling-wines', 'Vang nổ / Sparkling Wines', 0, '2018-10-06 04:20:27', '2018-10-06 04:20:27', 1, '2-ruou_vang_do_agentina_-_pascual_toso_malbec_reserve_master.jpg'),
(26, 34, 'Vang ngọt / Dessert wines', 'vang-ngot-dessert-wines', 'Vang ngọt / Dessert wines', 0, '2018-10-06 04:20:45', '2018-10-06 04:20:45', 1, '3-ruou_vang_do_agentina_-_pascual_toso_malbec_reserve_master.jpg'),
(27, 34, 'Vang Hồng / Rose wines', 'vang-hong-rose-wines', 'Vang Hồng / Rose wines', 0, '2018-10-06 04:21:06', '2018-10-06 04:21:06', 1, '4-ruou_vang_do_agentina_-_pascual_toso_malbec_reserve_master.jpg'),
(28, 34, 'Các dòng vang khác / others', 'cac-dong-vang-khac-others', 'Các dòng vang khác / others', 0, '2018-10-06 04:21:26', '2018-10-06 04:21:26', 1, '5-ruou_vang_do_agentina_-_pascual_toso_malbec_reserve_master.jpg'),
(29, 36, 'Dòng sản phẩm cho rượu mạnh', 'dong-san-pham-cho-ruou-manh', 'Dòng sản phẩm cho rượu mạnh', 0, '2018-10-18 04:04:51', '2018-10-18 04:04:51', 1, 'SALICERIS.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `library`
--

CREATE TABLE `library` (
  `id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `library`
--

INSERT INTO `library` (`id`, `title`, `slug`, `description`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', 'test', 0, '2018-10-18 04:01:58', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2017_12_27_115203_create_image_table', 5),
(17, '2014_10_12_000000_create_users_table', 6),
(18, '2014_10_12_100000_create_password_resets_table', 6),
(19, '2017_02_25_025103_create_admins_table', 6),
(20, '2017_11_01_042108_adds_api_token_to_users_table', 6),
(21, '2017_11_07_164248_create_blog_table', 6),
(22, '2017_11_07_170713_create_comment_blog_table', 6),
(23, '2018_01_05_172646_create_tasting_table', 7),
(24, '2018_01_05_173223_create_tasting_product_table', 8),
(25, '2018_01_05_180917_create_tasting_table', 9),
(26, '2018_01_05_181014_create_tasting_product_table', 9),
(27, '2018_01_14_150322_create_product_comment_table', 10),
(28, '2018_02_01_155856_create_subscribe_table', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `unique_code` varchar(10) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_phone` decimal(20,0) DEFAULT NULL,
  `customer_address` varchar(200) DEFAULT NULL,
  `customer_district` varchar(100) DEFAULT NULL,
  `customer_city` varchar(100) DEFAULT NULL,
  `customer_content` text,
  `payment_method` tinyint(1) DEFAULT NULL COMMENT '1: COD; 2: Bank',
  `status` tinyint(1) DEFAULT '0' COMMENT '0: pending; 1: ongoing; 2: complete; 99: cancel',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `unique_code`, `customer_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `customer_district`, `customer_city`, `customer_content`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(62, 'B84C4EF74', 6, 'Ha Nguyen', 'hanguyen@user.com', '985767862', 'Tô Hiệu', 'Cầu Giấy', 'Hà Nội', 'abc', 2, 2, '2018-03-05 05:17:59', '2018-10-18 04:13:59'),
(63, '2A310B666', 6, 'Ha Nguyen', 'hanguyen@user.com', '985767862', 'Tô Hiệu', 'Cầu Giấy', 'Hà Nội', '', 1, 2, '2018-03-22 07:58:49', '2018-09-25 07:44:55'),
(64, '0D2BC2982', 6, 'Ha Nguyen', 'hanguyen@user.com', '985767862', 'Tô Hiệu', 'Cầu Giấy', 'Hà Nội', 'asdasda', 1, 99, '2018-04-21 15:19:30', '2018-10-18 07:31:47'),
(65, '32A48494D', 0, 'asda', 'asdasd@gmail.com', '12313123', 'asdas', 'abc', 'abc', 'abc', 1, 99, '2018-07-19 15:51:39', '2018-10-18 04:14:32'),
(66, 'B161425C9', 13, 'Lương Quốc Hưng', 'luongquochung.249@gmail.com', '916595514', 'ha noi', 'ha noi', 'ha noi', 'test', 1, 2, '2018-10-18 07:38:28', '2018-10-18 07:38:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_quantity` decimal(20,0) DEFAULT NULL,
  `product_total_cost` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `product_name`, `product_quantity`, `product_total_cost`) VALUES
(87, 62, 56, 'san pham 7', '5', '500'),
(88, 62, 57, 'san phammmmmmmmmm', '1', '9'),
(89, 63, 59, '3', '1', '3'),
(90, 64, 57, 'san phammmmmmmmmm 11', '1', '9'),
(91, 64, 59, '4', '1', '3'),
(92, 65, 59, '4', '1', '3'),
(93, 66, 63, 'Rượu Vang Đỏ Ý - Golden Cross Primitivo Salento Rosso', '1', '9999999'),
(94, 66, 64, 'Rượu Vang Trắng Tây Ban Nha Finca De Zalamena Macabeo', '1', '9999999');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `origin`
--

CREATE TABLE `origin` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `origin`
--

INSERT INTO `origin` (`id`, `name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(36, 'Các quốc gia khác', 0, '2018-09-25 09:32:13', '2018-10-12 04:48:07'),
(37, 'MY', 1, '2018-10-12 04:46:33', '2018-10-12 04:47:53'),
(38, 'Chile', 0, '2018-10-12 07:26:57', '2018-10-12 07:26:57'),
(39, 'Italia', 0, '2018-10-12 07:27:19', '2018-10-12 07:27:19'),
(40, 'Pháp', 0, '2018-10-13 02:50:53', '2018-10-13 02:50:53'),
(41, 'Tây Ban Nha', 0, '2018-10-13 02:53:41', '2018-10-13 02:53:41'),
(42, 'New Zealand', 0, '2018-10-13 02:54:21', '2018-10-13 02:54:21'),
(43, 'Mỹ', 0, '2018-10-18 04:06:42', '2018-10-18 04:06:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('vinhan16sep@gmail.com', '$2y$10$aa3z2u1C4IAkZJiWpWHGyORJf2pnZppYY26W2pNRYLD5V9jtCV3Ba', '2017-11-01 23:32:26'),
('vinhan16sep@gmail.com', '$2y$10$aa3z2u1C4IAkZJiWpWHGyORJf2pnZppYY26W2pNRYLD5V9jtCV3Ba', '2017-11-01 23:32:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_id` int(11) NOT NULL,
  `kind_id` int(11) DEFAULT NULL,
  `trademark_id` int(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  `effect` text COLLATE utf8mb4_unicode_ci,
  `concentrations` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `producer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(60,0) DEFAULT NULL,
  `selling_price` decimal(60,0) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `discount_percent` int(4) DEFAULT NULL,
  `discount_price` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gift` text COLLATE utf8mb4_unicode_ci,
  `is_discount` tinyint(1) NOT NULL DEFAULT '0',
  `is_special` tinyint(4) NOT NULL DEFAULT '0',
  `is_new` tinyint(4) NOT NULL DEFAULT '0',
  `image` text COLLATE utf8mb4_unicode_ci,
  `origin_id` int(11) DEFAULT NULL,
  `volume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` text COLLATE utf8mb4_unicode_ci,
  `year` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_gift` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `type_id`, `kind_id`, `trademark_id`, `name`, `slug`, `quantity`, `effect`, `concentrations`, `producer`, `price`, `selling_price`, `content`, `description`, `discount_percent`, `discount_price`, `gift`, `is_discount`, `is_special`, `is_new`, `image`, `origin_id`, `volume`, `capacity`, `year`, `material`, `created_at`, `updated_at`, `deleted_at`, `is_deleted`, `is_gift`) VALUES
(61, 34, 21, 29, 'Rượu Vang Đỏ Agentina Pascual Toso Malbec Reserve', 'ruou-vang-do-agentina-pascual-toso-malbec-reserve', 100, NULL, '13,8%', 'Pascual Toso vùng Mendoza Argentina', '500000', '500000', '<h2><strong>Pascual Toso Malbec Reserve -&nbsp;Th&agrave;nh quả của đam m&ecirc; v&agrave; kh&aacute;m ph&aacute;</strong></h2>\r\n<p>Rượu vang Pascual Toso Malbec Reverse l&agrave; sản phẩm của h&atilde;ng rượu v&atilde;ng Pascual Toso nổi tiếng Argentina.<br />Người s&aacute;ng lập n&ecirc;n h&atilde;ng - Pascual Toso đ&atilde; đến Argentina từ những năm 1980 từ v&ugrave;ng sản xuất rượu vang nổi tiếng của &Yacute; &ndash; Piedmont. Lớn l&ecirc;n với kh&aacute;t khao chinh phục v&agrave; th&aacute;ch thức T&acirc;n Thế Giới, cuối c&ugrave;ng &ocirc;ng đ&atilde; t&igrave;m ra v&ugrave;ng đất l&yacute; tưởng để x&acirc;y vun đắp ước mơ ch&iacute;nh l&agrave; Mendoza của Argentina.</p>\r\n<p><img src=\"//file.hstatic.net/1000180378/file/ruou_vang_do_agentina_-_pascual_toso_malbec_reserve1_grande.jpg\" /></p>\r\n<p>Pascual Toso Malbec Reverse được sản xuất từ giống nho được coi l&agrave; biểu tượng của rượu vang Argentina - giống nho Malbec c&ugrave;ng với t&acirc;m huyết đam m&ecirc; của người sống cả cuộc đời v&igrave; rượu vang.&nbsp;Để sản xuất ra sản phẩm n&agrave;y, nho Malbec được h&aacute;i cẩn thận bằng tay sau đ&oacute; được để trong những th&ugrave;ng nhỏ. Nho được &eacute;p v&agrave; l&ecirc;n men trong 48 giờ trước khi được ng&acirc;m trong c&aacute;c th&ugrave;ng kim loại trong khoảng 15-20 ng&agrave;y. Sau đ&oacute;, rượu được để trong c&aacute;c th&ugrave;ng gỗ sồi mới (80% sồi Mĩ, 20% sồi Ph&aacute;p) trong v&ograve;ng 12 th&aacute;ng trước khi được đ&oacute;ng chai. Sau đ&oacute;, nh&agrave; sản suất tiếp tục ủ c&aacute;c chai vang n&agrave;y th&ecirc;m 4 th&aacute;ng trước khi ch&iacute;nh thức đưa ra thị trường.<br /><strong>Đặc t&iacute;nh:</strong>&nbsp;Vang c&oacute; hương thơm r&otilde; n&eacute;t của vỏ qu&yacute;t kh&ocirc;, c&oacute; vương vấn một ch&uacute;t m&ugrave;i da thuộc v&agrave; vị đậm đ&agrave; s&acirc;u lắng của d&acirc;u đen. Th&ocirc;ng qua mỗi lần lắc ly, Ch&uacute;ng ta sẽ dễ d&agrave;ng cảm nhận được sự thay đổi của hương thơm v&ocirc; c&ugrave;ng uyển chuyển trong từng khoảnh khắc.<br /><strong>Kết hợp đồ ăn:</strong>&nbsp;Thịt nướng, c&aacute;c loại thịt đỏ, m&igrave; &yacute; hoặc d&ugrave;ng với c&aacute;c loại pho-m&aacute;t.<br /><strong>Lưu &yacute;:</strong>&nbsp;Cần d&ugrave;ng decanter lắc nhiều hoặc mở vang từ khoảng 1 tiếng trước khi thưởng thức. D&ugrave;ng ngon nhất ở nhiệt độ từ 15 tới 17<sup>o</sup>C.</p>', '<p><strong>Pascual Toso Malbec Reserve l&agrave; minh chứng ho&agrave;n hảo cho chất lượng của rượu vang Argentina nhưng với gi&aacute; cả v&ocirc; c&ugrave;ng phải chăng, l&agrave; lựa chọn ho&agrave;n hảo cho c&aacute;c bữa ăn h&agrave;ng ng&agrave;y cũng như c&aacute;c buổi tiệc lớn.</strong></p>', 10, '450000', NULL, 1, 1, 0, '[\"pdRWLoCsynb2YOa2lbeHvRfmGGdG4630o9z98Sxo.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', NULL, 'Giống nho: Malbec', '2018-09-25 09:35:23', '2018-10-12 04:51:57', NULL, 1, 0),
(62, 34, 21, 29, 'sp 2', 'sp-2', 100, NULL, '13,8%', 'Pascual Toso vùng Mendoza Argentina', '11111', '11111', '<p>11111</p>', '<p>11111</p>', NULL, NULL, NULL, 0, 1, 0, '[\"1bSOSRkGeNqmCDPwt8DiMfi4IggZrg4jIDWgbQpZ.jpeg\"]', 36, '750ml/chai', 'asdasd', NULL, 'Giống nho: Malbec', '2018-09-26 10:37:06', '2018-10-12 04:52:04', NULL, 1, 0),
(63, 34, 28, 40, 'Rượu Vang Đỏ Ý - Golden Cross Primitivo Salento Rosso', 'ruou-vang-do-y---golden-cross-primitivo-salento-rosso', 98, NULL, '17,5%', 'GOLDEN CROSS', '999999999', '999999999', '<p>GOLDEN CROSS được chọn lọc từ những tr&aacute;i nho Primitivo ni&ecirc;n vụ 2014 tinh t&uacute; nhất tr&ecirc;n c&aacute;nh đồng nho rộng lớn v&ugrave;ng Salento. Thu ủ v&agrave; chọn lọc ở điều kiện khắt khe trong th&ugrave;ng gồ sồi của Ph&aacute;p 12 th&aacute;ng v&agrave; 9 th&aacute;ng nằm trong chai. Bằng sự đam m&ecirc; ch&aacute;y bỏng với rượu vang v&agrave; sự tr&acirc;n trọng nghệ thuật.</p>', '<p>GOLDEN CROSS được chọn lọc từ những tr&aacute;i nho Primitivo ni&ecirc;n vụ 2014 tinh t&uacute; nhất tr&ecirc;n c&aacute;nh đồng nho rộng lớn v&ugrave;ng Salento. Thu ủ v&agrave; chọn lọc ở điều kiện khắt khe trong th&ugrave;ng gồ sồi của Ph&aacute;p 12 th&aacute;ng v&agrave; 9 th&aacute;ng nằm trong chai. Bằng sự đam m&ecirc; ch&aacute;y bỏng với rượu vang v&agrave; sự tr&acirc;n trọng nghệ thuật.</p>', 9999999, '9999999', NULL, 1, 0, 0, '[\"I9GT1Aa3P1vPg61tZx17nA7EUJ9LdjRaW61nDFHw.png\"]', 36, '750ml/chai', '750ml/chai', '2014', 'Nho Salento', '2018-10-06 08:50:19', '2018-10-12 07:28:24', NULL, 0, 0),
(64, 34, 28, 40, 'Rượu Vang Trắng Tây Ban Nha Finca De Zalamena Macabeo', 'ruou-vang-trang-tay-ban-nha-finca-de-zalamena-macabeo', 98, NULL, '12,5%', 'Bodegas Verduguez S.L', '9999999', '9999999', '<p>Finca de Zalamena Macabeo c&oacute; m&agrave;u v&agrave;ng s&aacute;ng, m&ugrave;i thơm dịu nhẹ của hoa trắng, tr&aacute;i c&acirc;y tươi v&agrave; kem, vị chua nhẹ nh&agrave;ng, tươi m&aacute;t, ph&ugrave; hợp ăn k&egrave;m với c&aacute;c loại salat, thịt heo v&agrave; c&aacute;c m&oacute;n gia vị cay.</p>', '<p>Finca de Zalamena Macabeo c&oacute; m&agrave;u v&agrave;ng s&aacute;ng, m&ugrave;i thơm dịu nhẹ của hoa trắng, tr&aacute;i c&acirc;y tươi v&agrave; kem, vị chua nhẹ nh&agrave;ng, tươi m&aacute;t, ph&ugrave; hợp ăn k&egrave;m với c&aacute;c loại salat, thịt heo v&agrave; c&aacute;c m&oacute;n gia vị cay.</p>', 10, '9999999', NULL, 1, 0, 0, '[\"8cNkCDZvmSElQnS9nO5ANPKsBJrIUBS47RY5ORUc.png\"]', 36, '750ml/chai', '750ml/chai', '2018', 'Nho Lamancha', '2018-10-06 10:14:51', '2018-10-12 07:29:11', NULL, 0, 0),
(65, 34, 28, 40, 'Rượu Vang Trắng Ý -Terre Di San Rocco - Edizione Esclusiva Limitata', 'ruou-vang-trang-y--terre-di-san-rocco---edizione-esclusiva-limitata', 99, NULL, '15,5%', 'Terre di San Rocco', '1950000', '1950000', '<p>Chai rượu vang trắng Terre di San Rocco&nbsp;l&agrave; một trong số những ấn bản độc quyền sản xuất với số lượng giới hạn của h&atilde;ng rượu vang danh tiếng Terre di San Rocco tại v&ugrave;ng Veneto, Italia. Đ&acirc;y l&agrave; chai vang trắng độc đ&aacute;o v&agrave; v&ocirc; c&ugrave;ng thanh lịch, được sản xuất theo phương ph&aacute;p truyền thống cổ xưa cực kỳ phức tạp, để tạo n&ecirc;n những hương vị của hồi ức đ&atilde; từng ch&igrave;m v&agrave;o qu&ecirc;n l&atilde;ng.</p>', '<p><strong>Chai rượu vang trắng Terre di San Rocco</strong>&nbsp;l&agrave; một trong số những ấn bản độc quyền sản xuất với số lượng giới hạn của h&atilde;ng rượu vang danh tiếng Terre di San Rocco tại v&ugrave;ng Veneto, Italia. Đ&acirc;y l&agrave; chai vang trắng độc đ&aacute;o v&agrave; v&ocirc; c&ugrave;ng thanh lịch, được sản xuất theo phương ph&aacute;p truyền thống cổ xưa cực kỳ phức tạp, để tạo n&ecirc;n những hương vị của hồi ức đ&atilde; từng ch&igrave;m v&agrave;o qu&ecirc;n l&atilde;ng.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"v4oHbC44gkK8UCqsy7MqgYQVKzdIA1EAdacPM1vC.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'Nho  Veneto', '2018-10-09 02:51:22', '2018-10-09 10:48:56', NULL, 0, 0),
(66, 34, 28, 40, 'Rượu Vang Nổ Pháp_ Sparkling Wine Chardonnay OR', 'ruou-vang-no-phap-sparkling-wine-chardonnay-or', 99, NULL, '12%', 'Rivarose SAS', '450000', '450000', '<p>Chai rượu vang Sparkling Wine Chardonnay OR&nbsp;l&agrave; một trong những chai vang nổ xuất sắc của h&atilde;ng Rivarose thuộc tập đo&agrave;n Veuve Ambal Cr&eacute;mant de Bourgogne chuy&ecirc;n sản xuất rượu vang Sparkling nổi tiếng của Ph&aacute;p. Được sản xuất ho&agrave;n to&agrave;n theo phương ph&aacute;p truyền thống cổ điển từ những tr&aacute;i nho Chardonnay được lựa chọn kỹ lưỡng bằng tay tr&ecirc;n c&aacute;c gốc nho l&acirc;u năm tại Provence, để tạo n&ecirc;n hương thơm tươi mới nhưng v&ocirc; c&ugrave;ng quyến rũ độc đ&aacute;o của Miền Nam nước Ph&aacute;p.</p>', '<p>Chai rượu vang Sparkling Wine Chardonnay OR&nbsp;l&agrave; một trong những chai vang nổ xuất sắc của h&atilde;ng Rivarose thuộc tập đo&agrave;n Veuve Ambal Cr&eacute;mant de Bourgogne chuy&ecirc;n sản xuất rượu vang Sparkling nổi tiếng của Ph&aacute;p. Được sản xuất ho&agrave;n to&agrave;n theo phương ph&aacute;p truyền thống cổ điển từ những tr&aacute;i nho Chardonnay được lựa chọn kỹ lưỡng bằng tay tr&ecirc;n c&aacute;c gốc nho l&acirc;u năm tại Provence, để tạo n&ecirc;n hương thơm tươi mới nhưng v&ocirc; c&ugrave;ng quyến rũ độc đ&aacute;o của Miền Nam nước Ph&aacute;p.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"rKYhS5juzbpScKtCm4HeXzVEyLB9PXDcqEBaghiJ.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'nho Chardonnay', '2018-10-09 02:53:51', '2018-10-09 10:48:48', NULL, 0, 0),
(67, 34, 28, 40, 'Rượu Vang Đỏ Pháp_ Beauville Lalande', 'ruou-vang-do-phap-beauville-lalande', 99, NULL, '13%', 'Couleurs D’Aquitaine', '310000', '310000', '<p><span style=\"font-weight: 400;\">Chai</span><span style=\"font-weight: 400;\">&nbsp;vang đỏ&nbsp;</span>Beauville Lalande<span style=\"font-weight: 400;\">&nbsp;được sản xuất theo phương thức pha trộn&nbsp;</span><span style=\"font-weight: 400;\">Bordeaux red blend từ những tr&aacute;i nho ngon nhất tại c&aacute;c vườn nho của khu vực T&acirc;y Nam nước Ph&aacute;p, để tạo n&ecirc;n sự h&ograve;a quyện tuyệt vời giữa hương tr&aacute;i c&acirc;y ch&iacute;n v&agrave; vị tanin tinh tế, mượt m&agrave; trong khoang miệng sau mỗi lần thưởng thức.</span></p>', '<p><span style=\"font-weight: 400;\">Chai</span><span style=\"font-weight: 400;\">&nbsp;vang đỏ&nbsp;</span>Beauville Lalande<span style=\"font-weight: 400;\">&nbsp;được sản xuất theo phương thức pha trộn&nbsp;</span><span style=\"font-weight: 400;\">Bordeaux red blend từ những tr&aacute;i nho ngon nhất tại c&aacute;c vườn nho của khu vực T&acirc;y Nam nước Ph&aacute;p, để tạo n&ecirc;n sự h&ograve;a quyện tuyệt vời giữa hương tr&aacute;i c&acirc;y ch&iacute;n v&agrave; vị tanin tinh tế, mượt m&agrave; trong khoang miệng sau mỗi lần thưởng thức.</span></p>', NULL, NULL, NULL, 0, 0, 0, '[\"E9FfuRKntwGzQmPv0IBDBbqBWMp9z2H7sUTqm7Zo.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'nho Bordeaux Blend Red', '2018-10-09 02:56:39', '2018-10-09 10:48:39', NULL, 0, 0),
(68, 34, 28, 40, 'Rượu Vang Đỏ Pháp_ Les Portes De Bordeaux', 'ruou-vang-do-phap-les-portes-de-bordeaux', 99, NULL, '13%', 'S.A.V.A.S', '310000', '310000', '<p><span style=\"font-weight: 400;\">Chai</span><span style=\"font-weight: 400;\">&nbsp;vang đỏ Les</span>&nbsp;<span style=\"font-weight: 400;\">Portes de Bordeaux 2015 l&agrave; sự pha trộn ho&agrave;n hảo giữa Merlot v&agrave; Cabernet&nbsp;</span><span style=\"font-weight: 400;\">Sauvignon tr&ecirc;n những gốc nho 30 năm tuổi của khu vực Bordeaux tạo n&ecirc;n sự h&ograve;a quyện tuyệt vời giữa hương tr&aacute;i c&acirc;y ch&iacute;n v&agrave; vị tanin quyến rũ, vấn vương trong khoang miệng sau mỗi lần thưởng thức.</span></p>', '<p><span style=\"font-weight: 400;\">Chai</span><span style=\"font-weight: 400;\">&nbsp;vang đỏ Les</span>&nbsp;<span style=\"font-weight: 400;\">Portes de Bordeaux 2015 l&agrave; sự pha trộn ho&agrave;n hảo giữa Merlot v&agrave; Cabernet&nbsp;</span><span style=\"font-weight: 400;\">Sauvignon tr&ecirc;n những gốc nho 30 năm tuổi của khu vực Bordeaux tạo n&ecirc;n sự h&ograve;a quyện tuyệt vời giữa hương tr&aacute;i c&acirc;y ch&iacute;n v&agrave; vị tanin quyến rũ, vấn vương trong khoang miệng sau mỗi lần thưởng thức.</span></p>', NULL, NULL, NULL, 0, 0, 0, '[\"gwi5j714RmGPfv149imM0iPmCTwvmZZ03tknXmkP.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'nho Bordeaux Blend Red', '2018-10-09 02:58:51', '2018-10-09 10:48:32', NULL, 0, 0),
(69, 34, 28, 40, 'Rượu Vang Trắng Pháp_ Les Portes De Bordeaux Sauvignon Blanc', 'ruou-vang-trang-phap-les-portes-de-bordeaux-sauvignon-blanc', 99, NULL, '12%', 'S.A.V.A.S', '310000', '310000', '<p><span style=\"font-weight: 400;\">Chai vang trắng Les</span>&nbsp;<span style=\"font-weight: 400;\">Portes de Bordeaux Sauvignon Blanc 2016 c&oacute; hương vị tươi m&aacute;t của chanh tươi v&agrave; bưởi pha lẫn hương thơm dịu nhẹ của tr&aacute;i đ&agrave;o ch&iacute;n, v&ocirc; c&ugrave;ng sinh động với m&agrave;u v&agrave;ng rơm &oacute;ng &aacute;nh.</span></p>', '<p><span style=\"font-weight: 400;\">Chai vang trắng Les</span>&nbsp;<span style=\"font-weight: 400;\">Portes de Bordeaux Sauvignon Blanc 2016 c&oacute; hương vị tươi m&aacute;t của chanh tươi v&agrave; bưởi pha lẫn hương thơm dịu nhẹ của tr&aacute;i đ&agrave;o ch&iacute;n, v&ocirc; c&ugrave;ng sinh động với m&agrave;u v&agrave;ng rơm &oacute;ng &aacute;nh.</span></p>', NULL, NULL, NULL, 0, 0, 0, '[\"zzGdhMc2ZwyzjAcCOvnxo1UuzVmegx3jR6M2KafS.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'nho Sauvignon Blanc', '2018-10-09 03:00:28', '2018-10-09 10:48:13', NULL, 0, 0),
(70, 34, 28, 40, 'Rượu Vang Đỏ Chile - Chaku Cabernet Sauvignon 2015', 'ruou-vang-do-chile---chaku-cabernet-sauvignon-2015', 99, NULL, '13,5%', 'Chaku Cabernet Sauvignon', '235000', '235000', '<h1><strong>Chaku Cabernet Sauvignon 2015</strong>&nbsp;<span style=\"font-weight: 400;\">C&oacute; M&agrave;u Đỏ Đậm Của&nbsp;Cherry Den, L&yacute; Đen, D&acirc;u Đen Ch&iacute;n Mọng H&ograve;a Quyện C&ugrave;ng Hương Ti&ecirc;u Đen, X&igrave; G&agrave; V&agrave; Thoảng Hương Của Vanilla Hoa Violet. Ngo&agrave;i Ra Do Đ</span><span style=\"font-weight: 400;\">ược Ủ Trong Th&ugrave;ng Gỗ Sồi Ph&aacute;p N&ecirc;n Chaku Cabernet Sauvignon V&ocirc; C&ugrave;ng Quyến Rũ Với M&ugrave;i Gỗ Tuyết T&ugrave;ng V&agrave; C&oacute; Sự C&acirc;n Bằng Giữa Vị Ch&aacute;t V&agrave; Vị Ngọt Trong V&ograve;m Miệng.</span></h1>', '<h1><strong>Chaku Cabernet Sauvignon 2015</strong>&nbsp;<span style=\"font-weight: 400;\">C&oacute; M&agrave;u Đỏ Đậm Của&nbsp;Cherry Den, L&yacute; Đen, D&acirc;u Đen Ch&iacute;n Mọng H&ograve;a Quyện C&ugrave;ng Hương Ti&ecirc;u Đen, X&igrave; G&agrave; V&agrave; Thoảng Hương Của Vanilla Hoa Violet. Ngo&agrave;i Ra Do Đ</span><span style=\"font-weight: 400;\">ược Ủ Trong Th&ugrave;ng Gỗ Sồi Ph&aacute;p N&ecirc;n Chaku Cabernet Sauvignon V&ocirc; C&ugrave;ng Quyến Rũ Với M&ugrave;i Gỗ Tuyết T&ugrave;ng V&agrave; C&oacute; Sự C&acirc;n Bằng Giữa Vị Ch&aacute;t V&agrave; Vị Ngọt Trong V&ograve;m Miệng.</span></h1>', NULL, NULL, NULL, 0, 0, 0, '[\"2CxUXxF6VMRIOtfmkNTteqaAyrq7Pdy283Bn580N.png\"]', 36, '750ml/chai', '750ml/chai', '2015', 'nho  Cabernet Sauvignon', '2018-10-09 03:03:13', '2018-10-09 10:47:59', NULL, 0, 0),
(71, 34, 28, 40, 'Rượu Vang Ý - 125 Primitivo Del Salento 12,5%', 'ruou-vang-y---125-primitivo-del-salento-125', 99, NULL, '12.5%', 'Primitivo Del Salento', '395000', '395000', '<p><strong>125 Primitivo</strong>&nbsp;sở hữu m&agrave;u đỏ ruby sang trọng, với hương thơm m&atilde;nh liệt, nổi bật l&agrave; hương mận ch&iacute;n, l&aacute; thuốc, mứt, anh đ&agrave;o, ca cao. Hương vị hơi cay pha trộn giữa valina v&agrave; cacao. Trong v&ograve;m miệng, 125 Primitivo mang lại hương vị mượt m&agrave; v&agrave; gi&agrave;u tanni</p>', '<p><strong>125 Primitivo</strong>&nbsp;sở hữu m&agrave;u đỏ ruby sang trọng, với hương thơm m&atilde;nh liệt, nổi bật l&agrave; hương mận ch&iacute;n, l&aacute; thuốc, mứt, anh đ&agrave;o, ca cao. Hương vị hơi cay pha trộn giữa valina v&agrave; cacao. Trong v&ograve;m miệng, 125 Primitivo mang lại hương vị mượt m&agrave; v&agrave; gi&agrave;u tanni</p>', NULL, NULL, NULL, 0, 0, 0, '[\"Hf9AlL5yw9SJ3lWYCXDfX0aGodELdpisboXIAtYR.jpeg\"]', 36, '750ml/chai', '750 ml', '2018', 'nho  Primitivo', '2018-10-09 03:05:27', '2018-10-09 10:47:51', NULL, 0, 0),
(72, 34, 28, 40, 'Rượu Vang Đỏ Ý - VICTORY 2015', 'ruou-vang-do-y---victory-2015', 99, NULL, '14%', 'Feudi Salentini', '850000', '850000', '<p>Chai rượu vang Victrory được lấy cảm hứng từ tinh thần chiến đấu dũng m&atilde;nh của những chiến binh Sparta tinh nhuệ lu&ocirc;n quyết t&acirc;m vượt qua mọi thử th&aacute;ch, như một sự cổ vũ của nh&agrave; sản xuất gửi đến kh&aacute;ch h&agrave;ng lời ch&uacute;c th&agrave;nh c&ocirc;ng v&agrave; ng&agrave;y c&agrave;ng ph&aacute;t triển với tinh thần Sparta mạnh mẽ.&nbsp;<em><strong>L&agrave; d&ograve;ng sản phẩm đặc biệt d&agrave;nh cho thị trường Việt Nam v&agrave;o th&aacute;ng 10.2017</strong></em></p>', '<p>Chai rượu vang Victrory được lấy cảm hứng từ tinh thần chiến đấu dũng m&atilde;nh của những chiến binh Sparta tinh nhuệ lu&ocirc;n quyết t&acirc;m vượt qua mọi thử th&aacute;ch, như một sự cổ vũ của nh&agrave; sản xuất gửi đến kh&aacute;ch h&agrave;ng lời ch&uacute;c th&agrave;nh c&ocirc;ng v&agrave; ng&agrave;y c&agrave;ng ph&aacute;t triển với tinh thần Sparta mạnh mẽ.&nbsp;<em><strong>L&agrave; d&ograve;ng sản phẩm đặc biệt d&agrave;nh cho thị trường Việt Nam v&agrave;o th&aacute;ng 10.2017</strong></em></p>', NULL, NULL, NULL, 0, 0, 0, '[\"EwiFVYl3zAyqAAWkJQgH7yFILmsuPqEWFLtJHjW6.png\"]', 36, '750ml/chai', '750ml/chai', '2015', 'nho  Primitivo', '2018-10-09 03:07:43', '2018-10-09 10:47:39', NULL, 0, 0),
(73, 34, 28, 40, 'Rượu Vang Đỏ Ý - Pievi San Vito Bardolino Classico 2015', 'ruou-vang-do-y---pievi-san-vito-bardolino-classico-2015', 99, NULL, '13%', 'Tinazzi', '850000', '850000', '<p><span style=\"color: #800000;\"><strong>Pievi San Vito&nbsp;</strong></span><span style=\"color: #800000;\"><strong>Bardolino Classico 2015</strong></span>&nbsp;c&oacute; h&igrave;nh thức mạng mẽ, sang trọng c&ugrave;ng hương thơm tr&aacute;i c&acirc;y tinh tế của d&acirc;u t&acirc;y, anh đ&agrave;o, m&acirc;m x&ocirc;i h&ograve;a quyện c&ugrave;ng hương thơm của quế, đinh hương, ti&ecirc;u đen,... dể d&agrave;ng kết hợp với nhiều m&oacute;n ăn, đặc biệt l&agrave; cơm &Yacute;, thịt gia cầm v&agrave; c&aacute; nước ngọt.</p>', '<p><span style=\"color: #800000;\"><strong>Pievi San Vito&nbsp;</strong></span><span style=\"color: #800000;\"><strong>Bardolino Classico 2015</strong></span>&nbsp;c&oacute; h&igrave;nh thức mạng mẽ, sang trọng c&ugrave;ng hương thơm tr&aacute;i c&acirc;y tinh tế của d&acirc;u t&acirc;y, anh đ&agrave;o, m&acirc;m x&ocirc;i h&ograve;a quyện c&ugrave;ng hương thơm của quế, đinh hương, ti&ecirc;u đen,... dể d&agrave;ng kết hợp với nhiều m&oacute;n ăn, đặc biệt l&agrave; cơm &Yacute;, thịt gia cầm v&agrave; c&aacute; nước ngọt.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"X6wqE8KRASnTkolU71ZHJwoullnHHSQBwTWSfTpd.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2015', 'nho Corvina, Molinara, Rondinella, Rossara', '2018-10-09 04:19:40', '2018-10-09 10:47:31', NULL, 0, 0),
(74, 34, 28, 40, 'Rượu Vang Đỏ Ý - Ripa Magna Corvina 2015', 'ruou-vang-do-y---ripa-magna-corvina-2015', 99, NULL, '14%', 'Tinazzi', '995000', '995000', '<p><span style=\"color: #800000;\"><strong>Ripa Magna Corvina 2015</strong></span><span style=\"font-weight: 400;\">&nbsp;l&agrave; chai rượu vang được sản xuất từ những tr&aacute;i nho Corvina ngon nhất của khu vực Verona IGT bởi h&atilde;ng rượu vang Tinazzi danh tiếng bậc nhất v&ugrave;ng Đ&ocirc;ng Bắc &Yacute;. Với m&agrave;u hồng ngọc mạnh mẽ c&ugrave;ng hương thơm đặc trưng của tr&aacute;i c&acirc;y tươi ch&iacute;n đỏ kết hợp với c&aacute;c loại gia vị như đinh hương ,quế, ti&ecirc;u đen,... khi uống v&agrave;o cảm gi&aacute;c ch&aacute;t nhưng vẫn tạo cảm gi&aacute;c mềm mại, mượt m&agrave; với nồng độ tanin cao lưu luyến trong v&ograve;m miệng.</span></p>', '<p><span style=\"color: #800000;\"><strong>Ripa Magna Corvina 2015</strong></span><span style=\"font-weight: 400;\">&nbsp;l&agrave; chai rượu vang được sản xuất từ những tr&aacute;i nho Corvina ngon nhất của khu vực Verona IGT bởi h&atilde;ng rượu vang Tinazzi danh tiếng bậc nhất v&ugrave;ng Đ&ocirc;ng Bắc &Yacute;. Với m&agrave;u hồng ngọc mạnh mẽ c&ugrave;ng hương thơm đặc trưng của tr&aacute;i c&acirc;y tươi ch&iacute;n đỏ kết hợp với c&aacute;c loại gia vị như đinh hương ,quế, ti&ecirc;u đen,... khi uống v&agrave;o cảm gi&aacute;c ch&aacute;t nhưng vẫn tạo cảm gi&aacute;c mềm mại, mượt m&agrave; với nồng độ tanin cao lưu luyến trong v&ograve;m miệng.</span></p>', NULL, NULL, NULL, 0, 0, 0, '[\"Do8zGub1gLc1XjQAbvLI7N1bev1OV5zwvRUzEd69.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2015', 'nho Corvina', '2018-10-09 04:22:10', '2018-10-09 10:47:19', NULL, 0, 0),
(75, 34, 28, 40, 'Rượu Vang Trắng Ý C\'era Una Volta Riesling', 'ruou-vang-trang-y-cera-una-volta-riesling', 99, NULL, '12.5%', 'Losito Guarini', '450000', '450000', '<p>Rượu c&oacute; m&agrave;u v&agrave;ng rơm tươi m&aacute;t v&agrave; bật, với m&ugrave;i thơm hương hoa, m&ugrave;i tr&aacute;i c&acirc;y tươi của đ&agrave;o, l&ecirc;, mai. Ngay khi tiếp x&uacute;c với khoang miệng vị chua nhẹ nổi l&ecirc;n, l&agrave;m mới v&ograve;m miệng v&agrave; l&agrave;m sắc b&eacute;n bộ n&atilde;o, k&iacute;ch th&iacute;ch vị gi&aacute;c n&ecirc;n ph&ugrave; hợp để d&ugrave;ng khai vị v&agrave; d&ugrave;ng k&egrave;m c&aacute;c m&oacute;n ăn nhẹ.</p>\r\n<p>&nbsp;</p>', '<p>Rượu c&oacute; m&agrave;u v&agrave;ng rơm tươi m&aacute;t v&agrave; bật, với m&ugrave;i thơm hương hoa, m&ugrave;i tr&aacute;i c&acirc;y tươi của đ&agrave;o, l&ecirc;, mai. Ngay khi tiếp x&uacute;c với khoang miệng vị chua nhẹ nổi l&ecirc;n, l&agrave;m mới v&ograve;m miệng v&agrave; l&agrave;m sắc b&eacute;n bộ n&atilde;o, k&iacute;ch th&iacute;ch vị gi&aacute;c n&ecirc;n ph&ugrave; hợp để d&ugrave;ng khai vị v&agrave; d&ugrave;ng k&egrave;m c&aacute;c m&oacute;n ăn nhẹ.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"4SBpx5JsEXqk1WlG9NTTjIvger5iqlIesBydj261.jpeg\"]', 36, '750ml/chai', '750ml', '2018', 'nho Riesling Italico', '2018-10-09 04:23:25', '2018-10-09 10:47:08', NULL, 0, 0),
(76, 34, 28, 40, 'Rượu Vang Đỏ Ý C\'era Una Volta Bonarda', 'ruou-vang-do-y-cera-una-volta-bonarda', 99, NULL, '12.5%', 'Losito Guarini', '450000', '450000', '<p>C\'era una Volta Bonardaki nổi bật với m&agrave;u đỏ ruby ​​tinh tế v&agrave; mang hương vị tr&aacute;i c&acirc;y như cherry đen v&agrave; hạnh nh&acirc;n. Ngay khi tiếp x&uacute;c với khoang miệng, vị ch&aacute;t trong rượu nhẹ nh&agrave;ng nổi l&ecirc;n, tiếp đ&oacute; l&agrave; vị ngọt v&agrave; chua nhẹ, k&iacute;ch th&iacute;ch vị gi&aacute;c. Đặc biệt, hậu vị c&ograve;n đọng lại hương vị tươi mới r&otilde; n&eacute;t. Kết th&uacute;c ly rượu, hương thơm hoa hồng vẫn c&ograve;n thoang thoảng.</p>', '<p>C\'era una Volta Bonardaki nổi bật với m&agrave;u đỏ ruby ​​tinh tế v&agrave; mang hương vị tr&aacute;i c&acirc;y như cherry đen v&agrave; hạnh nh&acirc;n. Ngay khi tiếp x&uacute;c với khoang miệng, vị ch&aacute;t trong rượu nhẹ nh&agrave;ng nổi l&ecirc;n, tiếp đ&oacute; l&agrave; vị ngọt v&agrave; chua nhẹ, k&iacute;ch th&iacute;ch vị gi&aacute;c. Đặc biệt, hậu vị c&ograve;n đọng lại hương vị tươi mới r&otilde; n&eacute;t. Kết th&uacute;c ly rượu, hương thơm hoa hồng vẫn c&ograve;n thoang thoảng.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"mEFA1qal65NpRa87DXjBSpXMEEPBjhtbUzN9r0lo.jpeg\"]', 36, '750ml/chai', '750ml', '2018', 'nho  Croatina', '2018-10-09 04:24:47', '2018-10-09 10:46:58', NULL, 0, 0),
(77, 34, 28, 40, 'Rượu Vang Đỏ Ý Tinazzi Ca\' De\' Rocchi La Bastia 2010', 'ruou-vang-do-y-tinazzi-ca-de-rocchi-la-bastia-2010', 99, NULL, '15%', 'Tinazzi', '2500000', '2500000', '<p><span style=\"color: #800000;\"><strong>Rượu vang đỏ &Yacute; Tinazzi Ca\' de\' Rocchi La Bastia 2010</strong></span>&nbsp;- D&ograve;ng rượu vang nổi tiếng v&agrave; cao qu&yacute; bậc nhất của Veneto. Đoạt giải v&agrave;ng từ Giải thưởng rượu vang thế giới v&agrave; giải Bạc từ Th&aacute;ch thức Rượu Quốc Tế. Thang điểm trong c&aacute;c sự kiện tasting tr&ecirc;n thế giới dao động từ 86 đến 90 điểm trong hai năm 2015 v&agrave; 2016.</p>', '<p><span style=\"color: #800000;\"><strong>Rượu vang đỏ &Yacute; Tinazzi Ca\' de\' Rocchi La Bastia 2010</strong></span>&nbsp;- D&ograve;ng rượu vang nổi tiếng v&agrave; cao qu&yacute; bậc nhất của Veneto. Đoạt giải v&agrave;ng từ Giải thưởng rượu vang thế giới v&agrave; giải Bạc từ Th&aacute;ch thức Rượu Quốc Tế. Thang điểm trong c&aacute;c sự kiện tasting tr&ecirc;n thế giới dao động từ 86 đến 90 điểm trong hai năm 2015 v&agrave; 2016.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"3M2bkBhAKqT8cgl2Ls1GVVwMLJazVob27D4U0iSM.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2010', 'nho Corvina, Molinara, Rondinella', '2018-10-09 04:26:27', '2018-10-09 10:46:47', NULL, 0, 0),
(78, 34, 28, 40, 'Rượu Vang Đỏ Pháp Château Guillemin La Gaffelière', 'ruou-vang-do-phap-chateau-guillemin-la-gaffeliere', 99, NULL, '14.5%', 'Vignobles Fompérier', '1390000', '1390000', '<p><span style=\"font-weight: 400; font-size: 11pt;\"><span style=\"color: #800000;\"><strong>Rượu vang Ch&acirc;teau Guillemin La Gaffeli&egrave;re</strong></span></span><span style=\"font-weight: 400;\">&nbsp;được sản xuất chủ yếu từ Merlot v&agrave; Cabernet Franc n&ecirc;n c&oacute; cấu tr&uacute;c tannin phong ph&uacute;, thanh lịch với vị ch&aacute;t kh&ocirc;ng qu&aacute; gắt, tạo cảm gi&aacute;c mềm mượt, s&acirc;u lắng nổi bật trong khoang miệng. Đồng thời c&oacute; sự c&acirc;n bằng bởi hương thơm h&agrave;i h&ograve;a của anh đ&agrave;o, quả ch&iacute;n đen, hương socola v&agrave; gia vị ngọt, hương thuốc l&aacute; v&agrave; tuyết t&ugrave;ng đ&atilde; đạt được sự ch&iacute;n muồi theo thời gian. Guillemin La Gaffeli&egrave;re c&ograve;n c&oacute; hương vị kho&aacute;ng chất tuyệt vời do c&aacute;c c&acirc;y nho được trồng tại ba khu vực đất kh&aacute;c nhau: đất đ&aacute; v&ocirc;i, đất s&eacute;t v&agrave; c&aacute;t g&oacute;p phần tạo n&ecirc;n phức hợp hương thơm đa dạng v&agrave; tinh tế cho chai rượu vang n&agrave;y.</span></p>', '<p><span style=\"font-weight: 400; font-size: 11pt;\"><span style=\"color: #800000;\"><strong>Rượu vang Ch&acirc;teau Guillemin La Gaffeli&egrave;re</strong></span></span><span style=\"font-weight: 400;\">&nbsp;được sản xuất chủ yếu từ Merlot v&agrave; Cabernet Franc n&ecirc;n c&oacute; cấu tr&uacute;c tannin phong ph&uacute;, thanh lịch với vị ch&aacute;t kh&ocirc;ng qu&aacute; gắt, tạo cảm gi&aacute;c mềm mượt, s&acirc;u lắng nổi bật trong khoang miệng. Đồng thời c&oacute; sự c&acirc;n bằng bởi hương thơm h&agrave;i h&ograve;a của anh đ&agrave;o, quả ch&iacute;n đen, hương socola v&agrave; gia vị ngọt, hương thuốc l&aacute; v&agrave; tuyết t&ugrave;ng đ&atilde; đạt được sự ch&iacute;n muồi theo thời gian. Guillemin La Gaffeli&egrave;re c&ograve;n c&oacute; hương vị kho&aacute;ng chất tuyệt vời do c&aacute;c c&acirc;y nho được trồng tại ba khu vực đất kh&aacute;c nhau: đất đ&aacute; v&ocirc;i, đất s&eacute;t v&agrave; c&aacute;t g&oacute;p phần tạo n&ecirc;n phức hợp hương thơm đa dạng v&agrave; tinh tế cho chai rượu vang n&agrave;y.</span></p>', NULL, NULL, NULL, 0, 0, 0, '[\"dwVKC4qwGivSgxhOdy6TkCj2x4cbrlwa0YwGz1MA.jpeg\"]', 36, '750ml/chai', '750 ml/chai', '2011', 'nho Merlot , Cabernet Franc, Cabernet Sauvignon, Malbec', '2018-10-09 04:28:02', '2018-10-09 10:46:38', NULL, 0, 0),
(79, 34, 28, 40, 'Rượu Vang Đỏ Ý - Megale 2015', 'ruou-vang-do-y---megale-2015', 99, NULL, '14%', 'Tinazzi', '395000', '395000', '<p>Rượu vang Megale 2015 của Tinazzi tượng trưng cho nền văn h&oacute;a cổ đại v&ugrave;ng Salento. V&ugrave;ng đất gắn liền với những huyền thoại cổ xưa, những t&agrave;n t&iacute;ch của người Hy Lạp v&agrave; La M&atilde; cổ. Với m&agrave;u đỏ m&atilde;nh liệt v&agrave; hương tr&aacute;i c&acirc;y đậm đ&agrave;, Megale như mang trong m&igrave;nh cả một huyền thoại của v&ugrave;ng Salento h&ugrave;ng vĩ.</p>', '<p>Rượu vang Megale 2015 của Tinazzi tượng trưng cho nền văn h&oacute;a cổ đại v&ugrave;ng Salento. V&ugrave;ng đất gắn liền với những huyền thoại cổ xưa, những t&agrave;n t&iacute;ch của người Hy Lạp v&agrave; La M&atilde; cổ. Với m&agrave;u đỏ m&atilde;nh liệt v&agrave; hương tr&aacute;i c&acirc;y đậm đ&agrave;, Megale như mang trong m&igrave;nh cả một huyền thoại của v&ugrave;ng Salento h&ugrave;ng vĩ.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"erEkKUhxwTh0w4e9cgsWpqznHBD4jb4KHwuNewfG.jpeg\"]', 36, '750ml/chai', '750ml', '2015', 'nho 100% Negroamaro vùng Salento', '2018-10-09 04:29:42', '2018-10-09 10:46:23', NULL, 0, 0),
(80, 34, 28, 40, 'Rượu Vang Đỏ Chile - Cantoalba Cabernet Sauvignon 2015', 'ruou-vang-do-chile---cantoalba-cabernet-sauvignon-2015', 99, NULL, '14%', 'La Ronciere', '320000', '320000', '<p>Cantoalba Cabernet Sauvignon c&oacute; m&agrave;u đỏ đậm, hương vị tr&aacute;i c&acirc;y ch&iacute;n đỏ v&agrave; tr&aacute;i Cherry ch&iacute;n mọng, thoảng vị cam thảo. Khi nhấp một ngụm sẽ cảm nhận được hương vị tươi m&aacute;t xen lẫn vị tannin mềm mượt.</p>', '<p>Cantoalba Cabernet Sauvignon c&oacute; m&agrave;u đỏ đậm, hương vị tr&aacute;i c&acirc;y ch&iacute;n đỏ v&agrave; tr&aacute;i Cherry ch&iacute;n mọng, thoảng vị cam thảo. Khi nhấp một ngụm sẽ cảm nhận được hương vị tươi m&aacute;t xen lẫn vị tannin mềm mượt.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"7rzVAQhULPe6JbAdSaUUD0iBDR4NXCkLImk0dlnJ.jpeg\"]', 36, '750ml/chai', '750ml', '2015', 'Nho Cabernet Sauvignon', '2018-10-09 04:33:04', '2018-10-09 10:46:15', NULL, 0, 0),
(81, 34, 28, 40, 'Hộp Da Đôi Đặc Biệt - Hãng Cantine Tinazzi', 'hop-da-doi-dac-biet---hang-cantine-tinazzi', 99, NULL, '13,5%', 'Cantine Tinazzi', '375000', '375000', '<p>Hộp đựng rượu vang đ&ocirc;i đặc biệt sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng h&atilde;ng Cantine Tinazzi - Đặc biệt th&iacute;ch hợp cho cặp vang cao cấp, thể hiện đẳng cấp v&agrave; sự hiểu biết của người tặng</p>', '<p>Hộp đựng rượu vang đ&ocirc;i đặc biệt sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng h&atilde;ng Cantine Tinazzi - Đặc biệt th&iacute;ch hợp cho cặp vang cao cấp, thể hiện đẳng cấp v&agrave; sự hiểu biết của người tặng</p>', NULL, NULL, NULL, 0, 0, 0, '[\"JgtUdH0F52GH0nadBUR5sO57hG72NM04F15HsAII.jpeg\"]', 36, '750ml/chai', '36x25x13 cm', '2018', 'nho Catine', '2018-10-09 04:37:07', '2018-10-09 10:45:58', NULL, 0, 0),
(82, 34, 28, 40, 'Rượu Vang Đỏ Tây Ban Nha - 1.868 Bodega Los Aljibes 2014', 'ruou-vang-do-tay-ban-nha---1868-bodega-los-aljibes-2014', 99, NULL, '14.5%', 'Bodega Los Aljibes', '850000', '850000', '<p>Rượu vang đỏ 1868 c&oacute; mầu đỏ đậm, l&agrave; chai rượu mang đầy đủ hương thơm phức hợp của m&ugrave;i cafe hoang d&atilde;, m&ugrave;i hạnh nh&acirc;n, l&aacute; x&igrave; g&agrave;, v&agrave; m&ugrave;i gia vị. N&oacute; được sản xuất từ những tr&aacute;i nho của những c&acirc;y nho được trồng ở độ cao tr&ecirc;n 900m, v&agrave; được ủ 8 th&aacute;ng trong th&ugrave;ng gỗ sồi</p>', '<p>Rượu vang đỏ 1868 c&oacute; mầu đỏ đậm, l&agrave; chai rượu mang đầy đủ hương thơm phức hợp của m&ugrave;i cafe hoang d&atilde;, m&ugrave;i hạnh nh&acirc;n, l&aacute; x&igrave; g&agrave;, v&agrave; m&ugrave;i gia vị. N&oacute; được sản xuất từ những tr&aacute;i nho của những c&acirc;y nho được trồng ở độ cao tr&ecirc;n 900m, v&agrave; được ủ 8 th&aacute;ng trong th&ugrave;ng gỗ sồi</p>', NULL, NULL, NULL, 0, 0, 0, '[\"RMeWTyocJsQRxmRQKSP1sk7Pg7lKlgQEVLo48dJP.jpeg\"]', 36, '750ml/chai', '750ml', '2014', 'Nho Tempranillo, nho Cabernet Sauvignon, Petit Verdot, Garnacha Tintorera', '2018-10-09 04:38:28', '2018-10-09 10:45:52', NULL, 0, 0),
(83, 34, 28, 40, 'Rượu Vang Ngọt Hungary - Tokaji Aszú 3', 'ruou-vang-ngot-hungary---tokaji-aszu-3', 99, NULL, '12%', 'Patricius Tokaj - Hungary', '555000', '555000', '<p>Rượu vang Tokaji nổi tiếng l&agrave; rượu vang tr&aacute;ng miệng ngon nhất h&agrave;nh tinh với danh hiệu \"Vang của c&aacute;c nh&agrave; vua\" do vua Luis 14 của Ph&aacute;p phong tặng, Tokaji Asz&uacute; 3 được sản xuất theo phương ph&aacute;p đặc biệt của rượu vang Hungary.</p>', '<p>Rượu vang Tokaji nổi tiếng l&agrave; rượu vang tr&aacute;ng miệng ngon nhất h&agrave;nh tinh với danh hiệu \"Vang của c&aacute;c nh&agrave; vua\" do vua Luis 14 của Ph&aacute;p phong tặng, Tokaji Asz&uacute; 3 được sản xuất theo phương ph&aacute;p đặc biệt của rượu vang Hungary.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"BNKsjFO5Vljm50vZvyslY6e6xD0ahayfb4bskvJd.jpeg\"]', 36, '500ml', '500ml', '2018', 'nho Furmint và Hárslevelu', '2018-10-09 04:40:02', '2018-10-09 10:45:45', NULL, 0, 0),
(84, 34, 28, 40, 'Rượu Vang Đỏ Chile - Gran Reserva: Cabernet Sauvignon', 'ruou-vang-do-chile---gran-reserva-cabernet-sauvignon', 99, NULL, '14.5%', 'Santa Carolina - Chile', '1000000', '1000000', '<p><strong>Rượu vang&nbsp;Gran Reserva: Cabernet Sauvignon của h&atilde;ng&nbsp;Santa Carolina danh tiếng với hơn 140 năm lịch sử - l&agrave; một trong những sản phẩm tuyệt vời đến từ Chile.</strong></p>', '<p><strong>Rượu vang&nbsp;Gran Reserva: Cabernet Sauvignon của h&atilde;ng&nbsp;Santa Carolina danh tiếng với hơn 140 năm lịch sử - l&agrave; một trong những sản phẩm tuyệt vời đến từ Chile.</strong></p>', NULL, NULL, NULL, 0, 0, 0, '[\"cIGEZPA1BFDMMVeP96yDxWYUC2u8h9i0kM3VpvU6.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'nho Cabernet Sauvignon tại thung lũng Maipo, Chile', '2018-10-09 04:42:01', '2018-10-09 10:45:32', NULL, 0, 0),
(85, 34, 28, 40, 'Rượu Vang Ngọt Ý - Queen Bee', 'ruou-vang-ngot-y---queen-bee', 98, NULL, '10%', 'Casa Vinicola Caldirola - Italy', '235000', '235000', '<p>Rượu vang ngọt Queen Bee được l&agrave;m ra bởi nh&agrave; sản xuất rượu vang danh tiếng bậc nhất nước &Yacute; -&nbsp;Casa Vinicola Caldirola&nbsp;d&agrave;nh ri&ecirc;ng cho thị trường Việt Nam.&nbsp;Chai vang c&oacute;&nbsp;hương vị d&acirc;u t&acirc;y l&agrave;m chủ đạo, nồng độ cồn thấp, v&agrave; vị ngọt thanh tho&aacute;t tự nhi&ecirc;n v&ocirc; c&ugrave;ng dễ uống.</p>', '<p>Rượu vang ngọt Queen Bee được l&agrave;m ra bởi nh&agrave; sản xuất rượu vang danh tiếng bậc nhất nước &Yacute; -&nbsp;Casa Vinicola Caldirola&nbsp;d&agrave;nh ri&ecirc;ng cho thị trường Việt Nam.&nbsp;Chai vang c&oacute;&nbsp;hương vị d&acirc;u t&acirc;y l&agrave;m chủ đạo, nồng độ cồn thấp, v&agrave; vị ngọt thanh tho&aacute;t tự nhi&ecirc;n v&ocirc; c&ugrave;ng dễ uống.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"gE824r1HBKB5RiFOFYiN96EjpHW5OBhgQ0eohyZp.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'Nho  Veneto', '2018-10-09 04:43:27', '2018-10-09 10:45:21', NULL, 0, 0),
(86, 34, 28, 40, 'Rượu Vang Đỏ Ý - Collezione Cinquanta', 'ruou-vang-do-y---collezione-cinquanta', 99, NULL, '15%', 'Cantine Sanmarzano - Italy', '2000000', '2000000', '<h2><span style=\"color: #000000;\">Rượu vang Collezione Cinquanta l&agrave; một trong những sản phẩm rượu vang &Yacute; nổi bật của v&ugrave;ng Salento - Italy. Chai vang được phối hợp từ nhiều giống nho kh&aacute;c nhau dưới b&agrave;n tay t&agrave;i t&igrave;nh của nh&agrave; sản xuất&nbsp;<a style=\"color: #000000;\" href=\"http://wineplaza.vn/puglia-cung-ruou-vang-cantine-san-mazano.html\" data-cke-saved-href=\"http://wineplaza.vn/puglia-cung-ruou-vang-cantine-san-mazano.html\">San Marzano</a>.</span></h2>', '<h2><span style=\"color: #000000;\">Rượu vang Collezione Cinquanta l&agrave; một trong những sản phẩm rượu vang &Yacute; nổi bật của v&ugrave;ng Salento - Italy. Chai vang được phối hợp từ nhiều giống nho kh&aacute;c nhau dưới b&agrave;n tay t&agrave;i t&igrave;nh của nh&agrave; sản xuất&nbsp;<a style=\"color: #000000;\" href=\"http://wineplaza.vn/puglia-cung-ruou-vang-cantine-san-mazano.html\" data-cke-saved-href=\"http://wineplaza.vn/puglia-cung-ruou-vang-cantine-san-mazano.html\">San Marzano</a>.</span></h2>', NULL, NULL, NULL, 0, 0, 0, '[\"EMj0hnBiOybiSLgXNbDAvsXBwogdIZn2m1prq4uw.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'Các giống nho địa phương vùng Salento - Italy', '2018-10-09 04:44:55', '2018-10-09 10:45:08', NULL, 0, 0),
(87, 34, 28, 40, 'Hộp Da Đôi Đặc Biệt - Hãng Feudi Salentini', 'hop-da-doi-dac-biet---hang-feudi-salentini', 99, NULL, '13%', 'Feudi Salentini', '375000', '375000', '<h2><span style=\"font-size: 10pt;\">Hộp đựng rượu vang đ&ocirc;i đặc biệt sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Feudi Salentini - Đặc biệt th&iacute;ch hợp cho cặp vang cao cấp, thể hiện đẳng cấp v&agrave; sự hiểu biết của người tặng.</span></h2>', '<h2><span style=\"font-size: 10pt;\">Hộp đựng rượu vang đ&ocirc;i đặc biệt sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Feudi Salentini - Đặc biệt th&iacute;ch hợp cho cặp vang cao cấp, thể hiện đẳng cấp v&agrave; sự hiểu biết của người tặng.</span></h2>', NULL, NULL, NULL, 0, 0, 0, '[\"vD62LxMKSkglTn9oIKo91uc9Yv5CjrAnKX22JuNK.jpeg\"]', 36, '750ml/chai', '36x25x13 cm', '2018', 'nho Feudi Salentini', '2018-10-09 04:46:30', '2018-10-09 10:44:57', NULL, 0, 0),
(88, 34, 28, 40, 'Hộp Da Đơn Đặc Biệt - Hãng Feudi Salentini', 'hop-da-don-dac-biet---hang-feudi-salentini', 99, NULL, '13%', 'Feudi Salentini', '350000', '350000', '<p><strong>Hộp đựng rượu vang đặc biệt sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Feudi Salentini. Th&iacute;ch hợp cho c&aacute;c chai vang cao cấp, thể hiện đẳng cấp tinh tế của người tặng</strong></p>', '<p><strong>Hộp đựng rượu vang đặc biệt sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Feudi Salentini. Th&iacute;ch hợp cho c&aacute;c chai vang cao cấp, thể hiện đẳng cấp tinh tế của người tặng</strong></p>', NULL, NULL, NULL, 0, 0, 0, '[\"ZBwgZ0nMUWKyY3EN8sTgDiXTeo1cHsJLW0PkN8NP.jpeg\"]', 36, '750ml/chai', '750ml', '2018', 'nho Feudi Salentini', '2018-10-09 04:47:52', '2018-10-09 10:44:44', NULL, 0, 0),
(89, 34, 28, 40, 'Hộp Da Đơn - Hãng Feudi Salentini', 'hop-da-don---hang-feudi-salentini', 99, NULL, '13%', 'Cantine Sanmarzano - Italy', '300000', '300000', '<h2>Hộp đựng rượu vang với phong c&aacute;ch cổ điển, sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Feudi Salentini l&agrave; m&oacute;n qu&agrave; ho&agrave;n hảo để tặng những người th&acirc;n, bạn b&egrave; v&agrave; l&atilde;nh đạo trong c&aacute;c dịp lễ thể hiện đẳng cấp tinh tế của người tặng</h2>', '<h2>Hộp đựng rượu vang với phong c&aacute;ch cổ điển, sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Feudi Salentini l&agrave; m&oacute;n qu&agrave; ho&agrave;n hảo để tặng những người th&acirc;n, bạn b&egrave; v&agrave; l&atilde;nh đạo trong c&aacute;c dịp lễ thể hiện đẳng cấp tinh tế của người tặng</h2>', NULL, NULL, NULL, 0, 0, 0, '[\"9Ne5V2EUGK57cSnixSLKHv3gLSb6GEpu58E9G1w5.jpeg\"]', 36, '750ml/chai', '750ml', '2018', 'Nho  Veneto', '2018-10-09 08:18:40', '2018-10-09 10:44:33', NULL, 0, 0),
(90, 34, 28, 40, 'Hộp Da Đôi - Hãng Cantine Tinazzi', 'hop-da-doi---hang-cantine-tinazzi', 99, NULL, '13%', 'Cantine Tinazzi', '300000', '300000', '<p>Hộp đựng rượu vang đ&ocirc;i cổ điển được thiết kế ri&ecirc;ng cho h&atilde;ng Cantine Tinazzi.- Thể hiện đẳng cấp v&agrave; tấm l&ograve;ng ch&acirc;n th&agrave;nh của người tặng.</p>', '<p>Hộp đựng rượu vang đ&ocirc;i cổ điển được thiết kế ri&ecirc;ng cho h&atilde;ng Cantine Tinazzi.- Thể hiện đẳng cấp v&agrave; tấm l&ograve;ng ch&acirc;n th&agrave;nh của người tặng.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"kNxoRwKKZLbLu9Npuv8qB0uRGuUCbe3ivTnC5JRM.jpeg\"]', 36, '750ml/chai', '750 ml', '2018', 'Nho  Veneto', '2018-10-09 08:19:59', '2018-10-09 10:44:25', NULL, 0, 0),
(91, 34, 28, 40, 'Hộp Da Đơn Đặc Biệt - Hãng Cantine Tinazzi', 'hop-da-don-dac-biet---hang-cantine-tinazzi', 99, NULL, '13%', 'Cantine Tinazzi', '999999', '999999', '<h2>Hộp đựng rượu vang đặc biệt sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Cantine Tinazzi.- Đặc biệt th&iacute;ch hợp cho c&aacute;c chai vang cao cấp, thể hiện đẳng cấp tinh tế của người tặng.</h2>', '<h2>Hộp đựng rượu vang đặc biệt sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Cantine Tinazzi.- Đặc biệt th&iacute;ch hợp cho c&aacute;c chai vang cao cấp, thể hiện đẳng cấp tinh tế của người tặng.</h2>', NULL, NULL, NULL, 0, 0, 0, '[\"NgMk3rsS8twKIIJ1lmMMnMZaspmXdWiQxf9rtUcN.jpeg\"]', 36, '750ml/chai', '750 ml', '2018', 'Nho  Veneto', '2018-10-09 08:22:09', '2018-10-09 10:44:16', NULL, 0, 0),
(92, 34, 28, 40, 'Hộp Da Đơn - Hãng Cantine Tinazzi', 'hop-da-don---hang-cantine-tinazzi', 99, NULL, '13%', 'Cantine Tinazzi', '999999', '999999', '<h2>Hộp đựng rượu vang với phong c&aacute;ch cổ điển, sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Cantine Tinazzi.- ho&agrave;n hảo để tặng những người th&acirc;n, bạn b&egrave; v&agrave; l&atilde;nh đạo trong c&aacute;c dịp lễ thể hiện đẳng cấp tinh tế của người tặng.</h2>', '<h2>Hộp đựng rượu vang với phong c&aacute;ch cổ điển, sang trọng được thiết kế ri&ecirc;ng cho h&atilde;ng Cantine Tinazzi.- ho&agrave;n hảo để tặng những người th&acirc;n, bạn b&egrave; v&agrave; l&atilde;nh đạo trong c&aacute;c dịp lễ thể hiện đẳng cấp tinh tế của người tặng.</h2>', NULL, NULL, NULL, 0, 0, 0, '[\"zjX7h2zo8MKpchgPvQRzKmmVhDC0WFTpdCZ8XPn3.jpeg\"]', 36, '750ml/chai', '750 ml', '2018', 'Nho  Veneto', '2018-10-09 08:24:00', '2018-10-09 10:44:06', NULL, 0, 0),
(93, 34, 28, 40, 'Rượu Vang Đỏ Australia - The Gate 2010', 'ruou-vang-do-australia---the-gate-2010', 99, NULL, '13,8%', 'Shingleback, Vườn nho Davey Estate vùng McLaren Vale - Australia', '980000', '980000', '<p>Rượu c&oacute; hương thơm của chocolate đen, hương cafe v&agrave; ti&ecirc;u đen kh&aacute; r&otilde;. Rượu c&oacute; vị ch&aacute;t đậm đ&agrave; lan tỏa to&agrave;n bộ khoang miệng l&agrave;m người uống rất dễ cảm nhận vẻ mạnh mẽ của The Gate 2012</p>', '<p>Rượu c&oacute; hương thơm của chocolate đen, hương cafe v&agrave; ti&ecirc;u đen kh&aacute; r&otilde;. Rượu c&oacute; vị ch&aacute;t đậm đ&agrave; lan tỏa to&agrave;n bộ khoang miệng l&agrave;m người uống rất dễ cảm nhận vẻ mạnh mẽ của The Gate 2012</p>', NULL, NULL, NULL, 0, 0, 0, '[\"DL5JzHYh8dAMtTu06k0G6HKOgAmE7JmXPCbfv01t.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2010', 'nho Shiraz', '2018-10-09 08:25:58', '2018-10-09 10:43:53', NULL, 0, 0),
(94, 34, 28, 40, 'Rượu Vang Đỏ Pháp - La Grange Castalides Édition 2012', 'ruou-vang-do-phap---la-grange-castalides-edition-2012', 99, NULL, '15%', 'La Grange - vùng Languedoc, Pháp', '960000', '960000', '<p><strong>La Grange Castalides &Eacute;dition 2012 l&agrave; chai rượu vang được rất nhiều giải thưởng danh gi&aacute; tr&ecirc;n Thế Giới. La Grange c&oacute; một hương vị đậm đ&agrave;, đằm thắm nhưng rất &ecirc;m &aacute;i.</strong></p>', '<p><strong>La Grange Castalides &Eacute;dition 2012 l&agrave; chai rượu vang được rất nhiều giải thưởng danh gi&aacute; tr&ecirc;n Thế Giới. La Grange c&oacute; một hương vị đậm đ&agrave;, đằm thắm nhưng rất &ecirc;m &aacute;i.</strong></p>', NULL, NULL, NULL, 0, 0, 0, '[\"iAGUnzjhrJ5qcTYFxveou9eWJ52WD8AqQUeQOmxI.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2012', 'nho Syrah, Grenache', '2018-10-09 08:27:29', '2018-10-09 10:43:41', NULL, 0, 0),
(95, 34, 28, 40, 'Rượu Vang Đỏ Agentina - Pascual Toso Malbec Reserve', 'ruou-vang-do-agentina---pascual-toso-malbec-reserve', 99, NULL, '13,8%', 'Pascual Toso vùng Mendoza Argentina', '450000', '450000', '<p><strong>Pascual Toso Malbec Reserve l&agrave; minh chứng ho&agrave;n hảo cho chất lượng của rượu vang Argentina nhưng với gi&aacute; cả v&ocirc; c&ugrave;ng phải chăng, l&agrave; lựa chọn ho&agrave;n hảo cho c&aacute;c bữa ăn h&agrave;ng ng&agrave;y cũng như c&aacute;c buổi tiệc lớn.</strong></p>', '<p><strong>Pascual Toso Malbec Reserve l&agrave; minh chứng ho&agrave;n hảo cho chất lượng của rượu vang Argentina nhưng với gi&aacute; cả v&ocirc; c&ugrave;ng phải chăng, l&agrave; lựa chọn ho&agrave;n hảo cho c&aacute;c bữa ăn h&agrave;ng ng&agrave;y cũng như c&aacute;c buổi tiệc lớn.</strong></p>', NULL, NULL, NULL, 0, 0, 0, '[\"iqcUj2taYESPqlOHVYIUAAdI8h2S8xzh2dAKVbWo.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'nho Malbec', '2018-10-09 10:20:27', '2018-10-09 10:43:32', NULL, 0, 0),
(96, 34, 28, 40, 'Rượu Vang Trắng New Zealand - The Brothers', 'ruou-vang-trang-new-zealand---the-brothers', 99, NULL, '13,5%', 'Giesen vùng Malborough, New Zealand', '750000', '750000', '<p>The Brothers - T&igrave;nh huynh đệ keo sơn.<strong>&nbsp;</strong>Rượu vang The Brothers đến từ New Zealand với vị chua nhẹ nh&agrave;ng v&agrave; hương thơm v&ocirc; c&ugrave;ng ấn tượng của ổi ch&iacute;n, t&aacute;o xanh, l&ecirc; v&agrave;ng. Chai vang The Brothers l&ocirc;i cuốn người thưởng thức ngay từ ngụm đầu ti&ecirc;n cho đến giọt cuối c&ugrave;ng</p>', '<p>The Brothers - T&igrave;nh huynh đệ keo sơn.<strong>&nbsp;</strong>Rượu vang The Brothers đến từ New Zealand với vị chua nhẹ nh&agrave;ng v&agrave; hương thơm v&ocirc; c&ugrave;ng ấn tượng của ổi ch&iacute;n, t&aacute;o xanh, l&ecirc; v&agrave;ng. Chai vang The Brothers l&ocirc;i cuốn người thưởng thức ngay từ ngụm đầu ti&ecirc;n cho đến giọt cuối c&ugrave;ng</p>', NULL, NULL, NULL, 0, 0, 0, '[\"lAb4Kd5e6G842yp5BVgpsgtXmTTGVWssDPBe7dyL.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2012', 'nho Sauvignon Blanc', '2018-10-09 10:23:54', '2018-10-09 10:43:24', NULL, 0, 0),
(97, 34, 28, 40, 'Rượu Vang Đỏ Ý - 50 Anniversario', 'ruou-vang-do-y---50-anniversario', 99, NULL, '15%', 'Cantine San Marzano - Italy', '2000000', '2000000', '<p>Rượu vang 50 Anniversario&nbsp;sự kết hợp tuyệt vời từ thi&ecirc;n nhi&ecirc;n với truyền thống l&agrave;m rượu vang h&agrave;ng ngh&igrave;n năm của Italy cũng như của v&ugrave;ng đất Salento. Rượu c&oacute; m&agrave;u đỏ s&aacute;nh đậm đặc, hương thơm dịu d&agrave;ng v&agrave; đằm thắm của th&ugrave;ng ủ h&ograve;a quyện với hương đậm đ&agrave; mộc mạc của hai giống nho, vị ch&aacute;t đậm nhưng rất mềm tạo cho người uống cảm gi&aacute;c thư gi&atilde;n v&agrave; thỏa&nbsp;</p>', '<p>Rượu vang 50 Anniversario&nbsp;sự kết hợp tuyệt vời từ thi&ecirc;n nhi&ecirc;n với truyền thống l&agrave;m rượu vang h&agrave;ng ngh&igrave;n năm của Italy cũng như của v&ugrave;ng đất Salento. Rượu c&oacute; m&agrave;u đỏ s&aacute;nh đậm đặc, hương thơm dịu d&agrave;ng v&agrave; đằm thắm của th&ugrave;ng ủ h&ograve;a quyện với hương đậm đ&agrave; mộc mạc của hai giống nho, vị ch&aacute;t đậm nhưng rất mềm tạo cho người uống cảm gi&aacute;c thư gi&atilde;n v&agrave; thỏa&nbsp;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"JqbCCY8MBy5VbMSXE1oaElzCueL0xlXu6tg0fqhS.jpeg\"]', 36, '750ml/chai', '750 ml', '2018', 'nho Negro Amaro, Primitivo', '2018-10-09 10:25:51', '2018-10-09 10:43:12', NULL, 0, 0),
(98, 34, 28, 40, 'Rượu Vang Đỏ Ý - No.8 Negroamaro', 'ruou-vang-do-y---no8-negroamaro', 99, NULL, '15%', 'Cantine San Marzano - Italy', '1200000', '1200000', '<p>Rượu vang No.8 Negroamaro&nbsp;v&agrave;o trong khoang miệng l&agrave; vị đầy đặn v&agrave; đậm đ&agrave;, sau để lại vị b&ugrave;i hơi ngậy của ca-cao v&agrave; bơ. Đặc biệt, d&ograve;ng rượu vang n&agrave;y c&agrave;ng lắc đều v&agrave; để l&acirc;u sẽ c&agrave;ng thơm rất dễ chịu mang hương thơm của c&aacute;c loại mứt: Mứt đ&agrave;o, mơ v&agrave; mận.</p>\r\n<h2><strong>&nbsp;</strong></h2>', '<p>Rượu vang No.8 Negroamaro&nbsp;v&agrave;o trong khoang miệng l&agrave; vị đầy đặn v&agrave; đậm đ&agrave;, sau để lại vị b&ugrave;i hơi ngậy của ca-cao v&agrave; bơ. Đặc biệt, d&ograve;ng rượu vang n&agrave;y c&agrave;ng lắc đều v&agrave; để l&acirc;u sẽ c&agrave;ng thơm rất dễ chịu mang hương thơm của c&aacute;c loại mứt: Mứt đ&agrave;o, mơ v&agrave; mận.</p>\r\n<h2><strong>&nbsp;</strong></h2>', NULL, NULL, NULL, 0, 0, 0, '[\"JJ7hFtVGCH5NNPvIRVin0cmhCoCpnFQxWBTFS2ef.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'nho  Negro Amaro', '2018-10-09 10:28:39', '2018-10-09 10:43:03', NULL, 0, 0),
(99, 34, 28, 40, 'Rượu Vang Đỏ Ý - Celebration Primitivo LXXIV', 'ruou-vang-do-y---celebration-primitivo-lxxiv', 99, NULL, '14.5%', 'Cantine Tinazzi - Italy', '1250000', '1250000', '<p>Rượu vang Celebration LXXIV l&agrave; loại rượu vang c&oacute; m&agrave;u đỏ đậm, mang hương thơm đặc của anh đ&agrave;o mận ch&iacute;n, khi thưởng thức vị ch&aacute;t dịu d&agrave;ng &ecirc;m &aacute;i lan toả to&agrave;n bộ khoang miệng, c&agrave;ng để l&acirc;u trong ly vang c&agrave;ng tỏa ra hương thơm ngọt ng&agrave;o của cỏ mật kh&ocirc;.</p>', '<p>Rượu vang Celebration LXXIV l&agrave; loại rượu vang c&oacute; m&agrave;u đỏ đậm, mang hương thơm đặc của anh đ&agrave;o mận ch&iacute;n, khi thưởng thức vị ch&aacute;t dịu d&agrave;ng &ecirc;m &aacute;i lan toả to&agrave;n bộ khoang miệng, c&agrave;ng để l&acirc;u trong ly vang c&agrave;ng tỏa ra hương thơm ngọt ng&agrave;o của cỏ mật kh&ocirc;.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"BntmnAyuoQOwqcfPuUYsx7TzQWrY8pwc3mRcAFmY.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2018', 'nho Primiditivo di Manduria', '2018-10-09 10:32:12', '2018-10-09 10:42:54', NULL, 0, 0),
(100, 34, 28, 40, 'Rượu Vang Đỏ Ý - Megale 2013', 'ruou-vang-do-y---megale-2013', 99, NULL, '12.5%', 'Cantine Sanmarzano - Italy', '395000', '395000', '<div class=\"product-des\">\r\n<p>Rượu vang Megale&nbsp;c&oacute; m&agrave;u đỏ đằm thắm, hương thơm dịu d&agrave;ng, vị b&ugrave;i ch&aacute;t ngậy h&ograve;a quyện v&agrave;o nhau h&agrave;i h&ograve;a mực thước sẽ ph&ugrave; hợp với c&aacute;c bữa tiệc đ&ocirc;ng người.</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<div class=\"product-info\">&nbsp;</div>', '<div class=\"product-des\">\r\n<p>Rượu vang Megale&nbsp;c&oacute; m&agrave;u đỏ đằm thắm, hương thơm dịu d&agrave;ng, vị b&ugrave;i ch&aacute;t ngậy h&ograve;a quyện v&agrave;o nhau h&agrave;i h&ograve;a mực thước sẽ ph&ugrave; hợp với c&aacute;c bữa tiệc đ&ocirc;ng người.</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<div class=\"product-info\">&nbsp;</div>', NULL, NULL, NULL, 0, 0, 0, '[\"ldFAc7c9hX9kRpKr4Rp4fJXFauwi7cxUnAw8FZS6.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2013', 'nho Negro Amaro', '2018-10-09 10:34:27', '2018-10-09 10:42:45', NULL, 0, 0);
INSERT INTO `product` (`id`, `type_id`, `kind_id`, `trademark_id`, `name`, `slug`, `quantity`, `effect`, `concentrations`, `producer`, `price`, `selling_price`, `content`, `description`, `discount_percent`, `discount_price`, `gift`, `is_discount`, `is_special`, `is_new`, `image`, `origin_id`, `volume`, `capacity`, `year`, `material`, `created_at`, `updated_at`, `deleted_at`, `is_deleted`, `is_gift`) VALUES
(101, 34, 28, 40, 'Rượu Vang Đỏ Ý - Malnera 2014', 'ruou-vang-do-y---malnera-2014', 99, NULL, '14%', 'Malnera', '650000', '650000', '<p>L&agrave; sự kết hợp hai c&aacute; t&iacute;nh rượu vang kh&aacute;c biệt nhau Negroamaro v&agrave; Malvalsia Nera nhưng lại c&ugrave;ng h&ograve;a nhịp v&agrave; bổ trợ cho nhau tạo n&ecirc;n một hương vị h&agrave;i h&ograve;a, c&acirc;n đối, mực thước cả m&ugrave;i lẫn vị.&nbsp;Một chai vang th&uacute; vị cho những bữa tiệc đ&ocirc;ng người hoặc uống h&agrave;ng ng&agrave;y.</p>', '<p>L&agrave; sự kết hợp hai c&aacute; t&iacute;nh rượu vang kh&aacute;c biệt nhau Negroamaro v&agrave; Malvalsia Nera nhưng lại c&ugrave;ng h&ograve;a nhịp v&agrave; bổ trợ cho nhau tạo n&ecirc;n một hương vị h&agrave;i h&ograve;a, c&acirc;n đối, mực thước cả m&ugrave;i lẫn vị.&nbsp;Một chai vang th&uacute; vị cho những bữa tiệc đ&ocirc;ng người hoặc uống h&agrave;ng ng&agrave;y.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"qJecoa7Gy24YB2AmF87VyyNIH5F9WKmsIhQwYLy1.jpeg\"]', 36, '750ml/chai', '750 ml', '2014', 'nho Negroamaro, Malvasia Nera', '2018-10-09 10:36:55', '2018-10-09 10:42:39', NULL, 0, 0),
(102, 34, 28, 40, 'Rượu Vang Đỏ Ý - Monterè Corvina 2013', 'ruou-vang-do-y---montere-corvina-2013', 99, NULL, '14%', 'Cantine Tinazzi - Italy', '1050000', '1050000', '<p>Corvina c&ograve;n được gọi Corvina Veronese mang hương sắc đặc trưng của kh&iacute; hậu đất liền với c&aacute; t&iacute;nh s&ocirc;i nổi mạnh mẽ sẽ rất th&uacute; vị khi kh&aacute;m ph&aacute; từng lớp hương thơm v&agrave; vị trong mỗi chai Monter&egrave; Corvina.</p>', '<p>Corvina c&ograve;n được gọi Corvina Veronese mang hương sắc đặc trưng của kh&iacute; hậu đất liền với c&aacute; t&iacute;nh s&ocirc;i nổi mạnh mẽ sẽ rất th&uacute; vị khi kh&aacute;m ph&aacute; từng lớp hương thơm v&agrave; vị trong mỗi chai Monter&egrave; Corvina.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"5WhfQZSLooCEPRAMVTs3zyTgAyb52sF5cS2cJFzq.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2013', 'nho Corvina Veronese', '2018-10-09 10:38:47', '2018-10-09 10:42:33', NULL, 0, 0),
(103, 34, 28, 40, 'Rượu vang đỏ Ý - Cardinale', 'ruou-vang-do-y---cardinale', 99, NULL, '14.5%', 'Feudi Salentini', '1350000', '1350000', '<p>Rượu vang Cardinale l&agrave; loại rượu vang c&oacute; m&ugrave;i thơm dịu d&agrave;ng của cỏ ngọt kh&ocirc; v&agrave; c&aacute;c loại mứt tr&aacute;i c&acirc;y, qu&aacute; tr&igrave;nh lắc sẽ tỏa ra hương thơm nồng n&agrave;n quyến rũ ho&agrave;n vị Tannin sẽ mềm mại nhanh ch&oacute;ng chinh phục được những thực kh&aacute;ch kh&oacute; t&iacute;nh nhất.</p>', '<p>Rượu vang Cardinale l&agrave; loại rượu vang c&oacute; m&ugrave;i thơm dịu d&agrave;ng của cỏ ngọt kh&ocirc; v&agrave; c&aacute;c loại mứt tr&aacute;i c&acirc;y, qu&aacute; tr&igrave;nh lắc sẽ tỏa ra hương thơm nồng n&agrave;n quyến rũ ho&agrave;n vị Tannin sẽ mềm mại nhanh ch&oacute;ng chinh phục được những thực kh&aacute;ch kh&oacute; t&iacute;nh nhất.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"wZhyzRqbz7vtMLFtxH4ytNlZhIHseBdSUdlweOqI.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2012', 'nho  Primitivo', '2018-10-09 10:40:44', '2018-10-09 10:42:27', NULL, 0, 0),
(104, 34, 21, 29, 'qqqqqqqqqqq', 'qqqqqqqqqqq', 22, NULL, '17,5%', 'GOLDEN CROSS', '999999999', '999999999', '<p>qưe</p>', '<p>qew</p>', NULL, NULL, '<p>qưeqw</p>', 0, 0, 1, '[\"3XFGUccnBAGKrODztdT5NImqwo0IDRzWWyuQMCTi.jpeg\"]', 36, '750ml/chai', 'wwww', '2014', 'Nho Salento', '2018-10-09 11:01:43', '2018-10-09 11:01:47', NULL, 1, 0),
(105, 34, 28, 40, 'Rượu Vang Đỏ Ý - Negro Amaro 125', 'ruou-vang-do-y---negro-amaro-125', 99, NULL, '12.5%', 'Feudi Salentini', '395000', '395000', '<p>Rượu vang Amaro Negro 125 c&oacute; mầu đỏ ruby hơi ngả sang t&iacute;m c&ugrave;ng với hương thơm m&atilde;nh liệt của C&agrave; Ph&ecirc; tự nhi&ecirc;n, quả Việt Quất v&agrave; D&acirc;u. Lu&ocirc;n mượt m&agrave; v&agrave; nổi bật trong v&ograve;m miệng với vị tr&aacute;i c&acirc;y m&atilde;nh liệt.&nbsp;Pho-m&aacute;t, mỳ &Yacute;, quả Oliu v&agrave; b&aacute;nh Pizza l&agrave; những m&oacute;n ho&agrave;n hảo để kết hợp với loại rượu n&agrave;y</p>', '<p>Rượu vang Amaro Negro 125 c&oacute; mầu đỏ ruby hơi ngả sang t&iacute;m c&ugrave;ng với hương thơm m&atilde;nh liệt của C&agrave; Ph&ecirc; tự nhi&ecirc;n, quả Việt Quất v&agrave; D&acirc;u. Lu&ocirc;n mượt m&agrave; v&agrave; nổi bật trong v&ograve;m miệng với vị tr&aacute;i c&acirc;y m&atilde;nh liệt.&nbsp;Pho-m&aacute;t, mỳ &Yacute;, quả Oliu v&agrave; b&aacute;nh Pizza l&agrave; những m&oacute;n ho&agrave;n hảo để kết hợp với loại rượu n&agrave;y</p>', NULL, NULL, NULL, 0, 0, 0, '[\"tSeBE2bGt6NuasEMRhIRFLKSzQI4GIeIWzpZiBxS.jpeg\"]', 36, '750ml/chai', '750ml/chai, 12 chai/thùng', '2018', 'nho Salento', '2018-10-10 02:33:12', '2018-10-10 02:33:12', NULL, 0, 0),
(106, 34, 28, 40, 'Rượu Vang Đỏ Ý - 125 Primitivo 14%', 'ruou-vang-do-y---125-primitivo-14', 99, NULL, '14%', 'Primitivo', '675000', '675000', '<p><strong>125 Primitivo</strong>&nbsp;c&oacute; độ cồn ở mức vừa phải, thời gian ủ kh&ocirc;ng qu&aacute; d&agrave;i n&ecirc;n giữ được vị tươi mới, hương thơm nhẹ nh&agrave;ng dễ chịu mang đặc trưng r&otilde; n&eacute;t của hương tr&aacute;i c&acirc;y. Một chai rượu vang đơn giản để phục c&aacute;c bữa tiệc đ&ocirc;ng người, hoặc để uống h&agrave;ng ng&agrave;y cũng như c&aacute;c buổi tối sum họp</p>', '<p><strong>125 Primitivo</strong>&nbsp;c&oacute; độ cồn ở mức vừa phải, thời gian ủ kh&ocirc;ng qu&aacute; d&agrave;i n&ecirc;n giữ được vị tươi mới, hương thơm nhẹ nh&agrave;ng dễ chịu mang đặc trưng r&otilde; n&eacute;t của hương tr&aacute;i c&acirc;y. Một chai rượu vang đơn giản để phục c&aacute;c bữa tiệc đ&ocirc;ng người, hoặc để uống h&agrave;ng ng&agrave;y cũng như c&aacute;c buổi tối sum họp</p>', NULL, NULL, NULL, 0, 0, 0, '[\"8mJz7JuWYKwk7D8QMVapyKwAAor4MPq2ETWdRSNM.jpeg\"]', 36, '750ml/chai', '750 ml', '2018', 'nho Primitivo', '2018-10-10 02:35:30', '2018-10-10 02:35:30', NULL, 0, 0),
(107, 34, 28, 40, 'Siêu Phẩm F79 Primitivo Di Manduria', 'sieu-pham-f79-primitivo-di-manduria', 99, NULL, '15%', 'Cantine Tinazzi - Italy', '3500000', '3500000', '<p>Tuyệt phẩm rượu vang F79 được tạo ra để vinh danh con g&aacute;i của Andrea Tinazzi, b&agrave; Francesca Tinazzi . Chỉ c&oacute; 3000 chai loại n&agrave;y tr&ecirc;n to&agrave;n thế giới với bọc n&uacute;t chai bằng v&agrave;ng 24k, nh&atilde;n bằng len dệt v&agrave; chữ k&iacute; tay của Francesca Tinazzi.</p>', '<p>Tuyệt phẩm rượu vang F79 được tạo ra để vinh danh con g&aacute;i của Andrea Tinazzi, b&agrave; Francesca Tinazzi . Chỉ c&oacute; 3000 chai loại n&agrave;y tr&ecirc;n to&agrave;n thế giới với bọc n&uacute;t chai bằng v&agrave;ng 24k, nh&atilde;n bằng len dệt v&agrave; chữ k&iacute; tay của Francesca Tinazzi.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"0ZWzzYCfYd9BKS3WV1XrQ6FV0QiEXPtmGXIDJVGD.jpeg\"]', 36, '750ml/chai', '750 ml', '2018', 'nho Primitivo di Manduria', '2018-10-10 02:37:24', '2018-10-10 02:37:24', NULL, 0, 0),
(108, 34, 28, 40, 'Siêu Phẩm G77 Valpolicella Superiore Ripasso', 'sieu-pham-g77-valpolicella-superiore-ripasso', 99, NULL, '15%', 'Cantine Tinazzi', '3000000', '3000000', '<p>G77 l&agrave; một tuyệt phẩm của kh&ocirc;ng chỉ gia đ&igrave;nh Tinazzi m&agrave; c&ograve;n của cả v&ugrave;ng trồng nho Verona danh tiếng của Italy.&nbsp;Chỉ c&oacute; 3000 chai loại n&agrave;y tr&ecirc;n to&agrave;n thế giới với bọc n&uacute;t chai bằng v&agrave;ng 24k, nh&atilde;n bằng len dệt v&agrave; chữ k&iacute; tay của Giorgion Tinazzi.</p>', '<p>G77 l&agrave; một tuyệt phẩm của kh&ocirc;ng chỉ gia đ&igrave;nh Tinazzi m&agrave; c&ograve;n của cả v&ugrave;ng trồng nho Verona danh tiếng của Italy.&nbsp;Chỉ c&oacute; 3000 chai loại n&agrave;y tr&ecirc;n to&agrave;n thế giới với bọc n&uacute;t chai bằng v&agrave;ng 24k, nh&atilde;n bằng len dệt v&agrave; chữ k&iacute; tay của Giorgion Tinazzi.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"Ng6rXEPeeTgl7dzhxlGE5LoURxtNuFmlw8V6QtFW.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho Corvina 80%, Rondinella 15 % and Molinara 5%', '2018-10-10 02:39:05', '2018-10-10 02:39:05', NULL, 0, 0),
(109, 34, 28, 40, 'Rượu Vang Đỏ Ý - Amarone La Bastia', 'ruou-vang-do-y---amarone-la-bastia', 99, NULL, '15%', 'Cantine Tinazzi', '2500000', '2500000', '<h2><span style=\"font-size: 12pt;\">Sản phẩm vang xuất sắc của v&ugrave;ng rượu vang Verona, ph&iacute;a T&acirc;y Bắc nước &Yacute;. Amarone La Bastia được sản xuất từ những loại nho đặc trưng nhất của v&ugrave;ng, đạt cấp độ cao nhất &ldquo;DOCG&rdquo; theo Luật rượu vang của &Yacute;.</span></h2>', '<h2><span style=\"font-size: 12pt;\">Sản phẩm vang xuất sắc của v&ugrave;ng rượu vang Verona, ph&iacute;a T&acirc;y Bắc nước &Yacute;. Amarone La Bastia được sản xuất từ những loại nho đặc trưng nhất của v&ugrave;ng, đạt cấp độ cao nhất &ldquo;DOCG&rdquo; theo Luật rượu vang của &Yacute;.</span></h2>', NULL, NULL, NULL, 0, 0, 0, '[\"j1WwGwJfrfPaPfIoZRQ8n5WCgVdBDasn1ODy1dv6.jpeg\"]', 36, '750ml/chai', '750 ml', '2018', 'nho Corvina 80%, Rondinella 15%, Molinara 5%', '2018-10-10 02:40:50', '2018-10-10 02:40:50', NULL, 0, 0),
(110, 34, 28, 39, 'Rượu Vang Trắng Ý - Nerostella', 'ruou-vang-trang-y---nerostella', 99, NULL, '12.5%', 'Cantine San Marzano - Italy', '280000', '280000', '<h2>Rượu vang Nerostella trắng c&oacute; vị chua nhẹ rất dễ chịu, hương thơm dịu d&agrave;ng những tr&aacute;i ch&iacute;n như ổi, t&aacute;o xanh, l&ecirc; v&agrave;ng, sẽ l&agrave; đồ uống l&yacute; tưởng cho bữa tiệc đ&ocirc;ng người v&agrave; những ng&agrave;y oi bức.&nbsp;</h2>', '<h2>Rượu vang Nerostella trắng c&oacute; vị chua nhẹ rất dễ chịu, hương thơm dịu d&agrave;ng những tr&aacute;i ch&iacute;n như ổi, t&aacute;o xanh, l&ecirc; v&agrave;ng, sẽ l&agrave; đồ uống l&yacute; tưởng cho bữa tiệc đ&ocirc;ng người v&agrave; những ng&agrave;y oi bức.&nbsp;</h2>', NULL, NULL, NULL, 0, 0, 0, '[\"1zLu4vlJ7Mxii9SZfaNqloJ9OwrpTSZDgsNGVWas.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho Malvasia, Sauvignon Blanc', '2018-10-10 02:42:28', '2018-10-10 02:42:28', NULL, 0, 0),
(111, 34, 28, 40, 'Rượu Vang Đỏ Ý - Monterè Ripasso', 'ruou-vang-do-y---montere-ripasso', 99, NULL, '14%', 'Cantine Tinazzi', '1350000', '1350000', '<p>Monter&egrave; Ripasso mang một c&aacute; t&iacute;nh mạnh mẽ, một phần ảnh hưởng bởi kh&iacute; hậu miền Bắc &Yacute;, đồng thời ảnh hưởng bởi những giống nho mạnh mẽ tạo n&ecirc;n n&eacute;t đặc trưng của sản phẩm n&agrave;y .</p>', '<p>Monter&egrave; Ripasso mang một c&aacute; t&iacute;nh mạnh mẽ, một phần ảnh hưởng bởi kh&iacute; hậu miền Bắc &Yacute;, đồng thời ảnh hưởng bởi những giống nho mạnh mẽ tạo n&ecirc;n n&eacute;t đặc trưng của sản phẩm n&agrave;y .</p>', NULL, NULL, NULL, 0, 0, 0, '[\"nE7arNYHbS68cVXF1rz5qQl9UaBFW7VforF6kIh2.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho Corvina 80%, Rondinella 15 % and Molinara 5%', '2018-10-10 02:44:01', '2018-10-10 02:44:01', NULL, 0, 0),
(112, 34, 28, 40, 'Rượu Vang Trắng Ý - Malvasia 125', 'ruou-vang-trang-y---malvasia-125', 99, NULL, '12.5%', 'Feudi Salentini', '385000', '385000', '<p>Rượu vang 125 Malvasia l&agrave; d&ograve;ng rượu vang c&oacute; nguồn gốc từ Hy Lạp, hiện nay được trồng v&agrave;o phổ biến rộng r&atilde;i ở c&aacute;c nước ven bờ Địa Trung Hải. Vang c&oacute; m&agrave;u v&agrave;ng nhẹ nh&agrave;ng tinh tế, vị tươi m&aacute;t pha chua nhẹ thanh tao v&agrave; &ecirc;m &aacute;i. Khi uống ngụm đầu ti&ecirc;n, to&agrave;n bộ v&ograve;m miệng nước miếng sẽ tu&ocirc;n tr&agrave;o v&agrave; l&agrave;m ta kh&ocirc;ng thể cưỡng lại.</p>', '<p>Rượu vang 125 Malvasia l&agrave; d&ograve;ng rượu vang c&oacute; nguồn gốc từ Hy Lạp, hiện nay được trồng v&agrave;o phổ biến rộng r&atilde;i ở c&aacute;c nước ven bờ Địa Trung Hải. Vang c&oacute; m&agrave;u v&agrave;ng nhẹ nh&agrave;ng tinh tế, vị tươi m&aacute;t pha chua nhẹ thanh tao v&agrave; &ecirc;m &aacute;i. Khi uống ngụm đầu ti&ecirc;n, to&agrave;n bộ v&ograve;m miệng nước miếng sẽ tu&ocirc;n tr&agrave;o v&agrave; l&agrave;m ta kh&ocirc;ng thể cưỡng lại.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"xPcvomtyyzIQ0NeL0gGY6Iq1cZDBYOCAT0GKsWQW.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho Malvasia', '2018-10-10 02:45:32', '2018-10-10 02:45:32', NULL, 0, 0),
(113, 34, 28, 40, 'Rượu Vang Đỏ Ý - No.3 Opera 2005', 'ruou-vang-do-y---no3-opera-2005', 99, NULL, '15%', 'Cantine Tinazzi - Italy', '2000000', '2000000', '<p>N<sup>o</sup>3 Opera 3 l&agrave; loại rượu vang c&oacute; m&agrave;u đỏ thắm, khi r&oacute;t ra ly ban đầu l&agrave; hương thơm nhẹ, sau một số lần lắc sẽ tỏa ra hương thơm mạnh mẽ, cảm gi&aacute;c khi uống ngụm đầu l&agrave; vị ch&aacute;t đậm sau dịu lại &ecirc;m &aacute;i, dịu d&agrave;ng</p>', '<p>N<sup>o</sup>3 Opera 3 l&agrave; loại rượu vang c&oacute; m&agrave;u đỏ thắm, khi r&oacute;t ra ly ban đầu l&agrave; hương thơm nhẹ, sau một số lần lắc sẽ tỏa ra hương thơm mạnh mẽ, cảm gi&aacute;c khi uống ngụm đầu l&agrave; vị ch&aacute;t đậm sau dịu lại &ecirc;m &aacute;i, dịu d&agrave;ng</p>', NULL, NULL, NULL, 0, 0, 0, '[\"WcjEglbaMiB2z5KeSCnCmyU0EWAT16P5Jz71zpRa.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2005', 'nho Nero d\'Avola vùng Sicily, Primitivo vùng Apulia, Corvina vùng Veronese', '2018-10-10 02:47:03', '2018-10-10 02:47:03', NULL, 0, 0),
(114, 34, NULL, NULL, 'Vall De Lar - Rượu Vang Đỏ Tây Ban Nha', 'vall-de-lar---ruou-vang-do-tay-ban-nha', 99, NULL, '13%', 'Bodegas Santaba', '230000', '230000', '<p><strong>Vall De Lar Tinto</strong>&nbsp;c&oacute; h&agrave;m lượng tanin vừa phải, hương thơm phong ph&uacute; của thảo mộc, mận ch&iacute;n, thuốc l&aacute;, vani. Rượu vang Vall De Lar được sản xuất từ giống nho Tempranillo (Quốc nho của T&acirc;y Ban Nha).</p>', '<p><strong>Vall De Lar Tinto</strong>&nbsp;c&oacute; h&agrave;m lượng tanin vừa phải, hương thơm phong ph&uacute; của thảo mộc, mận ch&iacute;n, thuốc l&aacute;, vani. Rượu vang Vall De Lar được sản xuất từ giống nho Tempranillo (Quốc nho của T&acirc;y Ban Nha).</p>', NULL, NULL, NULL, 0, 0, 0, '[\"AeWNB5mIIECRupZqN5ynSm1UKyDeAmkxeh98h8y3.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho Tempranillo', '2018-10-10 03:10:12', '2018-10-10 03:10:12', NULL, 0, 0),
(115, 34, 28, 40, 'Hộp Da Đôi - Hãng Feudi Salentini', 'hop-da-doi---hang-feudi-salentini', 99, NULL, '13%', 'Feudi Salentini', '300000', '300000', '<p>Hộp đựng rượu vang đ&ocirc;i cổ điển được thiết kế ri&ecirc;ng cho h&atilde;ng Feudi Salentini - Thể hiện đẳng cấp v&agrave; tấm l&ograve;ng ch&acirc;n th&agrave;nh của người tặng.</p>', '<p>Hộp đựng rượu vang đ&ocirc;i cổ điển được thiết kế ri&ecirc;ng cho h&atilde;ng Feudi Salentini - Thể hiện đẳng cấp v&agrave; tấm l&ograve;ng ch&acirc;n th&agrave;nh của người tặng.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"BJOajaXaK3CieWmylNWk9EgSEMS5CzO8SLnGe29Z.jpeg\"]', 36, '750ml/chai', '35,5x20,5x12,5 cm', '2018', 'Nho  Veneto', '2018-10-10 03:31:18', '2018-10-10 03:31:18', NULL, 0, 0),
(116, 34, 28, 40, 'Rượu Vang Trắng Tây Ban Nha - Vall De Lar Blanco 2014', 'ruou-vang-trang-tay-ban-nha---vall-de-lar-blanco-2014', 99, NULL, '12.5%', 'Bodegas Santalba', '200000', '200000', '<p><strong>Vall De Lar Blanco 2014</strong>&nbsp;c&oacute; vị chua đậm, chất rượu vang đậm đặc rất th&iacute;ch hợp để đi k&egrave;m với thức ăn d&ugrave;ng để khai vị.</p>', '<p><strong>Vall De Lar Blanco 2014</strong>&nbsp;c&oacute; vị chua đậm, chất rượu vang đậm đặc rất th&iacute;ch hợp để đi k&egrave;m với thức ăn d&ugrave;ng để khai vị.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"9DVVMblFDPAMFweI2wTvDVpY2siMxCoPWXJlArGg.jpeg\"]', 36, '750ml/chai', '750 ml/chai, 6 chai/thùng', '2014', 'nho Tempranillo Blanco', '2018-10-10 03:33:51', '2018-10-10 03:33:51', NULL, 0, 0),
(117, 34, 28, 40, 'Rượu Vang Đỏ Chile - VSC Assemblage', 'ruou-vang-do-chile---vsc-assemblage', 99, NULL, '14.5%', 'Santa Carolina', '1500000', '1500000', '<p>Chai vang c&oacute; t&iacute;nh c&aacute;ch cực k&igrave; mạnh mẽ, quyết liệt v&agrave; tập trung cao độ của những g&igrave; tinh t&uacute;y nhất được chắt lọc ra từ những vườn nho tươi tốt của Chile - với mục ti&ecirc;u bất di dịch l&agrave; trở th&agrave;nh một trong những biểu tượng của c&aacute;c h&atilde;ng rượu vang đến từ T&acirc;n Thế Giới.</p>', '<p>Chai vang c&oacute; t&iacute;nh c&aacute;ch cực k&igrave; mạnh mẽ, quyết liệt v&agrave; tập trung cao độ của những g&igrave; tinh t&uacute;y nhất được chắt lọc ra từ những vườn nho tươi tốt của Chile - với mục ti&ecirc;u bất di dịch l&agrave; trở th&agrave;nh một trong những biểu tượng của c&aacute;c h&atilde;ng rượu vang đến từ T&acirc;n Thế Giới.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"B6QHpgeXAnwa1VbEldBKtuW19tEG24B0q9lla0Sb.jpeg\"]', 36, '750ml/chai', '750ml/chai, 12 chai/thùng', '2018', 'nho 60% Petit Verdot, 10% Cabernet Sauvignon, 15% Carmenère, 10% Mourvèdre, 5% Malbe', '2018-10-10 03:35:22', '2018-10-10 03:35:22', NULL, 0, 0),
(118, 34, 28, 40, 'Rượu Vang Đỏ Ý - Nerostella', 'ruou-vang-do-y---nerostella', 99, NULL, '13,5%', 'Cantine San Marzano - Italy', '290000', '290000', '<div class=\"product-des\">\r\n<p>Rượu vang Nerostella đỏ g&acirc;y ấn tượng v&agrave; m&atilde;nh liệt nhất ở trung đoạn bởi vị b&ugrave;i, vị b&eacute;o đậm đ&agrave; của Chocolate, bơ. V&agrave; cuối c&ugrave;ng l&agrave; 1 kết th&uacute;c bằng vị đắng của cafe đầy nhung nhớ, mang lại cho người thưởng thức nhiều cung bậc cảm x&uacute;c.</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<div class=\"product-info\">&nbsp;</div>', '<div class=\"product-des\">\r\n<p>Rượu vang Nerostella đỏ g&acirc;y ấn tượng v&agrave; m&atilde;nh liệt nhất ở trung đoạn bởi vị b&ugrave;i, vị b&eacute;o đậm đ&agrave; của Chocolate, bơ. V&agrave; cuối c&ugrave;ng l&agrave; 1 kết th&uacute;c bằng vị đắng của cafe đầy nhung nhớ, mang lại cho người thưởng thức nhiều cung bậc cảm x&uacute;c.</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<div class=\"product-info\">&nbsp;</div>', NULL, NULL, NULL, 0, 0, 0, '[\"NZ9M15YbP3fM0d3z8j7D4oJxenaqOKKspd0D2qoj.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho Negro Amaro', '2018-10-10 03:37:31', '2018-10-10 03:37:31', NULL, 0, 0),
(119, 34, 28, 40, 'Rượu Vang Đỏ Chile - Mousai Merlot 2015', 'ruou-vang-do-chile---mousai-merlot-2015', 99, NULL, '13,5%', 'La Ronciere', '450000', '450000', '<p>Rượu vang đỏ Chile Mousai Merlot v&ocirc; c&ugrave;ng quyến rũ với hương vani pha ch&uacute;t tinh tế của chocolate v&agrave; c&aacute;c hạt gia vị. H&atilde;y uống v&agrave; cảm nhận Mousai Merlot với vị tannin mạnh mẽ, đầy trưởng th&agrave;nh - điển h&igrave;nh của giống nho được trồng tại thung lũng Colchagua, n&oacute; đưa đến người uống một cấu tr&uacute;c đậm đặc v&agrave; h&agrave;i h&ograve;a thi vị. Vị ch&aacute;t đậm để lại dư &acirc;m tr&agrave;n đầy trong v&ograve;m miệng.</p>', '<p>Rượu vang đỏ Chile Mousai Merlot v&ocirc; c&ugrave;ng quyến rũ với hương vani pha ch&uacute;t tinh tế của chocolate v&agrave; c&aacute;c hạt gia vị. H&atilde;y uống v&agrave; cảm nhận Mousai Merlot với vị tannin mạnh mẽ, đầy trưởng th&agrave;nh - điển h&igrave;nh của giống nho được trồng tại thung lũng Colchagua, n&oacute; đưa đến người uống một cấu tr&uacute;c đậm đặc v&agrave; h&agrave;i h&ograve;a thi vị. Vị ch&aacute;t đậm để lại dư &acirc;m tr&agrave;n đầy trong v&ograve;m miệng.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"t5WzzfK7usz8nzcIctqpivbau1ziQka4aBCaW6BC.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2015', 'nho 100% Merlot', '2018-10-10 03:38:57', '2018-10-10 03:38:57', NULL, 0, 0),
(120, 34, 28, 40, 'Rượu Vang Trắng Chile - Chaku Sauvignon Blanc 2015', 'ruou-vang-trang-chile---chaku-sauvignon-blanc-2015', 99, NULL, '13,5%', 'La Ronciere', '225000', '225000', '<p><strong>Chaku Sauvignon Blanc</strong>&nbsp;c&oacute; m&agrave;u v&agrave;ng nhẹ tươi s&aacute;ng, khi uống hương tr&aacute;i c&acirc;y thơm dịu nổi bật với hương cam chanh tươi m&aacute;t lan tỏa khắp khoang miệng, ban đầu l&agrave; vị hơi chua nhưng sau đ&oacute; l&agrave; vị ngọt nhẹ dể chịu lưu lại khắp v&ograve;m họng gi&uacute;p k&iacute;ch th&iacute;ch vị gi&aacute;c rất tốt ph&ugrave; hợp d&ugrave;ng để khai vị</p>', '<p><strong>Chaku Sauvignon Blanc</strong>&nbsp;c&oacute; m&agrave;u v&agrave;ng nhẹ tươi s&aacute;ng, khi uống hương tr&aacute;i c&acirc;y thơm dịu nổi bật với hương cam chanh tươi m&aacute;t lan tỏa khắp khoang miệng, ban đầu l&agrave; vị hơi chua nhưng sau đ&oacute; l&agrave; vị ngọt nhẹ dể chịu lưu lại khắp v&ograve;m họng gi&uacute;p k&iacute;ch th&iacute;ch vị gi&aacute;c rất tốt ph&ugrave; hợp d&ugrave;ng để khai vị</p>', NULL, NULL, NULL, 0, 0, 0, '[\"sVMQmAxb0kHsIUZ7hQCqcdPK7iueVQJLv3SxmnT4.jpeg\"]', 36, '750ml/chai', '750ml/chai,6 chai/thùng', '2015', 'nho 100% Sauvignon Blanc', '2018-10-10 03:41:37', '2018-10-10 03:41:37', NULL, 0, 0),
(121, 34, 28, 40, 'Rượu Vang Đỏ Ý - Primittivo 100 Essenza', 'ruou-vang-do-y---primittivo-100-essenza', 99, NULL, '15%', 'Feudi Salentini', '1500000', '1500000', '<p>Rượu vang Primittivo 100 Essenza&nbsp;c&oacute; m&ugrave;i thơm dịu d&agrave;ng của cỏ ngọt kh&ocirc; v&agrave; c&aacute;c loại mứt tr&aacute;i c&acirc;y, qu&aacute; tr&igrave;nh lắc sẽ tỏa ra hương thơm nồng n&agrave;n quyến rũ ho&agrave;n vị Tannin sẽ mềm mại nhanh ch&oacute;ng chinh phục được những thực kh&aacute;ch kh&oacute; t&iacute;nh nhất.</p>', '<p>Rượu vang Primittivo 100 Essenza&nbsp;c&oacute; m&ugrave;i thơm dịu d&agrave;ng của cỏ ngọt kh&ocirc; v&agrave; c&aacute;c loại mứt tr&aacute;i c&acirc;y, qu&aacute; tr&igrave;nh lắc sẽ tỏa ra hương thơm nồng n&agrave;n quyến rũ ho&agrave;n vị Tannin sẽ mềm mại nhanh ch&oacute;ng chinh phục được những thực kh&aacute;ch kh&oacute; t&iacute;nh nhất.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"dA3kvsuVurLpiCsQ2h3SokmEXz2Eo5NzmY4oEAZ2.jpeg\"]', 36, '750ml/chai', '750ml/chai, 12 chai/thùng', '2012', 'nho Primitivo', '2018-10-10 03:42:55', '2018-10-10 03:42:55', NULL, 0, 0),
(122, 34, 28, 40, 'Rượu Vang Trắng Chile - Cantoalba Sauvignon Blanc', 'ruou-vang-trang-chile---cantoalba-sauvignon-blanc', 99, NULL, '13,5%', 'La Ronciere', '320000', '320000', '<p>Cantoalba Sauvignon Blanc l&agrave; chai vang trắng được sản xuất &nbsp;100% từ giống nho Sauvignon Blanc. Rượu c&oacute; m&agrave;u v&agrave;ng s&aacute;ng &aacute;nh xanh, hương hoa phức hợp đặc trưng của giống nho Sauvignon Blanc, vị tr&ograve;n mịn v&agrave; mang hương vị kho&aacute;ng chất. Rượu cho vị chua ngay khi tiếp x&uacute;c với khoang miệng, k&iacute;ch th&iacute;ch vị gi&aacute;c, ph&ugrave; hợp để khai vị trong c&aacute;c bữa ăn.</p>', '<p>Cantoalba Sauvignon Blanc l&agrave; chai vang trắng được sản xuất &nbsp;100% từ giống nho Sauvignon Blanc. Rượu c&oacute; m&agrave;u v&agrave;ng s&aacute;ng &aacute;nh xanh, hương hoa phức hợp đặc trưng của giống nho Sauvignon Blanc, vị tr&ograve;n mịn v&agrave; mang hương vị kho&aacute;ng chất. Rượu cho vị chua ngay khi tiếp x&uacute;c với khoang miệng, k&iacute;ch th&iacute;ch vị gi&aacute;c, ph&ugrave; hợp để khai vị trong c&aacute;c bữa ăn.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"3fsQyG4dOTEsOzF3mY2zsEyMgO8za5MJrP8UIo9B.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2014', 'nho Sauvignon Blanc', '2018-10-10 03:44:09', '2018-10-10 03:44:09', NULL, 0, 0),
(123, 34, 28, 40, 'Siêu Phẩm A50 Amarone Della Valpolicella', 'sieu-pham-a50-amarone-della-valpolicella', 99, NULL, '15,5%', 'Cantine Tinazzi', '4500000', '4500000', '<p>Tuyệt phẩm rượu vang A50 được tạo ra để vinh danh \"vua\" của v&ugrave;ng trồng nh&ocirc; Verona - Andrea Tinazzi. Chỉ c&oacute; 3000 chai loại n&agrave;y tr&ecirc;n to&agrave;n thế giới với bọc n&uacute;t chai bằng v&agrave;ng 24k, nh&atilde;n bằng len dệt v&agrave; chữ k&iacute; tay của Andrea Tinazzi.</p>', '<p>Tuyệt phẩm rượu vang A50 được tạo ra để vinh danh \"vua\" của v&ugrave;ng trồng nh&ocirc; Verona - Andrea Tinazzi. Chỉ c&oacute; 3000 chai loại n&agrave;y tr&ecirc;n to&agrave;n thế giới với bọc n&uacute;t chai bằng v&agrave;ng 24k, nh&atilde;n bằng len dệt v&agrave; chữ k&iacute; tay của Andrea Tinazzi.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"h4nUMzVtpBOdnuc62rlRuwaZKVmLxqNeVEdfIwVj.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho Corvina 80%, Rondinella 15 % and Molinara 5%', '2018-10-10 03:46:11', '2018-10-10 03:46:11', NULL, 0, 0),
(124, 34, 28, 40, 'Rượu vang đỏ Tây Ban Nha - Saint Denis Crianza 2012  Rượu vang đỏ Tây Ban Nha - Saint Denis Crianza 2012 	 Rượu vang đỏ Tây Ban Nha - Saint Denis Crianza 2012 Tags: Bodegas Santalba    Rượu Vang Đỏ Tây Ban Nha - Saint Denis Crianza 2012', 'ruou-vang-do-tay-ban-nha---saint-denis-crianza-2012-ruou-vang-do-tay-ban-nha---saint-denis-crianza-2012-ruou-vang-do-tay-ban-nha---saint-denis-crianza-2012-tags-bodegas-santalba-ruou-vang-do-tay-ban-nha---saint-denis-crianza-2012', 99, NULL, '14.5%', 'Santalba', '750000', '750000', '<p>Saint Denis Crianza 2012 c&oacute;&nbsp;hương mận ch&iacute;n, chocolate v&agrave; thuốc l&aacute;, m&agrave;u đỏ đậm, h&agrave;m lượng tanin vừa phải mang lại kết cấu rượu vang tuyệt vời. Dư vị đọng lại trong cuống họng sau khi nhấp ngụm đầu ti&ecirc;n l&agrave; hương mận ch&iacute;n trộn lẫn vị vani do được ủ trong th&ugrave;ng gỗ sồi Ph&aacute;p.</p>\r\n<p>&nbsp;</p>', '<p>Saint Denis Crianza 2012 c&oacute;&nbsp;hương mận ch&iacute;n, chocolate v&agrave; thuốc l&aacute;, m&agrave;u đỏ đậm, h&agrave;m lượng tanin vừa phải mang lại kết cấu rượu vang tuyệt vời. Dư vị đọng lại trong cuống họng sau khi nhấp ngụm đầu ti&ecirc;n l&agrave; hương mận ch&iacute;n trộn lẫn vị vani do được ủ trong th&ugrave;ng gỗ sồi Ph&aacute;p.</p>\r\n<p>&nbsp;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"Tv91xwfequMuoCmQilOEmkiYo9rfp0NCzF52HdEa.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai / thùng', '2012', 'nho Tempranillo', '2018-10-10 03:47:32', '2018-10-10 03:47:32', NULL, 0, 0),
(125, 34, 28, 40, 'Rượu Vang Nổ Italy - Moscato Spumante', 'ruou-vang-no-italy---moscato-spumante', 99, NULL, '6,5%', 'Francesco Capetta - Italy', '9999999', '9999999', '<p>Rượu vang nổ (sparkling) Moscato Spumante l&agrave; người chị em song sinh với nh&atilde;n vang trắng DOCG&nbsp;nổi tiếng của Italy:&nbsp;<a href=\"http://wineplaza.vn/ruou-vang-trang-italy-moscatto-dasti.html\">Moscato D&rsquo;Asti</a>. Ho&agrave;n hảo trong những ng&agrave;y h&egrave; oi n&oacute;ng c&ugrave;ng với bạn b&egrave; v&agrave; người th&acirc;n</p>', '<p>Rượu vang nổ (sparkling) Moscato Spumante l&agrave; người chị em song sinh với nh&atilde;n vang trắng DOCG&nbsp;nổi tiếng của Italy:&nbsp;<a href=\"http://wineplaza.vn/ruou-vang-trang-italy-moscatto-dasti.html\">Moscato D&rsquo;Asti</a>. Ho&agrave;n hảo trong những ng&agrave;y h&egrave; oi n&oacute;ng c&ugrave;ng với bạn b&egrave; v&agrave; người th&acirc;n</p>', NULL, NULL, NULL, 0, 0, 0, '[\"2fVrFKRWdMSA7fYVAaVkEqEuB2Y5SB8gf45YKjyF.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho  Moscato (Muscat Blanc)', '2018-10-10 04:10:59', '2018-10-10 04:10:59', NULL, 0, 0),
(126, 34, 28, 40, 'Rượu Vang Đỏ Tây Ban Nha - Saint Denis Limited Edition 2014', 'ruou-vang-do-tay-ban-nha---saint-denis-limited-edition-2014', 99, NULL, '15%', 'Santalba', '1600000', '1600000', '<p style=\"text-align: justify;\">Saint Denis Limited Edition 2014 c&oacute; m&agrave;u đỏ đậm quyến rũ nhưng kh&ocirc;ng k&eacute;m phần mềm mại, thanh lịch v&agrave; c&oacute; thể lưu trữ được trong nhiều năm. N&oacute; c&oacute; vị cuốn h&uacute;t của va ni, tuyết t&ugrave;ng v&agrave; gia vị nhẹ.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', '<p style=\"text-align: justify;\">Saint Denis Limited Edition 2014 c&oacute; m&agrave;u đỏ đậm quyến rũ nhưng kh&ocirc;ng k&eacute;m phần mềm mại, thanh lịch v&agrave; c&oacute; thể lưu trữ được trong nhiều năm. N&oacute; c&oacute; vị cuốn h&uacute;t của va ni, tuyết t&ugrave;ng v&agrave; gia vị nhẹ.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"85pJ3VTOFgTWDn9LoRhcs6OTIi1Ml52sS6I1sYc6.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2014', 'nho Tempranillo ( 90%), Garnacha ( 10%)  Niên vụ : 2014', '2018-10-10 04:15:16', '2018-10-10 04:15:16', NULL, 0, 0),
(127, 34, 28, 40, 'Rượu Vang Trắng Italy - Moscato D\'Asti', 'ruou-vang-trang-italy---moscato-dasti', NULL, NULL, '99', 'Francesco Capetta - Italy', '545000', '545000', '<p>Moscato D\'Asti l&agrave; một chai vang trắng DOCG tuyệt vời của rượu vang Italy. Nhẹ nh&agrave;ng, dễ uống v&agrave; tạo cảm gi&aacute;c sảng kho&aacute;i tuyệt vời bởi hương thơm độc đ&aacute;o v&agrave; sủi tăm nhẹ.</p>', '<p>Moscato D\'Asti l&agrave; một chai vang trắng DOCG tuyệt vời của rượu vang Italy. Nhẹ nh&agrave;ng, dễ uống v&agrave; tạo cảm gi&aacute;c sảng kho&aacute;i tuyệt vời bởi hương thơm độc đ&aacute;o v&agrave; sủi tăm nhẹ.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"UnodADjvfObgLOmAkuUYL2GsTNApHLX0JFWVGmTy.png\"]', 36, '750ml/chai', '5,5%', '2018', 'nho  Moscato vùng Asti', '2018-10-10 04:16:43', '2018-10-10 04:16:43', NULL, 0, 0),
(128, 34, 28, 40, 'Rượu Vang Đỏ Chilê - COYAM Ensamblaje 2012', 'ruou-vang-do-chile---coyam-ensamblaje-2012', 99, NULL, '14,9%', 'Emiliana - Chile', '998000', '998000', '<p>Rượu vang đỏ COYAM Ensamblaje 2012 l&agrave; 1 sản phẩm vang đỏ tuyệt hảo thuộc d&ograve;ng trung cấp của Wineplaza với m&agrave;u đỏ mận sẫm, sắc t&iacute;m violet v&agrave; hương vị đậm đ&agrave;.</p>', '<p>Rượu vang đỏ COYAM Ensamblaje 2012 l&agrave; 1 sản phẩm vang đỏ tuyệt hảo thuộc d&ograve;ng trung cấp của Wineplaza với m&agrave;u đỏ mận sẫm, sắc t&iacute;m violet v&agrave; hương vị đậm đ&agrave;.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"YyuaPGZ9MnLvFskGEyXP5mEo6pXkjOKuaxIfiGqc.png\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2012', 'nho Syrah, Carmenere, Merlot, Cabernet Sauvignon', '2018-10-10 04:21:36', '2018-10-10 04:21:36', NULL, 0, 0),
(129, 34, 28, 40, 'Rượu Vang Đỏ New Zealand - Estate Merlot', 'ruou-vang-do-new-zealand---estate-merlot', 99, NULL, '13,5%', 'Giesen vùng Malborough, New Zealand', '350000', '350000', '<p>Vang đỏ Estate Merlot 2013 từ h&atilde;ng Giesen được sản xuất từ những tr&aacute;i nho sạch, chất lượng tuyệt hảo với độ ch&iacute;n sinh l&yacute; tuyệt vời từ ni&ecirc;n vụ năm 2013.&nbsp;</p>', '<p>Vang đỏ Estate Merlot 2013 từ h&atilde;ng Giesen được sản xuất từ những tr&aacute;i nho sạch, chất lượng tuyệt hảo với độ ch&iacute;n sinh l&yacute; tuyệt vời từ ni&ecirc;n vụ năm 2013.&nbsp;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"VDsXEiyPqKd926JyRK3fljcksCDnHOfGO7fqdo1x.png\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2013', 'nho Merlot', '2018-10-10 04:22:54', '2018-10-10 04:22:54', NULL, 0, 0),
(130, 34, 28, 40, 'Rượu Vang Đỏ Pháp - Château Pichon Longueville Comtesse De Lalande 2011', 'ruou-vang-do-phap---chateau-pichon-longueville-comtesse-de-lalande-2011', 99, NULL, '13%', 'Chateau Pichon Longueville Comtesse de Lalande', '7000000', '7000000', '<p>Chateau Pichon Comtesse de Lalande chai rượu vang đầy gợi cảm của v&ugrave;ng Pauillac. Với kết cấu thuần khiết v&agrave; mềm mại như nhung, h&ograve;a quyện c&ugrave;ng hương thơm nồng n&agrave;n của hoa ,tr&aacute;i c&acirc;y ch&iacute;n, độ đậm của kho&aacute;ng sản, phảng phất m&ugrave;i ca cao, thuốc l&aacute;, oliu l&agrave; những g&igrave; bạn sẽ t&igrave;m thấy trong Pichon Lalande.</p>', '<p>Chateau Pichon Comtesse de Lalande chai rượu vang đầy gợi cảm của v&ugrave;ng Pauillac. Với kết cấu thuần khiết v&agrave; mềm mại như nhung, h&ograve;a quyện c&ugrave;ng hương thơm nồng n&agrave;n của hoa ,tr&aacute;i c&acirc;y ch&iacute;n, độ đậm của kho&aacute;ng sản, phảng phất m&ugrave;i ca cao, thuốc l&aacute;, oliu l&agrave; những g&igrave; bạn sẽ t&igrave;m thấy trong Pichon Lalande.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"8kLcVOmiiLckzasgvIGbW0iERP33wnzUlgIaoI6a.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2011', 'nho Bordeaux red Blends', '2018-10-10 04:24:23', '2018-10-10 04:24:23', NULL, 0, 0),
(131, 34, 28, 40, 'Rượu Vang Đỏ Chilê - Gê Ensamblaje 2012', 'ruou-vang-do-chile---ge-ensamblaje-2012', 99, NULL, '15%', 'Emiliana - Chile', '2500000', '2500000', '<p>Chai vang đỏ G&ecirc; Ensamblaje 2012 đến từ Chil&ecirc; c&oacute; hương vị tuyệt hảo h&igrave;nh th&agrave;nh từ 16 th&aacute;ng ủ trong th&ugrave;ng gỗ sồi v&agrave; tuổi rượu tiềm năng l&ecirc;n đến 15 năm.</p>', '<p>Chai vang đỏ G&ecirc; Ensamblaje 2012 đến từ Chil&ecirc; c&oacute; hương vị tuyệt hảo h&igrave;nh th&agrave;nh từ 16 th&aacute;ng ủ trong th&ugrave;ng gỗ sồi v&agrave; tuổi rượu tiềm năng l&ecirc;n đến 15 năm.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"RdI3XBBhKuOrfWazu2cdxMrorvXL4j9SMPvIEGlT.png\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2012', 'nho Carmenere, Syrah, Cabernet Sauvignon', '2018-10-10 04:25:41', '2018-10-10 04:25:41', NULL, 0, 0),
(132, 34, 28, 40, 'Rượu Vang Đỏ Pháp Château Haut Batailley Pauillac Bordeaux 2013', 'ruou-vang-do-phap-chateau-haut-batailley-pauillac-bordeaux-2013', 99, NULL, '13,5%', 'Château Haut-Batailley', '2000000', '2000000', '<p>Haut-Batailley 2013 được sản xuất phần lớn từ giống nho Cabernet Sauvignon tạo n&ecirc;n m&agrave;u đỏ ruby m&atilde;nh liệt c&ugrave;ng hương thơm ngọt ng&agrave;o của những loại tr&aacute;i c&acirc;y ch&iacute;n đỏ, minh chứng cho sự trưởng th&agrave;nh đầy đủ v&agrave; h&agrave;i h&ograve;a của những giống nho được pha trộn. Ấn tượng ban đầu khi rượu tr&agrave;n v&agrave;o khoang miệng l&agrave; sự k&eacute;o d&agrave;i của vị ch&aacute;t tannin mượt &nbsp;m&agrave; v&agrave; thanh lịch. Haut-Batailley 2013 c&oacute; kết cấu c&acirc;n bằng, sự tươi mới, với phong c&aacute;ch quyến rũ v&ocirc; c&ugrave;ng thanh lịch.</p>', '<p>Haut-Batailley 2013 được sản xuất phần lớn từ giống nho Cabernet Sauvignon tạo n&ecirc;n m&agrave;u đỏ ruby m&atilde;nh liệt c&ugrave;ng hương thơm ngọt ng&agrave;o của những loại tr&aacute;i c&acirc;y ch&iacute;n đỏ, minh chứng cho sự trưởng th&agrave;nh đầy đủ v&agrave; h&agrave;i h&ograve;a của những giống nho được pha trộn. Ấn tượng ban đầu khi rượu tr&agrave;n v&agrave;o khoang miệng l&agrave; sự k&eacute;o d&agrave;i của vị ch&aacute;t tannin mượt &nbsp;m&agrave; v&agrave; thanh lịch. Haut-Batailley 2013 c&oacute; kết cấu c&acirc;n bằng, sự tươi mới, với phong c&aacute;ch quyến rũ v&ocirc; c&ugrave;ng thanh lịch.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"Of5E4p0QDgfdZfbV6XeQAS2yK7MKCvUAtvmiCAwR.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2013', 'nho  Bordeaux red Blends', '2018-10-10 04:27:40', '2018-10-10 04:27:40', NULL, 0, 0),
(133, 34, 28, 40, 'Rượu Vang Đỏ Chilê - Herencia Carmenere', 'ruou-vang-do-chile---herencia-carmenere', 99, NULL, '15%', 'Santa Carolina - Chile', '3000000', '3000000', '<p>Vang đỏ Herencia Carmenere được xem l&agrave; biểu tượng của nh&agrave; sản xuất Santa Carolina, Chil&ecirc;. Với mỗi một vụ nho, Herencia mang lại những phong c&aacute;ch ri&ecirc;ng biệt.</p>', '<p>Vang đỏ Herencia Carmenere được xem l&agrave; biểu tượng của nh&agrave; sản xuất Santa Carolina, Chil&ecirc;. Với mỗi một vụ nho, Herencia mang lại những phong c&aacute;ch ri&ecirc;ng biệt.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"4XLsM3e9sb6zQrf3PjDi5jV2vYAvnM7RoVVQtf6d.png\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho Carmenere, Cabernet Sauvignon, Malbec', '2018-10-12 03:47:25', '2018-10-12 03:47:25', NULL, 0, 0),
(134, 34, 28, 40, 'Rượu Vang Đỏ Pháp - Le Petit Mouton De Mouton-Rothschild 2012', 'ruou-vang-do-phap---le-petit-mouton-de-mouton-rothschild-2012', 99, NULL, '13%', 'Médoc - Bordeaux - Pháp', '80000000', '80000000', '<p>RƯợu vang Le Petit Mouton được sản xuất từ 49% những tr&aacute;i nho thơm ngon của vườn nho nh&agrave; Ch&acirc;teau Mouton Rothschild. Những tr&aacute;i nho n&agrave;y được h&aacute;i v&agrave;o hai tuần giữa th&aacute;ng mười năm 2012.</p>', '<p>RƯợu vang Le Petit Mouton được sản xuất từ 49% những tr&aacute;i nho thơm ngon của vườn nho nh&agrave; Ch&acirc;teau Mouton Rothschild. Những tr&aacute;i nho n&agrave;y được h&aacute;i v&agrave;o hai tuần giữa th&aacute;ng mười năm 2012.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"8FHV3Hqzozl3X8yweshRAZlPlTaEJfOB7IENueGd.jpeg\"]', 36, '750ml/chai', '750 ml/chai', '2012', 'nho 79% Cabernet Sauvignon, 19% Merlot, 2% Cabernet Franc', '2018-10-12 03:50:50', '2018-10-12 03:50:50', NULL, 0, 0),
(135, 34, 28, 40, 'Rượu Vang Đỏ Chilê - Novas 2013 (Garnacha)', 'ruou-vang-do-chile---novas-2013-garnacha', 99, NULL, '14%', 'Emiliana - Chile', '450000', '450000', '<p>Rượu vang đỏ Novas 2013 (Carnacha) được chắt lọc từ những tr&aacute;i nho từ ruộng Fundo Totihue ở ch&acirc;n d&atilde;y Andes, 100km về ph&iacute;a Nam Santiago.</p>', '<p>Rượu vang đỏ Novas 2013 (Carnacha) được chắt lọc từ những tr&aacute;i nho từ ruộng Fundo Totihue ở ch&acirc;n d&atilde;y Andes, 100km về ph&iacute;a Nam Santiago.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"I3uHnxqY9SrOGBirEmfZTKplVemGGXRB8RPLiwep.png\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2013', 'nho Garnacha, Syrah', '2018-10-12 03:52:17', '2018-10-12 03:52:17', NULL, 0, 0),
(136, 34, 28, 40, 'Rượu Vang Đỏ Pháp - Château Malescot Saint Exupery 2008', 'ruou-vang-do-phap---chateau-malescot-saint-exupery-2008', 99, NULL, '13,5%', 'Chauter Malescot', '2850000', '2850000', '<p>Rượu vang Ch&acirc;teau Malescot Saint Exup&eacute;ry 2008 c&oacute; hương thơm của quả m&acirc;m x&ocirc;i, nho đen, việt quất h&ograve;a quyện c&ugrave;ng gỗ tuyết t&ugrave;ng v&agrave; cam thảo do được ủ trong th&ugrave;ng gỗ sồi trước khi được đ&oacute;ng chai từ 14 - 16 th&aacute;ng</p>', '<p>Rượu vang Ch&acirc;teau Malescot Saint Exup&eacute;ry 2008 c&oacute; hương thơm của quả m&acirc;m x&ocirc;i, nho đen, việt quất h&ograve;a quyện c&ugrave;ng gỗ tuyết t&ugrave;ng v&agrave; cam thảo do được ủ trong th&ugrave;ng gỗ sồi trước khi được đ&oacute;ng chai từ 14 - 16 th&aacute;ng</p>', NULL, NULL, NULL, 0, 0, 0, '[\"R1PiEbCFqwhtQBmDPUabZsi4LsqEXwQGWr5kfqLQ.jpeg\"]', 36, '750ml/chai', '750ml/chai', '2008', 'nho 50% Cabernet Sauvignon, 35% Merlot, 10% Cabernet Franc e 5% Petit Verdot', '2018-10-12 03:55:32', '2018-10-12 03:55:32', NULL, 0, 0),
(137, 34, 28, 40, 'Rượu Vang Đỏ Chilê - Novas 2013 (Carmenere)', 'ruou-vang-do-chile---novas-2013-carmenere', 99, NULL, '14.5%', 'Emiliana - Chile', '450000', '450000', '<p>Rượu vang đỏ Novas 2013 được chắt lọc từ những tr&aacute;i nho thuộc ruộng Los Robles, trồng tại ch&acirc;n của v&ugrave;ng n&uacute;i Lo Moscoso; được ủ 12 th&aacute;ng trong th&ugrave;ng gỗ sồi.</p>', '<p>Rượu vang đỏ Novas 2013 được chắt lọc từ những tr&aacute;i nho thuộc ruộng Los Robles, trồng tại ch&acirc;n của v&ugrave;ng n&uacute;i Lo Moscoso; được ủ 12 th&aacute;ng trong th&ugrave;ng gỗ sồi.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"rXBHpZuDv2gFA5v9STRlNJVaKsgtcsKF2ulGCKWk.png\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2014', 'nho  Carmenere, Cabernet Sauvignon', '2018-10-12 03:57:33', '2018-10-12 03:57:33', NULL, 0, 0),
(138, 34, 28, 40, 'Rượu Vang Đỏ Chilê - Novas 2013 (Cabernet Sauvignon)', 'ruou-vang-do-chile---novas-2013-cabernet-sauvignon', 99, NULL, '14.5%', 'Emiliana - Chile', '450000', '450000', '<p>Vang đỏ Novas 2013 c&oacute; m&agrave;u hồng ngọc tươi s&aacute;ng. M&ugrave;i hương mang đặc trưng của phức hợp d&acirc;u ch&iacute;n, anh đ&agrave;o ch&iacute;n mọng, điểm xuyết nốt hương tuyết t&ugrave;ng v&agrave; bạc h&agrave;.</p>', '<p>Vang đỏ Novas 2013 c&oacute; m&agrave;u hồng ngọc tươi s&aacute;ng. M&ugrave;i hương mang đặc trưng của phức hợp d&acirc;u ch&iacute;n, anh đ&agrave;o ch&iacute;n mọng, điểm xuyết nốt hương tuyết t&ugrave;ng v&agrave; bạc h&agrave;.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"7s9mU3fmctdcD6yBcRzN2FVLFOdDCTtrjmeokpT8.png\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2013', 'nho  Cabernet Sauvignon, Merlot', '2018-10-12 03:59:33', '2018-10-12 03:59:33', NULL, 0, 0),
(139, 34, 28, 40, 'Rượu Vang Đỏ Chilê - Signos De Origen', 'ruou-vang-do-chile---signos-de-origen', 99, NULL, '14%', 'Emiliana - Chile', '780000', '780000', '<p>Rượu vang đỏ Chil&ecirc; Signos de Origen hồng ngọc &aacute;nh sắc đỏ của tr&aacute;i m&acirc;m x&ocirc;i, hương tươi mới h&ograve;a trộn từ hương d&acirc;u t&acirc;y, anh đ&agrave;o, đi c&ugrave;ng nốt hương tuyết t&ugrave;ng.</p>', '<p>Rượu vang đỏ Chil&ecirc; Signos de Origen hồng ngọc &aacute;nh sắc đỏ của tr&aacute;i m&acirc;m x&ocirc;i, hương tươi mới h&ograve;a trộn từ hương d&acirc;u t&acirc;y, anh đ&agrave;o, đi c&ugrave;ng nốt hương tuyết t&ugrave;ng.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"IOSbGsgEByIdx7f2PDAS2W8D18oE2TtF6qT3Z8vS.png\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'Nho Cabernet Sauvignon', '2018-10-12 04:00:51', '2018-10-12 04:00:51', NULL, 0, 0),
(140, 34, 28, 40, 'Rượu Vang Trắng Chilê - Novas 2015', 'ruou-vang-trang-chile---novas-2015', 99, NULL, '14.5%', 'Emiliana - Chile', '450000', '450000', '<p>Rượu vang đỏ Novas 2015 được chắt lọc từ những tr&aacute;i nho thuộc ruộng Fundo Casablanca, La Vinilla v&agrave; ruộng La Quebrada tại ch&acirc;n đồi d&atilde;y Coastal, Chil&ecirc;</p>', '<p>Rượu vang đỏ Novas 2015 được chắt lọc từ những tr&aacute;i nho thuộc ruộng Fundo Casablanca, La Vinilla v&agrave; ruộng La Quebrada tại ch&acirc;n đồi d&atilde;y Coastal, Chil&ecirc;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"P2PaojCZRwc3MQTQ7IkxmDmzZrCCyqVr0VqOeX39.png\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2015', 'nho Chardonnay', '2018-10-12 04:03:50', '2018-10-12 04:03:50', NULL, 0, 0),
(141, 34, 28, 40, 'Rượu Vang Đỏ Ý - Primitivo Folle Luccarelli', 'ruou-vang-do-y---primitivo-folle-luccarelli', 99, NULL, '14%', 'Farnese - Italy', '1700000', '1700000', '<p>Primitivo Folle Luccarelli l&agrave; thứ rượu vang đỏ đặc trưng nhất của v&ugrave;ng Puglia, Sản xuất từ 100% nho&nbsp;<a href=\"http://wineplaza.vn/giong-nho-primitivo.html\">Primitivo</a>, gi&agrave;u hương vị v&agrave; c&oacute; cấu tr&uacute;c vang ho&agrave;n hảo.&nbsp;</p>', '<p>Primitivo Folle Luccarelli l&agrave; thứ rượu vang đỏ đặc trưng nhất của v&ugrave;ng Puglia, Sản xuất từ 100% nho&nbsp;<a href=\"http://wineplaza.vn/giong-nho-primitivo.html\">Primitivo</a>, gi&agrave;u hương vị v&agrave; c&oacute; cấu tr&uacute;c vang ho&agrave;n hảo.&nbsp;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"vEHJUTe5gkASoKbwPcULL0emmpBk4xKwl4t3ZtrS.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho Primitivo', '2018-10-12 04:05:20', '2018-10-12 04:05:20', NULL, 0, 0),
(142, 34, 28, 40, 'Rượu Vang Nổ Ý - 9.5 Cold Wine Sweet - Astoria', 'ruou-vang-no-y---95-cold-wine-sweet---astoria', 99, NULL, '6.5 - 7.5%', 'Astoria - Ý', '490000', '490000', '<p>Rượu vang nổ 9.5 Cold Wine Sweet - Astoria c&oacute; m&agrave;u v&agrave;ng rơm &aacute;nh xanh tươi s&aacute;ng v&agrave; hương thơm đặc trưng của giống nho kh&ocirc; được trồng tr&ecirc;n sườn đồi của v&ugrave;ng Treviso tại &Yacute;. Hương vị s&acirc;u sắc, tế nhị, ngọt ng&agrave;o v&agrave; độ sủi l&acirc;u</p>', '<p>Rượu vang nổ 9.5 Cold Wine Sweet - Astoria c&oacute; m&agrave;u v&agrave;ng rơm &aacute;nh xanh tươi s&aacute;ng v&agrave; hương thơm đặc trưng của giống nho kh&ocirc; được trồng tr&ecirc;n sườn đồi của v&ugrave;ng Treviso tại &Yacute;. Hương vị s&acirc;u sắc, tế nhị, ngọt ng&agrave;o v&agrave; độ sủi l&acirc;u</p>', 10, '441000', NULL, 1, 0, 0, '[\"tjiE4XqHB9t8mRoSmjYSsoPiheMoK2Tag3aTZFIW.jpeg\"]', 36, '750ml/chai', '750ml', '2018', 'nho muscat', '2018-10-12 04:06:35', '2018-10-12 05:03:03', NULL, 0, 0),
(143, 34, 28, 40, 'Rượu Vang Đỏ Australia - Unedited Shiraz 2010', 'ruou-vang-do-australia---unedited-shiraz-2010', 99, NULL, '15%', 'SHINGLEBACK - Úc', '2000000', '2000000', '<p>Rượu vang Unedited Shiraz 2010 Full - Body. Nho l&agrave;m rượu c&oacute; tuổi tr&ecirc;n 10 năm, rượu được ủ 6 năm th&ugrave;ng gỗ sồi cũ đảm bảo t&iacute;nh mạnh mẽ, hương vị s&acirc;u, mượt m&agrave; của anh đ&agrave;o đen, d&acirc;u đen, hoa cam, hoa hồi.</p>', '<p>Rượu vang Unedited Shiraz 2010 Full - Body. Nho l&agrave;m rượu c&oacute; tuổi tr&ecirc;n 10 năm, rượu được ủ 6 năm th&ugrave;ng gỗ sồi cũ đảm bảo t&iacute;nh mạnh mẽ, hương vị s&acirc;u, mượt m&agrave; của anh đ&agrave;o đen, d&acirc;u đen, hoa cam, hoa hồi.</p>', 10, '1800000', NULL, 1, 0, 0, '[\"xQgNzc7OFwZnJ8ELZgbNigJrXWBDs3LdQf5L1ptD.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2010', 'nho Shiraz', '2018-10-12 04:08:18', '2018-10-12 05:02:10', NULL, 0, 0),
(144, 34, 28, 40, 'Rượu Vang Đỏ Ý - 2012 Primitivo Ripa Di Sotto', 'ruou-vang-do-y---2012-primitivo-ripa-di-sotto', 99, NULL, '15%', 'Provinco - Italy', '1500000', '1500000', '<p>Primitivo Ripa di Sotto l&agrave; rượu vang &Yacute; được sản xuất từ giống nho&nbsp;<a href=\"http://wineplaza.vn/giong-nho-primitivo.html\">Primitivo</a>. V&igrave; vậy rượu vang Primitivo Ripa di Sotto c&oacute; hương vị m&atilde;nh liệt của mận v&agrave; tr&aacute;i c&acirc;y rừng hương gỗ sồi thanh lịch kết hợp với một ch&uacute;t cay l&agrave;m cho rượu vang Primitivo Ripa di Sotto c&agrave;ng th&ecirc;m th&uacute; vị.</p>', '<p>Primitivo Ripa di Sotto l&agrave; rượu vang &Yacute; được sản xuất từ giống nho&nbsp;<a href=\"http://wineplaza.vn/giong-nho-primitivo.html\">Primitivo</a>. V&igrave; vậy rượu vang Primitivo Ripa di Sotto c&oacute; hương vị m&atilde;nh liệt của mận v&agrave; tr&aacute;i c&acirc;y rừng hương gỗ sồi thanh lịch kết hợp với một ch&uacute;t cay l&agrave;m cho rượu vang Primitivo Ripa di Sotto c&agrave;ng th&ecirc;m th&uacute; vị.</p>', NULL, NULL, NULL, 0, 1, 0, '[\"uesSPLHM6yrpdSAWhldAcut2nVorrkXLuN7jaszS.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2012', 'nho Primitivo', '2018-10-12 04:09:57', '2018-10-12 05:01:40', NULL, 0, 0),
(145, 34, 28, 40, 'Rượu Vang Nổ - Brut Luxury Pink Astoria', 'ruou-vang-no---brut-luxury-pink-astoria', 99, NULL, '10.5 - 11.5%', 'Astoria - Ý', '999999', '999999', '<p>Rượu vang nổ Brut Luxury Pink Astoria c&oacute; m&agrave;u v&agrave;ng &aacute;nh xanh. L&agrave; biểu tượng của sự thanh tao, tinh tế, vi&ecirc;n hồng ngọc trong c&aacute;c buổi triến l&atilde;m rượu hay c&aacute;c buổi tiệc sang trọng. Hương vị tr&aacute;i c&acirc;y, sống động, h&agrave;i h&ograve;a, độ sủi l&acirc;u.</p>', '<p>Rượu vang nổ Brut Luxury Pink Astoria c&oacute; m&agrave;u v&agrave;ng &aacute;nh xanh. L&agrave; biểu tượng của sự thanh tao, tinh tế, vi&ecirc;n hồng ngọc trong c&aacute;c buổi triến l&atilde;m rượu hay c&aacute;c buổi tiệc sang trọng. Hương vị tr&aacute;i c&acirc;y, sống động, h&agrave;i h&ograve;a, độ sủi l&acirc;u.</p>', NULL, NULL, NULL, 0, 1, 0, '[\"OWiRM66pC9MLlyzyy1o8WyHx7topANLyeNmqGuma.jpeg\"]', 36, '750ml/chai', '750ml', '2018', 'nho Glera, Pinot Blanc, Traminer', '2018-10-12 04:11:22', '2018-10-12 05:01:33', NULL, 0, 0),
(146, 34, 28, 40, 'Rượu Vang Nổ Ý - Astoria Luxury Gold Vino Spumante Brut', 'ruou-vang-no-y---astoria-luxury-gold-vino-spumante-brut', 99, NULL, '11%', 'Astoria - Ý', '650000', '650000', '<p>Rượu vang nổ Astoria Luxury Gold Vino Spumante Brut c&oacute; độ sủi bọn k&eacute;o d&agrave;i. Hương vị thanh tao mượt m&agrave; của tr&aacute;i l&ecirc; ch&iacute;n. Ph&ugrave; hợp để phục vụ trong những bữa tiệc sang trong</p>', '<p>Rượu vang nổ Astoria Luxury Gold Vino Spumante Brut c&oacute; độ sủi bọn k&eacute;o d&agrave;i. Hương vị thanh tao mượt m&agrave; của tr&aacute;i l&ecirc; ch&iacute;n. Ph&ugrave; hợp để phục vụ trong những bữa tiệc sang trong</p>', NULL, NULL, NULL, 0, 1, 0, '[\"phOjku3gEoaEh8XnBLePLpOcbDMJYJiyD5N2Uuz3.jpeg\"]', 36, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho  Prosecco/Glera, Chardonnay', '2018-10-12 04:20:56', '2018-10-12 05:01:26', NULL, 0, 0),
(147, 34, 28, 40, 'Rượu Vang Nổ Italy - 9.5 Color Wine Red Sweet', 'ruou-vang-no-italy---95-color-wine-red-sweet', 99, NULL, '6.5 - 7.5%', 'Astoria - Ý', '490000', '490000', '<p>Được sản xuất từ những tr&aacute;i nho Muscat thơm ngon được h&aacute;i từ những gốc nho 15-18 năm tuổi đến từ v&ugrave;ng đất &ldquo;Val de Brun&rdquo;. Hương vị mạnh mẽ tinh tế v&agrave; ngọt ng&agrave;o</p>', '<p>Được sản xuất từ những tr&aacute;i nho Muscat thơm ngon được h&aacute;i từ những gốc nho 15-18 năm tuổi đến từ v&ugrave;ng đất &ldquo;Val de Brun&rdquo;. Hương vị mạnh mẽ tinh tế v&agrave; ngọt ng&agrave;o</p>', NULL, NULL, NULL, 0, 1, 0, '[\"js3ogPEONoQCaFMC3voOxx8LfwAFpgxWeDGwmgrM.jpeg\"]', 36, '750ml/chai', '750ml', '2018', 'nho muscat', '2018-10-12 04:42:55', '2018-10-12 05:01:13', NULL, 0, 0),
(148, 34, 28, 40, 'Rượu Vang Nổ - 9.5 - Cold Wine PINK - Astoria', 'ruou-vang-no---95---cold-wine-pink---astoria', 99, NULL, '9 - 10%', 'Astoria - Ý', '999999', '999999', '<p style=\"text-align: justify;\">Được sản xuất từ những tr&aacute;i nho Mucast &nbsp;đặc trưng của v&ugrave;ng Veneto. Những gốc nho ở đ&acirc;y c&oacute; tuổi từ 8 đến 10 năm tuổi. Rượu được sản xuất theo kỹ thuật &nbsp;tốt để đảm bảo giữ lại to&agrave;n vẹn hương vị tr&aacute;i c&acirc;y. Rượu c&oacute; m&agrave;u hồng mềm mại, m&aacute;t, tinh tế, sống động, hương thơm mạnh mẽ. Ph&ugrave; hợp d&ugrave;ng khai vị.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', '<p style=\"text-align: justify;\">Được sản xuất từ những tr&aacute;i nho Mucast &nbsp;đặc trưng của v&ugrave;ng Veneto. Những gốc nho ở đ&acirc;y c&oacute; tuổi từ 8 đến 10 năm tuổi. Rượu được sản xuất theo kỹ thuật &nbsp;tốt để đảm bảo giữ lại to&agrave;n vẹn hương vị tr&aacute;i c&acirc;y. Rượu c&oacute; m&agrave;u hồng mềm mại, m&aacute;t, tinh tế, sống động, hương thơm mạnh mẽ. Ph&ugrave; hợp d&ugrave;ng khai vị.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"IHjITRzfYDbhYFWblA8e2hywN0D43CqS0hFl5WEp.jpeg\"]', 39, '750ml/chai', '750ml/chai, 6 chai/thùng', '2018', 'nho muscat', '2018-10-13 02:43:07', '2018-10-13 02:43:07', NULL, 0, 0);
INSERT INTO `product` (`id`, `type_id`, `kind_id`, `trademark_id`, `name`, `slug`, `quantity`, `effect`, `concentrations`, `producer`, `price`, `selling_price`, `content`, `description`, `discount_percent`, `discount_price`, `gift`, `is_discount`, `is_special`, `is_new`, `image`, `origin_id`, `volume`, `capacity`, `year`, `material`, `created_at`, `updated_at`, `deleted_at`, `is_deleted`, `is_gift`) VALUES
(149, 34, 28, 40, 'Rượu Vang Đỏ Ý - Santi Nobile 96Points', 'ruou-vang-do-y---santi-nobile-96points', 99, NULL, '14.5%', 'pr', '999999', '999999', '<p>Rượu vang Santi Nobile 96Points l&agrave; loại rượu nổi tiếng với chất lượng cao của v&ugrave;ng Trapanistreeck. Sự pha trộn ấn tượng của hai giống nho Nero d\'Avola,&nbsp;<u><a href=\"http://wineplaza.vn/giong-nho-cabernet-sauvignon.html\">Cabernet Sauvignon</a>&nbsp;</u>tạo n&ecirc;n m&ugrave;i hương ấm &aacute;p của c&aacute;c loại tr&aacute;i c&acirc;y ch&iacute;n, hương anh đ&agrave;o v&agrave; m&ugrave;i hương lan tỏa rộng</p>', '<p>Rượu vang Santi Nobile 96Points l&agrave; loại rượu nổi tiếng với chất lượng cao của v&ugrave;ng Trapanistreeck. Sự pha trộn ấn tượng của hai giống nho Nero d\'Avola,&nbsp;<u><a href=\"http://wineplaza.vn/giong-nho-cabernet-sauvignon.html\">Cabernet Sauvignon</a>&nbsp;</u>tạo n&ecirc;n m&ugrave;i hương ấm &aacute;p của c&aacute;c loại tr&aacute;i c&acirc;y ch&iacute;n, hương anh đ&agrave;o v&agrave; m&ugrave;i hương lan tỏa rộng</p>', NULL, NULL, NULL, 0, 0, 0, '[\"ARz7XQpMtRwS0Wi0Xf9SpOOZpJWWqq1qqKi0WRQe.jpeg\"]', 39, 'Provinco - Italy', '750ml/chai, 6 chai/thùng', '2018', 'nho Nero d\'Avola, Cabernet Sauvignon', '2018-10-13 02:44:39', '2018-10-13 02:44:39', NULL, 0, 0),
(150, 34, 28, 40, 'Rượu Vang Đỏ Ý - Rosso Cuvée Ripa Di Sotto', 'ruou-vang-do-y---rosso-cuvee-ripa-di-sotto', 99, NULL, '15,5%', 'Provinco - Italy', '1650000', '1650000', '<p style=\"text-align: justify;\">Rượu vang đỏ Rosso Cuv&eacute;e Ripa di Sotto c&oacute; m&agrave;u đỏ t&iacute;m v&agrave; m&ugrave;i thơm mạnh mẽ, mang hương vị của v&ugrave;ng Địa Trung Hải. Vị vang ngon, nồng độ cồn v&agrave; tannin cao l&agrave; đặc trưng của rượu được sản xuất từ giống nho&nbsp;<a href=\"http://wineplaza.vn/giong-nho-primitivo.html\">Primitivo</a></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', '<p style=\"text-align: justify;\">Rượu vang đỏ Rosso Cuv&eacute;e Ripa di Sotto c&oacute; m&agrave;u đỏ t&iacute;m v&agrave; m&ugrave;i thơm mạnh mẽ, mang hương vị của v&ugrave;ng Địa Trung Hải. Vị vang ngon, nồng độ cồn v&agrave; tannin cao l&agrave; đặc trưng của rượu được sản xuất từ giống nho&nbsp;<a href=\"http://wineplaza.vn/giong-nho-primitivo.html\">Primitivo</a></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"WzZVH9gqFvDkUJMuuUjG1PqvdOvzgjes8cFgQu9y.jpeg\"]', 39, '750ml/chai', '750ml', '2018', 'nho 85% Primitivo', '2018-10-13 02:46:12', '2018-10-13 02:46:12', NULL, 0, 0),
(151, 34, 28, 40, 'Rượu Vang Đỏ Ý - Megale 2014 NegroAmaro Salento - Giorgio', 'ruou-vang-do-y---megale-2014-negroamaro-salento---giorgio', 99, NULL, '14%', 'Cantine San Giorgio - Italy', '999999', '999999', '<p>Rượu vang đỏ Megale 2014&nbsp;<a href=\"http://wineplaza.vn/giong-nho-negroamaro.html\">NegroAmaro</a><a href=\"http://wineplaza.vn/vung-dat-cua-ruou-vang-puglia-italy.html\">Salento</a>&nbsp;- Giorgio ( Negroamaro) được chiết xuất từ những tr&aacute;i nho Negroamaro trồng tại vườn nho ri&ecirc;ng của gia đ&igrave;nh&nbsp;<a href=\"http://wineplaza.vn/hang-ruou-vang-y-cantine-tinazzi.html\">Tinazzi</a>. Hương thơm tr&aacute;i c&acirc;y, hương mận v&agrave; hương anh đ&agrave;o.</p>', '<p>Rượu vang đỏ Megale 2014&nbsp;<a href=\"http://wineplaza.vn/giong-nho-negroamaro.html\">NegroAmaro</a><a href=\"http://wineplaza.vn/vung-dat-cua-ruou-vang-puglia-italy.html\">Salento</a>&nbsp;- Giorgio ( Negroamaro) được chiết xuất từ những tr&aacute;i nho Negroamaro trồng tại vườn nho ri&ecirc;ng của gia đ&igrave;nh&nbsp;<a href=\"http://wineplaza.vn/hang-ruou-vang-y-cantine-tinazzi.html\">Tinazzi</a>. Hương thơm tr&aacute;i c&acirc;y, hương mận v&agrave; hương anh đ&agrave;o.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"to98SLKi2AarO17tWikmvPa1OPqTiUpNuiGJiNKC.jpeg\"]', 39, '750ml/chai', '750ml/chai, 6 chai/thùng', '2014', 'nho Negro Amaro', '2018-10-13 02:47:58', '2018-10-13 02:47:58', NULL, 0, 0),
(152, 34, 28, 40, 'Rượu Vang Đỏ Ý - Manoro Negroamaro Puglia', 'ruou-vang-do-y---manoro-negroamaro-puglia', 99, NULL, '13%', 'Puglia', '450000', '450000', '<p>Rượu vang đỏ &Yacute; Manoro&nbsp;<a href=\"http://wineplaza.vn/giong-nho-negroamaro.html\">Negroamaro</a>&nbsp;được sản xu&acirc;́t theo quy trình thủ c&ocirc;ng tinh tế. Nho được h&aacute;i bằng tay, thời gian v&agrave;o lúc s&aacute;ng sớm, những ch&ugrave;m nho tốt nhất được lựa chọn chuyển về nh&agrave; m&aacute;y. Manoro Negroamaro c&oacute; m&agrave;u đỏ ruby, hương thơm tinh tế l&agrave;m say đắm người uống.</p>', '<p>Rượu vang đỏ &Yacute; Manoro&nbsp;<a href=\"http://wineplaza.vn/giong-nho-negroamaro.html\">Negroamaro</a>&nbsp;được sản xu&acirc;́t theo quy trình thủ c&ocirc;ng tinh tế. Nho được h&aacute;i bằng tay, thời gian v&agrave;o lúc s&aacute;ng sớm, những ch&ugrave;m nho tốt nhất được lựa chọn chuyển về nh&agrave; m&aacute;y. Manoro Negroamaro c&oacute; m&agrave;u đỏ ruby, hương thơm tinh tế l&agrave;m say đắm người uống.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"on6ntjO3rXKgL2hGHWVET8g6fbeUTCm4OxCUT81v.jpeg\"]', 39, '750ml/chai', '750ml x 06chai/thùng', '2018', 'nho Negro Amaro', '2018-10-13 02:49:20', '2018-10-13 02:49:20', NULL, 0, 0),
(153, 34, 28, 40, 'Rượu Vang Nổ Pháp - Opera Blanc De Blancs Brut', 'ruou-vang-no-phap---opera-blanc-de-blancs-brut', 99, NULL, '11%', 'CFGV (Compagnie Francaise des Grands Vins) - Pháp', '325000', '325000', '<p>Rượu vang nổ Ph&aacute;p - Opera Blanc de Blancs Brut c&oacute; m&agrave;u v&agrave;ng rực rỡ, hương thơm nhẹ, hương t&aacute;o xanh, hương vỏ tr&aacute;i c&acirc;y cam, qu&yacute;t. Ph&ugrave; hợp để d&ugrave;ng khai vị trong c&aacute;c bữa tiệc.</p>', '<p>Rượu vang nổ Ph&aacute;p - Opera Blanc de Blancs Brut c&oacute; m&agrave;u v&agrave;ng rực rỡ, hương thơm nhẹ, hương t&aacute;o xanh, hương vỏ tr&aacute;i c&acirc;y cam, qu&yacute;t. Ph&ugrave; hợp để d&ugrave;ng khai vị trong c&aacute;c bữa tiệc.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"OWkwyT27y1vXncjnvMlSdumvBPAg33RLt8eXlH6N.jpeg\"]', 40, '1500ml', '1500ml/chai, 04 chai/thùng', '2018', 'nho trắng', '2018-10-13 02:53:11', '2018-10-13 02:53:11', NULL, 0, 0),
(154, 34, 28, 40, 'Rượu Vang Đỏ Tây Ban Nha - Santalba Amaro 2014', 'ruou-vang-do-tay-ban-nha---santalba-amaro-2014', 99, NULL, '15,5%', 'Santalba', '2250000', '2250000', '<p>Santalba Amaro 2014 l&agrave; chai rượu vang đại diện cho niềm tự h&agrave;o của h&atilde;ng sản xuất Santaba. Với tất cả những kinh nghiệm qu&yacute; b&aacute;u được đ&uacute;c kết từ nhiều năm, nh&agrave; sản xuất n&agrave;y đ&atilde; tạo ra những giọt rượu vang ho&agrave;n hảo trong chai rượu vang Santalba Amaro đạt chuẩn nh&atilde;n rượu vang cao cấp nhất của T&acirc;y Ban Nha - DOC.</p>', '<p>Santalba Amaro 2014 l&agrave; chai rượu vang đại diện cho niềm tự h&agrave;o của h&atilde;ng sản xuất Santaba. Với tất cả những kinh nghiệm qu&yacute; b&aacute;u được đ&uacute;c kết từ nhiều năm, nh&agrave; sản xuất n&agrave;y đ&atilde; tạo ra những giọt rượu vang ho&agrave;n hảo trong chai rượu vang Santalba Amaro đạt chuẩn nh&atilde;n rượu vang cao cấp nhất của T&acirc;y Ban Nha - DOC.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"kF25amI5KCUiHzR8jHWUo5NpPLLT7PhiFiiWB81l.jpeg\"]', 41, '750ml/chai', '750 ml/chai', '2014', 'nho Tempranillo, Garnacha', '2018-10-13 02:56:32', '2018-10-13 02:56:32', NULL, 0, 0),
(155, 34, 28, 39, 'Rượu Vang Trắng New Zealend - Giesen Sauvignon Blanc 2013', 'ruou-vang-trang-new-zealend---giesen-sauvignon-blanc-2013', 99, NULL, '12.5%', 'New Zealand', '350000', '350000', '<p>Rượu vang trắng Giesen Sauvignon Blanc 2014 l&agrave; sự h&ograve;a chộn tuyệt vời của hương thảo dược kh&ocirc; lẫn hương l&aacute; chanh, hương bưởi hồng. Hương vị sắc n&eacute;t tươi s&aacute;ng, chua ngon ngọt. Sự lựa chọn ho&agrave;n hảo cho c&aacute;c buổi d&atilde; ngoại.</p>', '<p>Rượu vang trắng Giesen Sauvignon Blanc 2014 l&agrave; sự h&ograve;a chộn tuyệt vời của hương thảo dược kh&ocirc; lẫn hương l&aacute; chanh, hương bưởi hồng. Hương vị sắc n&eacute;t tươi s&aacute;ng, chua ngon ngọt. Sự lựa chọn ho&agrave;n hảo cho c&aacute;c buổi d&atilde; ngoại.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"lgeefGtKlWTIIp1Ya7jjqU7ZFkF4wJsv1eYgpWey.jpeg\"]', 42, '750ml/chai', '750ml/chai, 6 chai/thùng', '2013', 'nho Sauvignon Blanc', '2018-10-13 03:04:14', '2018-10-13 03:04:14', NULL, 0, 0),
(156, 34, 28, 40, 'Rượu Vang Đỏ Tây Ban Nha - Marques De Tejares 2014', 'ruou-vang-do-tay-ban-nha---marques-de-tejares-2014', 99, NULL, '14.5%', 'Bodega Finca Los Aljibes', '825000', '825000', '<p>Marques De Tejares 2014&nbsp;c&oacute;&nbsp;h&igrave;nh thức sang trọng, hương vị mạnh mẽ. Chai rượu vang n&agrave;y cột mốc đ&aacute;nh dấu&nbsp;95 năm thời kỳ phục hưng v&agrave; ph&aacute;t triển hưng thịnh của l&acirc;u đ&agrave;i Chinchilla de Monte-Arag&oacute;n đ&atilde; từng bị l&atilde;ng qu&ecirc;n.</p>\r\n<p>&nbsp;</p>', '<p>Marques De Tejares 2014&nbsp;c&oacute;&nbsp;h&igrave;nh thức sang trọng, hương vị mạnh mẽ. Chai rượu vang n&agrave;y cột mốc đ&aacute;nh dấu&nbsp;95 năm thời kỳ phục hưng v&agrave; ph&aacute;t triển hưng thịnh của l&acirc;u đ&agrave;i Chinchilla de Monte-Arag&oacute;n đ&atilde; từng bị l&atilde;ng qu&ecirc;n.</p>\r\n<p>&nbsp;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"FOkHnaxaSla6gma0EAmxnniSbFlxKNCPyKRnBBcP.jpeg\"]', 41, '750ml/chai', '750ml/chai', '2014', 'nho Cabernet Sauvignon, Temparanillo, Petit Verdot và Garnacha Tintorera', '2018-10-13 03:06:19', '2018-10-13 03:06:19', NULL, 0, 0),
(157, 34, 28, 40, 'Rượu Vang Đỏ Ý - La Passione Primitivo Del Salento 2014', 'ruou-vang-do-y---la-passione-primitivo-del-salento-2014', 99, NULL, '15,5%', 'Feudi Salentini', '1650000', '1650000', '<p>&ldquo;Nếu ai đ&atilde; từng y&ecirc;u th&iacute;ch chai vang Pazzia th&igrave; chắc chắn sẽ bị m&ecirc; hoặc bởi La Passione&rdquo;. Được sản xuất từ giống nho primitivo huyền thoại của v&ugrave;ng&nbsp;<a href=\"http://wineplaza.vn/vung-dat-cua-ruou-vang-puglia-italy.html\">Salento</a>&nbsp;-Italia. Gia đ&igrave;nh Feudi Salentini &nbsp;đ&atilde; chọn lọc kỹ lưỡng những tr&aacute;i nho ngon nhất tr&ecirc;n c&aacute;c c&acirc;y nho cổ thụ c&ograve;n s&oacute;t lại sau Đại chiến Thế Giới thứ II để l&agrave;m ra chai vang đỏ hảo hạng La Passione.</p>', '<p>&ldquo;Nếu ai đ&atilde; từng y&ecirc;u th&iacute;ch chai vang Pazzia th&igrave; chắc chắn sẽ bị m&ecirc; hoặc bởi La Passione&rdquo;. Được sản xuất từ giống nho primitivo huyền thoại của v&ugrave;ng&nbsp;<a href=\"http://wineplaza.vn/vung-dat-cua-ruou-vang-puglia-italy.html\">Salento</a>&nbsp;-Italia. Gia đ&igrave;nh Feudi Salentini &nbsp;đ&atilde; chọn lọc kỹ lưỡng những tr&aacute;i nho ngon nhất tr&ecirc;n c&aacute;c c&acirc;y nho cổ thụ c&ograve;n s&oacute;t lại sau Đại chiến Thế Giới thứ II để l&agrave;m ra chai vang đỏ hảo hạng La Passione.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"J3lDXOTEkK5N0wlgQR16N1fdO5hBfuHyeF2GFUG6.jpeg\"]', 39, '750ml/chai', '750ml', '2014', 'nho Primitivo', '2018-10-13 03:09:28', '2018-10-13 03:09:28', NULL, 0, 0),
(158, 34, 28, 40, 'Rượu Vang Đỏ Ý – Avalon (Primitivo Di Manduria 2012)', 'ruou-vang-do-y-avalon-primitivo-di-manduria-2012', 99, NULL, '16.5%', 'Feudi Salentini', '2000000', '2000000', '<p>Avalon &ndash; H&ograve;n đảo thi&ecirc;ng huyền b&iacute; gắn liền với vị vua Athur vĩ đại của nước Anh v&agrave;o thế kỷ thứ 6. Avalon cũng được đặt t&ecirc;n cho chai vang huyền thoại trong lịch sử của nh&agrave; sản xuất rượu vang lừng danh v&ugrave;ng Salento Italia - Feudi Salentini. C&oacute; thể n&oacute;i: \"Chai rượu vang Avalon chất chứa tất cả những tinh hoa, t&acirc;m huyết v&agrave; t&igrave;nh y&ecirc;u của nh&agrave; sản xuất\".&nbsp;</p>', '<p>Avalon &ndash; H&ograve;n đảo thi&ecirc;ng huyền b&iacute; gắn liền với vị vua Athur vĩ đại của nước Anh v&agrave;o thế kỷ thứ 6. Avalon cũng được đặt t&ecirc;n cho chai vang huyền thoại trong lịch sử của nh&agrave; sản xuất rượu vang lừng danh v&ugrave;ng Salento Italia - Feudi Salentini. C&oacute; thể n&oacute;i: \"Chai rượu vang Avalon chất chứa tất cả những tinh hoa, t&acirc;m huyết v&agrave; t&igrave;nh y&ecirc;u của nh&agrave; sản xuất\".&nbsp;</p>', NULL, NULL, NULL, 0, 0, 0, '[\"5CoodsY9ilOKMWBn44HK23ptJE1sr2nQQP7crmui.jpeg\"]', 39, '750ml/chai', '750ml', '2012', 'nho Primitivo', '2018-10-13 03:11:07', '2018-10-13 03:11:07', NULL, 0, 0),
(159, 34, 28, 40, 'Rượu Vang Đỏ Chile - Chaku Merlot 2015', 'ruou-vang-do-chile---chaku-merlot-2015', 99, NULL, '13,5%', 'Vignobles', '235000', '235000', '<p><strong>Chaku Merlot</strong>&nbsp;l&agrave; sự kết hợp h&agrave;i h&ograve;a giữa t&iacute;m v&agrave; sắc đỏ ruby, nồng n&agrave;n hương tr&aacute;i c&acirc;y ch&iacute;n mọng của mận, anh đ&agrave;o, phảng phất hương ti&ecirc;u đen, vani v&agrave; c&ugrave;ng h&ograve;a quyện với hương tanin mềm mại quen thuộc lan tỏa khắp khoang miệng, đậm chất nho Merlot - Chile.</p>', '<p><strong>Chaku Merlot</strong>&nbsp;l&agrave; sự kết hợp h&agrave;i h&ograve;a giữa t&iacute;m v&agrave; sắc đỏ ruby, nồng n&agrave;n hương tr&aacute;i c&acirc;y ch&iacute;n mọng của mận, anh đ&agrave;o, phảng phất hương ti&ecirc;u đen, vani v&agrave; c&ugrave;ng h&ograve;a quyện với hương tanin mềm mại quen thuộc lan tỏa khắp khoang miệng, đậm chất nho Merlot - Chile.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"o3eNpOtFFePm81lrpbDo3X0M6nOm7PnNwdwjNEhI.jpeg\"]', 38, '750ml/chai', '750ml/chai,6 chai/thùng', '2015', 'nho Merlot', '2018-10-13 03:12:50', '2018-10-13 03:12:50', NULL, 0, 0),
(160, 34, 28, 40, 'Rượu Vang Đỏ Chile - Mousai Chardornay 2015', 'ruou-vang-do-chile---mousai-chardornay-2015', 99, NULL, '13,5%', 'La Ronciere', '450000', '450000', '<p><strong>Mousai Chardonay</strong>&nbsp;c&oacute; m&agrave;u v&agrave;ng rơm, rượu c&oacute; vị chua vừa phải, hương thơm tr&aacute;i c&acirc;y nhiệt đới nồng n&agrave;n m&atilde;nh liệt như chanh d&acirc;y v&agrave; m&atilde;ng cầu t&acirc;y, nổi bật nhất l&agrave; m&ugrave;i hương kho&aacute;ng chất mang đến cho người thưởng thức một sự tươi m&aacute;t.</p>', '<p><strong>Mousai Chardonay</strong>&nbsp;c&oacute; m&agrave;u v&agrave;ng rơm, rượu c&oacute; vị chua vừa phải, hương thơm tr&aacute;i c&acirc;y nhiệt đới nồng n&agrave;n m&atilde;nh liệt như chanh d&acirc;y v&agrave; m&atilde;ng cầu t&acirc;y, nổi bật nhất l&agrave; m&ugrave;i hương kho&aacute;ng chất mang đến cho người thưởng thức một sự tươi m&aacute;t.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"V1rNaNB0d0Nf4iFbLjcKKc3LLTKIIwc8zRJVHLbU.png\"]', 38, '750ml', '750ml/chai, 6 chai/thùng', '2015', 'nho Chardonnay', '2018-10-13 03:18:00', '2018-10-13 03:18:00', NULL, 0, 0),
(161, 34, 28, 40, 'Rượu Vang Đỏ Ý - Phonico', 'ruou-vang-do-y---phonico', 99, NULL, '14.5%', 'Feudi Salentini', '850000', '850000', '<p>Phonico trong tiếng anh l&agrave; Phoenix - một thực thể bất tử, bất khả x&acirc;m phạm, được sinh ra từ sự ho&agrave; hợp của đất trời. L&agrave; một con vật trong thần thoại ngự trị tr&ecirc;n tất cả c&aacute;c lo&agrave;i chim kh&aacute;c. N&eacute;t y&ecirc;u kiều v&agrave; tinh tế đại diện cho h&igrave;nh ảnh người phụ nữ đầy quyền lực, ki&ecirc;u sa.</p>', '<p>Phonico trong tiếng anh l&agrave; Phoenix - một thực thể bất tử, bất khả x&acirc;m phạm, được sinh ra từ sự ho&agrave; hợp của đất trời. L&agrave; một con vật trong thần thoại ngự trị tr&ecirc;n tất cả c&aacute;c lo&agrave;i chim kh&aacute;c. N&eacute;t y&ecirc;u kiều v&agrave; tinh tế đại diện cho h&igrave;nh ảnh người phụ nữ đầy quyền lực, ki&ecirc;u sa.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"CcZv9TB10LLxExpfzLgdMEf1jJaDEJpC5nrXeHKy.jpeg\"]', 39, '750ml/chai', '750ml/chai,6 chai/thùng', '2015', 'nho Primitivo', '2018-10-13 03:19:13', '2018-10-13 03:19:13', NULL, 0, 0),
(162, 34, 28, 40, 'Rượu Vang Đỏ Chile - Cantoalba Shiraz', 'ruou-vang-do-chile---cantoalba-shiraz', 99, NULL, '13,5%', 'La Ronciere', '32000', '32000', '<p><strong>Cantoalba Shiraz</strong>&nbsp;c&oacute; m&agrave;u đỏ đậm của ph&uacute;c bồn tử ch&iacute;n, bởi được ủ trong th&ugrave;ng gỗ sồi Ph&aacute;p n&ecirc;n Cantoalba Shiraz v&ocirc; c&ugrave;ng quyến rũ với m&ugrave;i gỗ v&agrave; hương thơm tr&aacute;i c&acirc;y của hạnh nh&acirc;n, ph&uacute;c bồn tử v&agrave; quả m&acirc;m x&ocirc;i.</p>', '<p><strong>Cantoalba Shiraz</strong>&nbsp;c&oacute; m&agrave;u đỏ đậm của ph&uacute;c bồn tử ch&iacute;n, bởi được ủ trong th&ugrave;ng gỗ sồi Ph&aacute;p n&ecirc;n Cantoalba Shiraz v&ocirc; c&ugrave;ng quyến rũ với m&ugrave;i gỗ v&agrave; hương thơm tr&aacute;i c&acirc;y của hạnh nh&acirc;n, ph&uacute;c bồn tử v&agrave; quả m&acirc;m x&ocirc;i.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"n8k44yqHOX3hdZrJ9bFeyjXo9TpR5Vn3ezMRu9lm.png\"]', 38, '750ml/chai', '750ml/chai,6 chai/thùng', '2015', 'nho Syrah,', '2018-10-13 03:20:39', '2018-10-13 03:20:39', NULL, 0, 0),
(163, 34, 28, 40, 'Rượu Vang Đỏ Pháp - Château Côte Puyblanquet 2014', 'ruou-vang-do-phap---chateau-cote-puyblanquet-2014', 99, NULL, '13%', 'Chauter Côte Puyblenquet', '850000', '850000', '<p><strong>Ch&acirc;teau C&ocirc;te Puyblanquet</strong>&nbsp;m&agrave;u đỏ ruby, mang hương thơm những b&ocirc;ng hoa đang nở rộ,ngo&agrave;i ra c&ograve;n c&oacute; m&ugrave;i hương của mứt hoa quả v&agrave; hương thơm nhẹ nh&agrave;ng của gỗ, khi v&agrave;o v&ograve;m miệng, lan tỏa vị d&agrave;y đặc, c&acirc;n bằng hương vị giữa th&iacute;nh gi&aacute;c v&agrave; vị gi&aacute;c. Nhờ tuổi thọ trung b&igrave;nh của những gốc nho l&acirc;u năm tạo n&ecirc;n tannin trong rượu li&ecirc;n kết chặt chẽ khiến rượu c&oacute; thể giữ được 30-40 năm v&agrave; uống trong c&aacute;c thập kỷ tiếp theo.</p>', '<p><strong>Ch&acirc;teau C&ocirc;te Puyblanquet</strong>&nbsp;m&agrave;u đỏ ruby, mang hương thơm những b&ocirc;ng hoa đang nở rộ,ngo&agrave;i ra c&ograve;n c&oacute; m&ugrave;i hương của mứt hoa quả v&agrave; hương thơm nhẹ nh&agrave;ng của gỗ, khi v&agrave;o v&ograve;m miệng, lan tỏa vị d&agrave;y đặc, c&acirc;n bằng hương vị giữa th&iacute;nh gi&aacute;c v&agrave; vị gi&aacute;c. Nhờ tuổi thọ trung b&igrave;nh của những gốc nho l&acirc;u năm tạo n&ecirc;n tannin trong rượu li&ecirc;n kết chặt chẽ khiến rượu c&oacute; thể giữ được 30-40 năm v&agrave; uống trong c&aacute;c thập kỷ tiếp theo.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"Am44HQgFgxyk7V2ZJ0bugN7khq9QOnkkozy2LdWp.jpeg\"]', 39, '750ml/chai', '750ml/chai,6 chai/thùng', '2014', 'nho Merlot, Cabernet Sauvignon, Cabernet Flanc', '2018-10-13 03:21:58', '2018-10-13 03:21:58', NULL, 0, 0),
(164, 34, 28, 40, 'Rượu Vang Trắng Pháp - Château Suau (Sauternes) Sauternes Grand Cru Classé 2014', 'ruou-vang-trang-phap---chateau-suau-sauternes-sauternes-grand-cru-classe-2014', 99, NULL, '13%', 'Chauteau Suau', '1450000', '1450000', '<p><span style=\"color: #800000;\"><strong>Ch&acirc;teau Suau</strong>&nbsp;-</span>&nbsp;D&ograve;ng vang trắng hảo hạng của v&ugrave;ng Sauternes, Bordeaux được sản xuất từ hai giống nho&nbsp;Sauvignon Blanc&nbsp;v&agrave; S&eacute;millon nhiễm nấm Botrytis. Hương thơm của mứt cam đọng lại trong v&ograve;m họng sau khi bạn kết th&uacute;c ngụm rượu vang. M&agrave;u v&agrave;ng trắng sang trọng, tinh tế ph&ugrave; hợp d&ugrave;ng để khai vị hoặc tr&aacute;ng miệng trong những bữa tiệc sang trọng.</p>', '<p><span style=\"color: #800000;\"><strong>Ch&acirc;teau Suau</strong>&nbsp;-</span>&nbsp;D&ograve;ng vang trắng hảo hạng của v&ugrave;ng Sauternes, Bordeaux được sản xuất từ hai giống nho&nbsp;Sauvignon Blanc&nbsp;v&agrave; S&eacute;millon nhiễm nấm Botrytis. Hương thơm của mứt cam đọng lại trong v&ograve;m họng sau khi bạn kết th&uacute;c ngụm rượu vang. M&agrave;u v&agrave;ng trắng sang trọng, tinh tế ph&ugrave; hợp d&ugrave;ng để khai vị hoặc tr&aacute;ng miệng trong những bữa tiệc sang trọng.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"NE6tRLAE19zot0XVJT3CvFGTGxqtlRu7HdagTNNQ.jpeg\"]', 40, '750ml', '750ml/chai,6 chai/thùng', '2014', 'nho  Sauvignon Blanc, Sémillon.', '2018-10-13 03:23:25', '2018-10-13 03:23:25', NULL, 0, 0),
(165, 34, 28, 40, 'Rượu Vang Đỏ Tây Ban Nha - Felix Callejo 2005', 'ruou-vang-do-tay-ban-nha---felix-callejo-2005', 99, NULL, '14%', 'BODEGAS FÉLIX CALLEJO', '4500000', '4500000', '<p><span style=\"color: #800000;\"><strong>Chai rượu vang Felix Callejo</strong></span>&nbsp;l&agrave; th&agrave;nh phẩm của sự lựa chọn cẩn thận v&agrave; nghi&ecirc;m ngặt những tr&aacute;i nho của những c&acirc;y nho Tempranillo tr&ecirc;n 40 tuổi, nằm trong 25 vườn nho với kết cấu đất kh&aacute;c nhau (đ&aacute; v&ocirc;i, đất s&eacute;t, sỏi c&aacute;t) của gia đ&igrave;nh Callejo. Tất cả những tinh t&uacute;y đ&oacute; đ&atilde; g&oacute;p phần tạo n&ecirc;n những sắc th&aacute;i đa dạng, những cung bậc cảm x&uacute;c kh&aacute;c nhau trong c&ugrave;ng một chai rượu vang cao cấp Felix Callejo đạt chuẩn DOC của T&acirc;y Ban Nha.</p>', '<p><span style=\"color: #800000;\"><strong>Chai rượu vang Felix Callejo</strong></span>&nbsp;l&agrave; th&agrave;nh phẩm của sự lựa chọn cẩn thận v&agrave; nghi&ecirc;m ngặt những tr&aacute;i nho của những c&acirc;y nho Tempranillo tr&ecirc;n 40 tuổi, nằm trong 25 vườn nho với kết cấu đất kh&aacute;c nhau (đ&aacute; v&ocirc;i, đất s&eacute;t, sỏi c&aacute;t) của gia đ&igrave;nh Callejo. Tất cả những tinh t&uacute;y đ&oacute; đ&atilde; g&oacute;p phần tạo n&ecirc;n những sắc th&aacute;i đa dạng, những cung bậc cảm x&uacute;c kh&aacute;c nhau trong c&ugrave;ng một chai rượu vang cao cấp Felix Callejo đạt chuẩn DOC của T&acirc;y Ban Nha.</p>', NULL, NULL, NULL, 0, 0, 0, '[\"p6MTcJOj6moG1tIcqWiBJWm0SFiMUdixxi5P1NDR.jpeg\"]', 41, '750ml', '750ml/chai', '2005', 'nho Tempranillo Blend', '2018-10-13 03:24:47', '2018-10-13 03:24:47', NULL, 0, 0),
(166, 34, 21, 29, 'test 1', 'test-1', 100, NULL, '100', 'test', '1000000', '1000000', '<p>ađ&aacute;</p>', '<p>&aacute;đ&aacute;</p>', 10, '900000', '<p>&aacute;đ&acirc;sd</p>', 1, 0, 0, '[\"JasVGxvBwwgByQwKbIQmYZDoId6tURVEU8S7fwOI.jpeg\"]', 43, 'test', '100', '1993', '109', '2018-10-18 04:08:40', '2018-10-18 04:25:52', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_category`
--

CREATE TABLE `product_category` (
  `id` int(10) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `kind_id` int(11) DEFAULT NULL,
  `trademark_id` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `image` text,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_comment`
--

CREATE TABLE `product_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(2) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_comment`
--

INSERT INTO `product_comment` (`id`, `product_id`, `author`, `email`, `content`, `title`, `rating`, `is_approved`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 166, 'abc', 'aa@gmail.com', 'asedasdasd', NULL, 4, 0, 1, '2018-10-18 04:27:37', '2018-10-18 04:27:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_trademark`
--

CREATE TABLE `product_trademark` (
  `id` int(10) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `kind_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` text,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_trademark`
--

INSERT INTO `product_trademark` (`id`, `type_id`, `kind_id`, `name`, `slug`, `image`, `description`, `created_at`, `updated_at`, `deleted_at`, `is_active`, `is_deleted`) VALUES
(29, 34, 21, 'VANG ĐỎ / RED WINES', 'vang-do-red-wines', 'trademarks/QEz5bhkUkLHcXXvJNcsPonWTXBsit9Tx0DVhIk2x.jpeg', 'VANG ĐỎ / RED WINES', '2018-09-25 09:09:19', '2018-09-25 09:09:19', NULL, 1, 0),
(30, 34, 28, 'Tinazzi', 'tinazzi', 'trademarks/ikK1ZeWdcB36BxT1Usopl2PlQkM4SPt4g1B9rAWq.jpeg', 'Tinazzi', '2018-10-06 08:23:12', '2018-10-06 08:23:12', NULL, 1, 0),
(31, 34, 28, 'Feudi Salentini', 'feudi-salentini', 'trademarks/HXTI0oet45W4YpRtCfCx6LgrrrOPqQintRDqQheA.jpeg', 'Feudi Salentini', '2018-10-06 08:23:35', '2018-10-06 08:23:35', NULL, 1, 0),
(32, 34, 28, 'San Marzano Cantine', 'san-marzano-cantine', 'trademarks/03T7OYpfKLYs0mruxLcMqs5H4CRK33tPXCOaKaSB.jpeg', 'San Marzano Cantine', '2018-10-06 08:23:52', '2018-10-06 08:23:52', NULL, 1, 0),
(33, 34, 28, 'Giensen', 'giensen', 'trademarks/i0BUFrmgA8xQyjQNNuVWAdOBvMzFmgRRPhORzBhh.jpeg', 'Giensen', '2018-10-06 08:24:08', '2018-10-06 08:24:08', NULL, 1, 0),
(34, 34, 28, 'Emiliana', 'emiliana', 'trademarks/tZmKVaEvcChUFLR6iHmcNprNS6lxS4oolGJsB0w2.jpeg', 'Emiliana', '2018-10-06 08:24:34', '2018-10-06 08:24:34', NULL, 1, 0),
(35, 34, 28, 'Santalba', 'santalba', 'trademarks/1sXBFPIYTWzbjdoFhJs6tw0rBGtLidjpopcpbMbr.jpeg', 'Santalba', '2018-10-06 08:24:50', '2018-10-06 08:24:50', NULL, 1, 0),
(36, 34, 28, 'Astoria', 'astoria', 'trademarks/LSf4lRS7uUH26l9DPFiChOrsgM6uJoiqDAOGobDF.jpeg', 'Astoria', '2018-10-06 08:30:34', '2018-10-06 08:30:34', NULL, 1, 0),
(37, 34, 28, 'Capetta', 'capetta', 'trademarks/D0bscODqJzSsNsUuqgAXjejpRf4H3pZf9Rn93lOy.jpeg', 'Capetta', '2018-10-06 08:30:52', '2018-10-06 08:30:52', NULL, 1, 0),
(38, 34, 28, 'Provinco', 'provinco', 'trademarks/0MDf31cT08ppjO0kNHoGiFmSoi9aRZt9kdK1ZoZT.jpeg', 'Provinco', '2018-10-06 08:36:16', '2018-10-06 08:36:16', NULL, 1, 0),
(39, 34, 28, 'Golden Cross', 'golden-cross', 'trademarks/sCU1Ws2E7PqYHgKHOiFzhpd8tdqjl37ZhFeTMvoQ.jpeg', 'Golden Cross', '2018-10-06 08:36:41', '2018-10-06 08:36:41', NULL, 1, 0),
(40, 34, 28, 'Thương hiệu khác', 'thuong-hieu-khac', 'trademarks/5iRmFsaY4JjHXzf1Nh8TdcXuVYF46eryjD9INiEB.jpeg', 'Thương hiệu khác', '2018-10-06 08:37:14', '2018-10-06 08:37:14', NULL, 1, 0),
(41, 36, 29, 'Tên thương hiệu cho rượu mạnh', 'ten-thuong-hieu-cho-ruou-manh', 'trademarks/oJqzS5UxnmLkTjXKwBzTK2FmI0tAcPquSYv3ZahK.jpeg', 'Tên thương hiệu cho rượu mạnh', '2018-10-18 04:06:01', '2018-10-18 04:06:01', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `created_at`, `updated_at`) VALUES
(3, 'hung.luong@matocreative.vn', NULL, NULL),
(4, 'an.nguyen@matocreative.vn', NULL, NULL),
(5, 'minhtruong93gtvt@gmail.com', '2018-02-02 03:30:06', NULL),
(6, 'ab@gmail.com', NULL, NULL),
(7, 'a1bb@gmail.com', NULL, NULL),
(8, 'abg@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tasting`
--

CREATE TABLE `tasting` (
  `id` int(10) UNSIGNED NOT NULL,
  `unique_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` decimal(20,2) NOT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_content` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_store` tinyint(4) NOT NULL DEFAULT '0',
  `people` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tasting_product`
--

CREATE TABLE `tasting_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `tasting_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trademark`
--

CREATE TABLE `trademark` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `kind_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `image` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE `type` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `image` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`id`, `title`, `slug`, `description`, `is_deleted`, `created_at`, `updated_at`, `is_active`, `image`) VALUES
(34, 'Rượu Vang', 'ruou-vang', 'Rượu', 0, '2018-09-25 09:01:08', '2018-10-18 04:03:27', 1, 'ruou_vang_do_agentina_-_pascual_toso_malbec_reserve_master.jpg'),
(35, 'Bia Nhập Khẩu', 'bia-nhap-khau', 'bia', 0, '2018-09-25 09:02:54', '2018-10-18 03:12:01', 1, 'co-that-su-la-khong-nen-uong-nia-d94ce-crop1404114203553p.jpg'),
(36, 'Rượu Mạnh', 'ruou-manh', 'Rượu Mạnh', 0, '2018-10-18 04:04:10', NULL, 1, 'PRIMITIVO DI MANDURIA RISERVA DEL FONDATORE piccola.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `dob`, `address`, `district`, `city`, `password`, `remember_token`, `created_at`, `updated_at`, `api_token`) VALUES
(1, 'an nguyen', 'annguyen@admin.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$nfCNB/Gb9/Moch4IdsA97.LIWKu55Ybkh4sEFP2bm7MdyxTGJCDy6', 'lp2HOrf8IWodg172HyuCTGhaqdUWJSGSzG0pvPW9mSBY1wbD9HmTpUhdyXJw', '2017-10-30 18:59:43', '2017-10-30 18:59:43', NULL),
(2, 'hung nguyen', 'hungalexi@gmail.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$vi.MnC67kuYKDaMv00mSteizdcOcA6Q4QoSu/wIA16UfaR1dvrHVG', '8qDVsHCkhkXIJdEWwngXWncqqRxPhBYk2XW5bZgpd9pTA6VX26QOm9m9Zy6M', '2017-11-03 01:39:19', '2017-11-03 01:39:19', NULL),
(3, '1 an nguyen', 'eagleele_admin@eagleele.vn', NULL, NULL, NULL, NULL, NULL, '$2y$10$nI/oa4cvbzB9cQXm0kK0b.nuTraKB8zEHcW7IPusBvFIYQtQexhYy', '6PHA9vtpEsAW1irg36eZUjL4BxCHYFx4FtYpzXIoTMd9zdMkruCUSoccAsc1', '2017-11-03 02:34:39', '2017-11-03 02:34:39', NULL),
(4, 'an nguyen', 'admin123@admin.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$Dmr8Ms7CnV4lFzZAv2sSRe7rvDk6mDj5qVuaGsjHW9WNqulQ2stoq', NULL, '2017-11-08 09:33:49', '2017-11-08 09:33:49', NULL),
(5, 'Ha Tran', 'hatran1@admin.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$aJvJY/O01vV3oNVSoW8RheyeQZtbKbfza5JNovNv3L6.Avb6.TnEC', 'ev2TPUvwWzOXS66x0hvLEDaHewT5JsJMh5k64p10zzNnMKjvHeRWuI5A1uUU', '2017-11-15 08:32:19', '2017-11-15 08:32:19', NULL),
(6, 'Ha Nguyen', 'hanguyen@user.com', '0985767862', NULL, 'Tô Hiệu', 'Cầu Giấy', 'Hà Nội', '$2y$10$X97HEadux3XWWStnjse8GerJBmscjrfZtoNcTA5r.p0VcJvzlGP/u', 'JIBd7YHNy1Q3ejVHgRCYPeKGrDX1UJTAUW0YQVTSdjUAHaM4RBuDFUqZnLl8', '2017-11-15 08:35:57', '2018-02-23 18:11:06', NULL),
(7, 'Admin', 'maymymy_admin@maymymy.vn', NULL, NULL, NULL, NULL, NULL, '$2y$10$6Ji2vqAjzfEZS54WfwHzJu4Sy2.7OzK0zYq14j8beZeBmYVkHk.1q', 'haC2I6lYRQW5xd4MiKb4FHN1fA2RS3XpkJl6NxbMrh3UN0kEiHI3gfrYTOE5', '2017-11-17 07:41:14', '2017-11-17 07:41:14', NULL),
(8, 'Dung Nguyen', 'dungnguyen@user.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$zof5dy..mDQ4MYrsGVazE.dkVfc9dfBV283/1RjbsouEiEsOXNTlq', NULL, '2017-11-20 11:09:32', '2017-11-20 11:09:32', NULL),
(9, 'Hung Nguyen', 'hungnguyen@user.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$YmN8cjnHSCbG3ppAfDAeTuatbqLKkPf9l3SJIuOlrhAFP1p.0k4IW', 'blNMwtmLaPCIyldcYu7plZ3aGyraT1bpH7t6Ibx0LYp8JgeNNg09QpdAxSXZ', '2017-12-03 06:49:39', '2017-12-03 06:49:39', NULL),
(10, 'Tuan Nguyen', 'tuannguyen@user.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$jStlwLZMrOYBVICxW02ShOwK20bKi/YIApAYWzvyihpztjFdUH4nO', 'aL4RHk3ibP7uUCOcPCWIICmijEViAfaCdDDy7VOtvpx0HGRq7K557o4Mp6Cc', '2017-12-03 06:50:56', '2017-12-03 06:50:56', NULL),
(11, 'Van Nguyen', 'vannguyen@user.com', '09839849223555', '2017-12-21', 'Số 1 ABC2', 'Hoàn Kiếm1', 'Hà Nội33', '$2y$10$mqWStvRo8QRBS9YO7.mvLeFImsd/qhZeNZ61ysSe396d850f6nYCG', NULL, '2017-12-03 07:03:01', '2017-12-04 10:27:50', NULL),
(12, 'Minh Trường', 'minhtruong93gtvt@gmail.com', '0985767862', '2018-03-01', NULL, NULL, NULL, '$2y$10$msEheKrWlUxbPgsdcJgg/OXX6OUaev7Td1e3uF7UFC3YXqqbdaVbe', 'cDFsyUFXlEjy6q1dcKCH4vJjMvZKFMZOrSiP7jBiCpIn1c1jYVfXqTk8CnLF', '2018-03-01 07:49:45', '2018-09-26 10:08:37', NULL),
(13, 'Lương Quốc Hưng', 'luongquochung.249@gmail.com', '916595514', '2018-10-03', NULL, NULL, NULL, '$2y$10$iV.gF0B/2RadCpehPGrojeu9sjTm8voby4kTnwjb3da0VUyi6pw9K', NULL, '2018-10-18 04:10:36', '2018-10-18 04:10:36', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_like_product`
--

CREATE TABLE `user_like_product` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_like_product`
--

INSERT INTO `user_like_product` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(121, 6, 61, '2018-09-26 10:03:33', '2018-09-26 10:03:33');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `library_id` (`library_id`);

--
-- Chỉ mục cho bảng `introduce`
--
ALTER TABLE `introduce`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `kind`
--
ALTER TABLE `kind`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_comment`
--
ALTER TABLE `product_comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_trademark`
--
ALTER TABLE `product_trademark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tasting`
--
ALTER TABLE `tasting`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tasting_product`
--
ALTER TABLE `tasting_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `trademark`
--
ALTER TABLE `trademark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Chỉ mục cho bảng `user_like_product`
--
ALTER TABLE `user_like_product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `introduce`
--
ALTER TABLE `introduce`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `kind`
--
ALTER TABLE `kind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT cho bảng `library`
--
ALTER TABLE `library`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT cho bảng `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT cho bảng `origin`
--
ALTER TABLE `origin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
--
-- AUTO_INCREMENT cho bảng `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `product_comment`
--
ALTER TABLE `product_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `product_trademark`
--
ALTER TABLE `product_trademark`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT cho bảng `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `tasting`
--
ALTER TABLE `tasting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `tasting_product`
--
ALTER TABLE `tasting_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `trademark`
--
ALTER TABLE `trademark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT cho bảng `user_like_product`
--
ALTER TABLE `user_like_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
