-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.4.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 pager.bid 구조 내보내기
CREATE TABLE IF NOT EXISTS `bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no1` varchar(255) DEFAULT NULL,
  `no2` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `category1` varchar(255) DEFAULT NULL,
  `category2` varchar(255) DEFAULT NULL,
  `category3` varchar(255) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `fileName1` varchar(255) DEFAULT NULL,
  `file1` varchar(255) DEFAULT NULL,
  `fileName2` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `fileName3` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 pager.bid:~0 rows (대략적) 내보내기
DELETE FROM `bid`;

-- 테이블 pager.company 구조 내보내기
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no1` varchar(255) DEFAULT NULL,
  `no2` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `category1` varchar(255) DEFAULT NULL,
  `category2` varchar(255) DEFAULT NULL,
  `category3` varchar(255) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `fileName1` varchar(255) DEFAULT NULL,
  `file1` varchar(255) DEFAULT NULL,
  `fileName2` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `fileName3` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 pager.company:~3 rows (대략적) 내보내기
DELETE FROM `company`;
INSERT INTO `company` (`id`, `no1`, `no2`, `title`, `company`, `status`, `category1`, `category2`, `category3`, `startTime`, `endTime`, `name`, `tel`, `content`, `fileName1`, `file1`, `fileName2`, `file2`, `fileName3`, `file3`) VALUES
	(1, NULL, NULL, '웹 디자이너 채용', '헤이브', '채용중', '웹디자이너', NULL, NULL, '2025-11-05 16:58:00', '2025-09-30 00:00:00', '김철수', '01020201010', '회사명 : 헤이브 (솔루션)\r\n계약형태 : 정규직\r\n근무시간 : 09:00 ~ 18:00\r\n휴무휴가 : 주말 빨간날 휴무\r\n4대보험 : 유\r\n퇴직금 : 유\r\n\r\n기본급 : 250만원 ~\r\n근무지역 : 경기도 고양시 일산동구\r\n접수기간 : 09/17 ~ 09/30\r\n접수방법 : 접수표기 방식 [제작팀 지원] 성명 / 연락처 010-0000-0000\r\n\r\n​\r\n\r\n지원절차 (이메일로 먼저 보내주시고 전화 또는 문자 부탁드립니다.)\r\n\r\ndbo141@naver.com 으로 지원서 제출 > 검토 > 개별연락 > 면접 후 결정', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, NULL, NULL, '홈페이지 퍼블리싱 및 개발자 파트너 모집', '미담기획', '채용중', '웹퍼블리셔', NULL, NULL, '2025-11-05 17:05:12', '2025-02-28 00:00:00', '미담기획', 'sungsoopark@midamplan.com', '회사명 : 미담기획\r\n계약형태 :  정규직, 상주 프리랜서 (협의가능)\r\n근무시간 : 09시30분 ~ 18시30분\r\n휴무휴가 : O\r\n4대보험 : O\r\n퇴직금 : O\r\n근무지역 : 서울 구로구 디지털타워 \r\n접수기간 : 2025.07.08 ~\r\n접수방법 : 이메일접수 sungsoopark@midamplan.com\r\n\r\n \r\n\r\n안녕하세요,\r\n종합광고대행사 미담기획입니다.\r\n\r\n \r\n\r\n당사는 다양한 브랜드와 기업의 가치를 효과적으로 전달하는 통합 마케팅 솔루션을 제공하는\r\n\r\n종합광고대행사로, 최근 웹에이전시 부문의 수주 실적이 빠르게 증가함에 따라 홈페이지 퍼블리싱 및 개발 파트너를 새롭게 모시고자 합니다.\r\n\r\n \r\n\r\n함께할 분을 정중히 모시며, 아래의 내용을 참고 부탁드립니다.\r\n\r\n■ 모집 분야\r\n웹 퍼블리셔 / 프론트엔드 개발자\r\n\r\n웹 개발자 (백엔드 포함 가능)\r\n\r\n■ 업무 내용\r\n미담기획 자체 플랫폼 및 솔루션, 클라이언트 웹사이트 구축\r\n\r\nPHP, HTML, CSS, x-javascript 기반 퍼블리싱 작업\r\n\r\nCMS 또는 웹 프레임워크 기반 개발 (WordPress, Laravel 등 협의)\r\n\r\n반응형 웹, 크로스 브라우징 대응\r\n\r\n유지보수 및 개선 업무 (필요 시)\r\n\r\n■ 자격 요건\r\n관련 경력 5년 이상\r\n\r\nHTML5, CSS3, x-javascript 등 웹 표준에 대한 이해\r\n\r\n다양한 디바이스 환경에 최적화된 퍼블리싱 경험\r\n\r\nGit 등 형상관리 툴 활용 가능자 우대\r\n\r\n웹 접근성, SEO 등에 대한 기본 이해 있으신 분 우대\r\n\r\n책임감 있게 프로젝트를 끝까지 함께할 수 있는 분\r\n\r\n■ 근무 형태\r\n정규직 채용 가능\r\n\r\n외주 프리랜서(프로젝트 단위 또는 장기 계약)도 환영\r\n\r\n근무 형태는 상호 협의를 통해 유연하게 조율 가능합니다.\r\n\r\n■ 근무 환경 및 혜택\r\n근무지: 서울 구로구 JNK디지털타워 (미담기획 본사)\r\n\r\n사무공간, 라운지, 미팅룸 등 최신 편의시설 제공\r\n\r\n사내 식사 및 간식 제공\r\n\r\n쾌적하고 열린 분위기의 협업 환경\r\n\r\n■ 모집 일정 및 지원 방법\r\n모집 기간: 채용 시까지\r\n\r\n지원 방법: 아래 이메일로 이력서 및 포트폴리오 제출\r\n sungsoopark@midamplan.com\r\n\r\n※ 메일 제목은 “[홈페이지 개발 지원] 성함_지원분야” 로 작성 부탁드립니다.\r\n※ 포트폴리오가 있다면 필수로 첨부 부탁드립니다. 실무 참여 사례 위주 환영합니다.\r\n\r\n■ 참고 사항\r\n면접은 서류 검토 후 개별 연락을 통해 진행됩니다.\r\n\r\n지원해주신 모든 분의 정보는 채용 목적 외에는 사용되지 않으며, 비공개로 안전하게 관리됩니다.', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, NULL, NULL, 'php / vue / 라라벨 관련 프리랜서 구인.', 'rmsn3', '채용중', '프론트개발자', NULL, NULL, '2025-11-05 17:13:01', '2025-12-31 00:00:00', 'rmsn3', 'https://t.me/rmsn3', '월급여 1000~1500 원격 근무입니다.\r\n\r\n \r\n\r\n정해진 환경에서 원격으로 작업하시면되고 \r\n\r\n \r\n\r\n주급으로 드려요.\r\n\r\n \r\n\r\n이해력 빠르고 실력 확실하신분만 연락주세요.\r\n\r\n \r\n\r\nhttps://t.me/rmsn3', NULL, NULL, NULL, NULL, NULL, NULL);

-- 테이블 pager.news 구조 내보내기
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `regdate` datetime DEFAULT current_timestamp(),
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 pager.news:~3 rows (대략적) 내보내기
DELETE FROM `news`;
INSERT INTO `news` (`id`, `title`, `content`, `regdate`, `category`) VALUES
	(1, '신제품 출시 안내', '새로운 AI 기반 서비스가 출시되었습니다.', '2025-11-04 16:54:03', '공지'),
	(2, '시스템 점검 예정', '이번 주말 서버 점검으로 인한 서비스 일시 중단이 예정되어 있습니다.', '2025-11-04 16:54:03', '안내'),
	(4, '사이트 오픈!', '페이저 사이트가 새롭게 오픈 했습니다!', '2025-11-05 15:35:23', NULL);

-- 테이블 pager.qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `qna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `company` varchar(150) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `regdate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 pager.qna:~0 rows (대략적) 내보내기
DELETE FROM `qna`;
INSERT INTO `qna` (`id`, `name`, `department`, `company`, `tel`, `email`, `category`, `content`, `regdate`) VALUES
	(2, '이재용', 'ceo', '삼성', '01023231212', 'asdasd@azsc.ocm', '제휴', '제휴 하고 싶어요', '2025-11-07 13:21:27');

-- 테이블 pager.quote 구조 내보내기
CREATE TABLE IF NOT EXISTS `quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no1` varchar(255) DEFAULT NULL,
  `no2` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `status` enum('요청','마감','취소') DEFAULT '요청',
  `endTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 pager.quote:~0 rows (대략적) 내보내기
DELETE FROM `quote`;

-- 테이블 pager.shop 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `delivery_price` int(11) DEFAULT 0,
  `total_price` int(11) DEFAULT 0,
  `category1` varchar(255) DEFAULT NULL,
  `category2` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hot` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 pager.shop:~9 rows (대략적) 내보내기
DELETE FROM `shop`;
INSERT INTO `shop` (`id`, `title`, `price`, `delivery_price`, `total_price`, `category1`, `category2`, `content`, `thumb`, `company`, `created_at`, `updated_at`, `hot`, `url`) VALUES
	(1, '[로지텍] 무선 광마우스, M170 블랙', 12800, 2500, 0, '패션', '사무실', '<p><img style="width: 790px;" src="https://image3.compuzone.co.kr/img/product_img_detail/2016/0218/358220/67fc204799bfca662b9ebdbad60c8711.jpg"><br></p>', '833b8910-feb2-40a0-a5fa-ee056297bf06.jpg', '컴퓨존', '2025-11-07 10:49:04', '2025-11-07 11:22:25', 1, 'https://www.compuzone.co.kr/product/product_detail.htm?ProductNo=358220&banner_check=naver&opt_chk=Y&NaPm=ct%3Dmho6kerk%7Cci%3D88fc2e154c370ef78523147038cbec103eb0117b%7Ctr%3Dsls%7Csn%3D116863%7Chk%3Dd1de8eddcfb202c9981eeabd054a808411b94efa'),
	(2, '[Geekom] Mini Air12 Lite (N150) [8GB RAM/256GB SSD/Win11Pro]', 299000, 0, 0, '사무용품', '사무실', '<p><img style="width: 868px;" src="https://image3.compuzone.co.kr/img/product_img_detail/2025/0721/1262367/88134a61386498decfebd59548c2daab.jpg"><br></p>', '454655c1-c9f9-4993-8281-c2af30621474.jpg', '컴퓨존', '2025-11-07 11:07:46', '2025-11-07 11:22:26', 1, 'https://www.compuzone.co.kr/product/product_detail.htm?ProductNo=1262367&BigDivNo=1&MediumDivNo=1005&DivNo=2009'),
	(3, '로지텍 헤어밴드형 USB H390 블랙', 39900, 2500, 0, '사무용품', '사무실', '<p><img style="width: 800px;" src="https://image5.compuzone.co.kr/img/md_notice/2014/ac5dd6ec19a0cd88433e392079c3220e.jpg"><br></p>', '7d2aafe0-a948-4a8b-af39-95106e5fd04a.jpg', '컴퓨존', '2025-11-07 11:12:27', '2025-11-07 11:14:11', NULL, 'https://www.compuzone.co.kr/product/product_detail.htm?ProductNo=209904'),
	(4, '[브리츠] BR-1000A Cuve Black 2 블랙', 25900, 0, 0, '사무용품', '사무실', '<p><img style="width: 860px;" src="https://image3.compuzone.co.kr/img/product_img_detail/2018/1002/497308/4fe31cc78dca22b23caaa0c0b817fd9c.jpg"><br></p>', '5f2a086d-c2d0-4bfa-84c4-9226a09157e5.jpg', '컴퓨존', '2025-11-07 11:13:19', '2025-11-07 11:22:27', 1, 'https://www.compuzone.co.kr/product/product_detail.htm?ProductNo=497308'),
	(5, '[브리츠] [2채널스피커] BR-Istana', 18900, 2500, 0, '사무용품', '사무실', '<p><img style="width: 700px;" src="https://image3.compuzone.co.kr/img/pr_early_image/354529/2130706433_1452132664_97.jpg"><br></p>', 'c0fe481a-1510-4c16-8a52-7d8b6ca55001.jpg', '컴퓨존', '2025-11-07 11:15:35', '2025-11-07 11:24:43', NULL, 'https://www.compuzone.co.kr/product/product_detail.htm?ProductNo=354529&BigDivNo=7&MediumDivNo=1033&DivNo=2086'),
	(6, '[로지텍][헤드셋] G733 Lightspeed [무선] [가상7.1ch]', 139000, 0, 0, '사무용품', '사무실', '<p><img style="width: 1000px;" src="https://image3.compuzone.co.kr/img/product_img_detail/2020/1006/715452/c905e272e46e4725b00bb6cf4f375024.jpg"><br></p>', '497be0e0-e659-4e90-a6ed-34c29af44775.jpg', '컴퓨존', '2025-11-07 11:16:27', '2025-11-07 11:25:20', NULL, 'https://www.compuzone.co.kr/product/product_detail.htm?ProductNo=715451&BigDivNo=7&MediumDivNo=1163&DivNo=2769'),
	(7, '카카오프렌즈 알찬 문구세트3 춘식이 문구류 단체선물', 9800, 3000, 0, '문구', '사무실', '<p><img style="width: 860px;" src="https://shop-phinf.pstatic.net/20250429_61/1745916526103p8GDl_JPEG/%EC%95%8C%EC%B0%AC-%EB%AC%B8%EA%B5%AC%EC%84%B8%ED%8A%B83-%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%80_1_01.jpg?type=w860"><br></p>', '0392ae29-3795-4144-a1e9-665e9e4e0567.jpg', '카카오프렌즈', '2025-11-07 11:18:33', '2025-11-07 11:22:28', 1, 'https://smartstore.naver.com/everget/products/5785041504'),
	(8, '크리스마스 캐릭터볼펜 귀여운펜선물 문구류필기구 산타 UFCPN0021', 620, 3000, 0, '문구', '사무실', '<p><img style="width: 860px;" src="https://ai.esmplus.com/ohsolgood/FC/UFCPN002Z/01.jpg"><br></p>', '4bf55647-76b8-427e-8efa-30abb0386164.jpg', '민화샵', '2025-11-07 11:20:00', '2025-11-07 11:20:00', NULL, 'https://smartstore.naver.com/minhwashop/products/4805392406'),
	(9, '투명 4종 볼펜 세트 젤펜 필기구 문구류', 9400, 0, 0, '문구', '사무실', '<p><img style="width: 720px;" src="https://d3ha2047wt6x28.cloudfront.net/uQ-kWoJuYNM/pr:GOODS_INFORMATION/czM6Ly9hYmx5LWltYWdlLWxlZ2FjeS9kYXRhL2VkaXRvci8yMDI0MDEyM18xNzA2MDExOTk0MDEwODExbC5qcGc"><br></p>', '99bc9fc6-d27f-4a3d-a678-2ab56d140371.webp', '이로이로', '2025-11-07 11:21:34', '2025-11-07 11:21:34', NULL, 'https://applink.a-bly.com/yy9wyp9');

-- 테이블 pager.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mbId` varchar(255) DEFAULT NULL,
  `mbPassword` varchar(255) DEFAULT NULL,
  `mbName` varchar(255) DEFAULT NULL,
  `joinDate` datetime DEFAULT NULL,
  `recentDate` datetime DEFAULT NULL,
  `hashYN` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 pager.user:~3 rows (대략적) 내보내기
DELETE FROM `user`;
INSERT INTO `user` (`id`, `mbId`, `mbPassword`, `mbName`, `joinDate`, `recentDate`, `hashYN`) VALUES
	(1, 'admin@naver.com', '$2a$10$1gZ1PfYKynaekBD4/D1M5uk9OkqiziGXv1qjL/tn3m5ErFRMkXgPG', '관리인', '2025-11-04 16:14:14', '2025-11-05 15:23:51', 'N'),
	(3, 'user@naver.com', '$2a$10$sd1W8VdRbhkG/hWjbUFTsOnSTrXnUJ7CfzHfry4YLARPIpdjztKwi', '홍길동', '2025-11-07 08:45:52', '2025-11-07 09:12:28', 'Y'),
	(4, 'user@naver.com', '$2a$10$URUCHwqive690QGEos.0juQOrcea.QcThzsIXVY2BQH7w0Xf9HDIi', '홍길동', '2025-11-07 09:13:39', '2025-11-07 09:13:39', 'N'),
	(5, 'user2@naver.com', '$2a$10$DdoPeEyXwv80afOCs7UYguTUdIarSIVPUmprcPFXquoTto9Z4kVA.', '김철수', '2025-11-07 15:37:45', '2025-11-07 16:10:37', 'Y'),
	(6, 'user2@naver.com', '$2a$10$rM5NiSa.uBFuj6dSAWqjoulqqiHO/2JCJ.axzRNRZFsVh6CMrs6ge', '김철수', '2025-11-07 16:11:17', '2025-11-07 16:11:17', 'N');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
