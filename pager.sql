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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 pager.company:~25 rows (대략적) 내보내기
DELETE FROM `company`;
INSERT INTO `company` (`id`, `no1`, `no2`, `title`, `company`, `status`, `category1`, `category2`, `category3`, `startTime`, `endTime`, `name`, `tel`, `content`, `fileName1`, `file1`, `fileName2`, `file2`, `fileName3`, `file3`) VALUES
	(1, NULL, NULL, '웹 디자이너 채용', '헤이브', '채용중', '웹디자이너', NULL, NULL, '2025-11-05 16:58:00', '2025-09-30 00:00:00', '김철수', '01020201010', '회사명 : 헤이브 (솔루션)\r\n계약형태 : 정규직\r\n근무시간 : 09:00 ~ 18:00\r\n휴무휴가 : 주말 빨간날 휴무\r\n4대보험 : 유\r\n퇴직금 : 유\r\n\r\n기본급 : 250만원 ~\r\n근무지역 : 경기도 고양시 일산동구\r\n접수기간 : 09/17 ~ 09/30\r\n접수방법 : 접수표기 방식 [제작팀 지원] 성명 / 연락처 010-0000-0000\r\n\r\n​\r\n\r\n지원절차 (이메일로 먼저 보내주시고 전화 또는 문자 부탁드립니다.)\r\n\r\ndbo141@naver.com 으로 지원서 제출 > 검토 > 개별연락 > 면접 후 결정', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, NULL, NULL, '홈페이지 퍼블리싱 및 개발자 파트너 모집', '미담기획', '채용중', '웹퍼블리셔', NULL, NULL, '2025-11-05 17:05:12', '2025-02-28 00:00:00', '미담기획', 'sungsoopark@midamplan.com', '회사명 : 미담기획\r\n계약형태 :  정규직, 상주 프리랜서 (협의가능)\r\n근무시간 : 09시30분 ~ 18시30분\r\n휴무휴가 : O\r\n4대보험 : O\r\n퇴직금 : O\r\n근무지역 : 서울 구로구 디지털타워 \r\n접수기간 : 2025.07.08 ~\r\n접수방법 : 이메일접수 sungsoopark@midamplan.com\r\n\r\n \r\n\r\n안녕하세요,\r\n종합광고대행사 미담기획입니다.\r\n\r\n \r\n\r\n당사는 다양한 브랜드와 기업의 가치를 효과적으로 전달하는 통합 마케팅 솔루션을 제공하는\r\n\r\n종합광고대행사로, 최근 웹에이전시 부문의 수주 실적이 빠르게 증가함에 따라 홈페이지 퍼블리싱 및 개발 파트너를 새롭게 모시고자 합니다.\r\n\r\n \r\n\r\n함께할 분을 정중히 모시며, 아래의 내용을 참고 부탁드립니다.\r\n\r\n■ 모집 분야\r\n웹 퍼블리셔 / 프론트엔드 개발자\r\n\r\n웹 개발자 (백엔드 포함 가능)\r\n\r\n■ 업무 내용\r\n미담기획 자체 플랫폼 및 솔루션, 클라이언트 웹사이트 구축\r\n\r\nPHP, HTML, CSS, x-javascript 기반 퍼블리싱 작업\r\n\r\nCMS 또는 웹 프레임워크 기반 개발 (WordPress, Laravel 등 협의)\r\n\r\n반응형 웹, 크로스 브라우징 대응\r\n\r\n유지보수 및 개선 업무 (필요 시)\r\n\r\n■ 자격 요건\r\n관련 경력 5년 이상\r\n\r\nHTML5, CSS3, x-javascript 등 웹 표준에 대한 이해\r\n\r\n다양한 디바이스 환경에 최적화된 퍼블리싱 경험\r\n\r\nGit 등 형상관리 툴 활용 가능자 우대\r\n\r\n웹 접근성, SEO 등에 대한 기본 이해 있으신 분 우대\r\n\r\n책임감 있게 프로젝트를 끝까지 함께할 수 있는 분\r\n\r\n■ 근무 형태\r\n정규직 채용 가능\r\n\r\n외주 프리랜서(프로젝트 단위 또는 장기 계약)도 환영\r\n\r\n근무 형태는 상호 협의를 통해 유연하게 조율 가능합니다.\r\n\r\n■ 근무 환경 및 혜택\r\n근무지: 서울 구로구 JNK디지털타워 (미담기획 본사)\r\n\r\n사무공간, 라운지, 미팅룸 등 최신 편의시설 제공\r\n\r\n사내 식사 및 간식 제공\r\n\r\n쾌적하고 열린 분위기의 협업 환경\r\n\r\n■ 모집 일정 및 지원 방법\r\n모집 기간: 채용 시까지\r\n\r\n지원 방법: 아래 이메일로 이력서 및 포트폴리오 제출\r\n sungsoopark@midamplan.com\r\n\r\n※ 메일 제목은 “[홈페이지 개발 지원] 성함_지원분야” 로 작성 부탁드립니다.\r\n※ 포트폴리오가 있다면 필수로 첨부 부탁드립니다. 실무 참여 사례 위주 환영합니다.\r\n\r\n■ 참고 사항\r\n면접은 서류 검토 후 개별 연락을 통해 진행됩니다.\r\n\r\n지원해주신 모든 분의 정보는 채용 목적 외에는 사용되지 않으며, 비공개로 안전하게 관리됩니다.', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, NULL, NULL, 'php / vue / 라라벨 관련 프리랜서 구인.', 'rmsn3', '채용중', '프론트개발자', NULL, NULL, '2025-11-05 17:13:01', '2025-12-31 00:00:00', 'rmsn3', 'https://t.me/rmsn3', '월급여 1000~1500 원격 근무입니다.\r\n\r\n \r\n\r\n정해진 환경에서 원격으로 작업하시면되고 \r\n\r\n \r\n\r\n주급으로 드려요.\r\n\r\n \r\n\r\n이해력 빠르고 실력 확실하신분만 연락주세요.\r\n\r\n \r\n\r\nhttps://t.me/rmsn3', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, NULL, NULL, '재택 근무. 저와 함께할 분을 찾고 있습니다', 'Total Crest', '채용중', '백엔드개발자', NULL, NULL, '2025-11-14 10:59:27', '2025-12-31 00:00:00', '홍길동', '01023231212', '회사명 : Total Crest\r\n계약형태 : 협의 \r\n근무시간 : 재택\r\n마케팅, SEO, AI트래픽, 기획, 디자이너, 개발에 관심있으신분\r\n\r\n쪽지 주시면 그쪽에서 요구한 설문지 링크 드리겠습니다. (구글설문지)', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, NULL, NULL, 'php 웹프로그래머 프리랜서 모집', '와이드아이', '채용중', '프론트개발자', NULL, NULL, '2025-11-14 11:00:29', '2025-12-14 00:00:00', '비공개', '01025154042', '당사는 경기도 하남에 위치한 홈페이지제작 및 광고 홍보용역 업체 (주)와이드아이입니다.\r\n\r\n재택으로 일하시는 php 웹프로그래머(jsp도 환영) 프리랜서를 모집하고 있습니다. \r\n주업무는 기업 및 관공서 홈페이지제작 웹프로그래밍 일이며, 책임감있게 끝까지 마무리 지어주실 분을 원합니다.\r\n\r\n아래 이메일로 이력서 및 포트폴리오를 지원하여 주시면 검토 후 연락 드리도록 하겠습니다.\r\n\r\n\r\n1. (필수) 작업 가능 분야 :  php 웹프로그래머(jsp도 가능)\r\n2. 이메일 지원 : tonybass@daum.net\r\n3. 하남 인근 거주자 환영 (가끔 사무실 방문해서 미팅 가능하신 분이시면 좋겠습니다)\r\n\r\n \r\n\r\n궁금하신 사항은 010-2515-사공사이로 연락주세요~\r\n많은 지원 부탁드립니다.', NULL, NULL, NULL, NULL, NULL, NULL),
	(6, NULL, NULL, '신규 웹 서비스 프론트엔드 개발자 모집', '페이저픽', '채용중', '프론트개발자', NULL, NULL, '2025-11-14 11:00:29', '2025-03-30 00:00:00', '김철수', '010-1234-5678', 'React 기반 신규 서비스 UI 개발 참여', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, NULL, NULL, 'AI 프로젝트 백엔드 개발자 채용', '디지털웨이브', '채용중', '백엔드개발자', NULL, NULL, '2025-11-14 11:00:29', '2025-04-15 00:00:00', '이영희', '010-2345-6789', 'Spring Boot 기반 API 개발 및 서버 운영', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, NULL, NULL, '쇼핑몰 React Native 앱 개발자 모집', '바이탈소프트', '채용중', '앱개발자', NULL, NULL, '2025-11-05 17:05:12', '2025-05-01 00:00:00', '박진우', '010-1111-2222', 'React Native 기반 모바일 앱 신규 기능 개발', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, NULL, NULL, '사내 ERP 시스템 엔지니어 채용', '제노텍', '채용중', '시스템엔지니어', NULL, NULL, '2025-11-05 17:05:12', '2025-03-20 00:00:00', '정미라', '010-2222-3333', '사내 시스템 유지보수 및 신규 구축 지원', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, NULL, NULL, '보안 전문 네트워크 엔지니어 모집', '아이티세이프', '채용중', '네트워크엔지니어', NULL, NULL, '2025-11-06 17:05:12', '2025-06-10 00:00:00', '오민수', '010-5555-6666', '기업 네트워크 구성, 방화벽 및 VPN 관리', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, NULL, NULL, 'DB 성능 최적화 전문가(DBA) 채용', '데이터랩스', '채용중', 'DBA', NULL, NULL, '2025-11-01 11:14:17', '2025-06-01 00:00:00', '김다혜', '010-1313-1313', 'MariaDB, MySQL 튜닝 및 데이터 모델링 업무', NULL, NULL, NULL, NULL, NULL, NULL),
	(12, NULL, NULL, 'HTML/CSS 웹 퍼블리셔 채용', '크리에이티브웍스', '채용중', '웹퍼블리셔', NULL, NULL, '2025-11-14 11:14:19', '2025-04-28 00:00:00', '최유진', '010-7777-8888', '반응형 웹 퍼블리싱 및 UI 스타일 가이드 작업', NULL, NULL, NULL, NULL, NULL, NULL),
	(13, NULL, NULL, '보안엔지니어(보안관제) 신입/경력 모집', '세이프가드', '채용중', '보안엔지니어', NULL, NULL, '2025-11-14 11:14:21', '2025-05-20 00:00:00', '조현우', '010-9999-8888', '보안 이벤트 모니터링과 침해 대응 업무', NULL, NULL, NULL, NULL, NULL, NULL),
	(14, NULL, NULL, '언리얼 엔진 게임 클라이언트 개발자 채용', '게임팩토리', '채용중', '게임개발자', NULL, NULL, '2025-11-30 11:14:22', '2025-04-05 00:00:00', '홍수연', '010-4444-9999', '언리얼 기반 PC 및 콘솔 게임 개발', NULL, NULL, NULL, NULL, NULL, NULL),
	(15, NULL, NULL, 'UI/UX 웹디자이너 모집', '리얼디자인', '채용중', '웹디자이너', NULL, NULL, '2025-11-14 11:14:25', '2025-03-25 00:00:00', '문희정', '010-5555-1212', '브랜딩 및 웹 UI/UX 디자인 작업', NULL, NULL, NULL, NULL, NULL, NULL),
	(16, NULL, NULL, '대규모 트래픽 백엔드 개발자 모집', '클라우드모션', '채용중', '백엔드개발자', NULL, NULL, '2025-12-02 15:11:00', '2025-04-30 00:00:00', '유현서', '010-7777-2222', 'Spring 및 AWS 기반 대규모 서비스 개발', NULL, NULL, NULL, NULL, NULL, NULL),
	(17, NULL, NULL, 'React 프론트개발자 모집', '프라이머랩', '채용중', '프론트개발자', NULL, NULL, '2025-11-05 17:05:12', '2025-07-02 00:00:00', '강태윤', '010-3232-3232', 'SPA 기반 웹 앱 신규 개발', NULL, NULL, NULL, NULL, NULL, NULL),
	(18, NULL, NULL, 'Flutter 앱개발자 채용', '모바일이노베이션', '채용중', '앱개발자', NULL, NULL, '2025-11-05 17:05:12', '2025-05-15 00:00:00', '박상민', '010-4242-4242', 'Flutter 기반 크로스 플랫폼 앱 개발', NULL, NULL, NULL, NULL, NULL, NULL),
	(19, NULL, NULL, '사내 유지보수 시스템엔지니어', '테크메이트', '채용중', '시스템엔지니어', NULL, NULL, '2025-11-06 17:05:12', '2025-04-01 00:00:00', '정태준', '010-2121-2121', '사내 PC 및 서버 운영 지원', NULL, NULL, NULL, NULL, NULL, NULL),
	(20, NULL, NULL, '네트워크 인프라 엔지니어 경력직 채용', '와이어넷', '채용중', '네트워크엔지니어', NULL, NULL, '2025-11-06 17:05:12', '2025-06-30 00:00:00', '윤예진', '010-9898-9898', '기업 네트워크 구성 및 라우팅 설정', NULL, NULL, NULL, NULL, NULL, NULL),
	(21, NULL, NULL, '고급 DBA 인재 채용', '넥서스데이터', '채용중', 'DBA', NULL, NULL, '2025-11-01 11:14:17', '2025-05-30 00:00:00', '유민지', '010-7070-4545', 'DB 트러블슈팅 및 데이터 마이그레이션 수행', NULL, NULL, NULL, NULL, NULL, NULL),
	(22, NULL, NULL, 'HTML/CSS 퍼블리셔 신입 채용', '스타일코드', '채용중', '웹퍼블리셔', NULL, NULL, '2025-11-01 11:14:17', '2025-04-12 00:00:00', '정소영', '010-3434-3434', 'UI 마크업 및 반응형 페이지 제작', NULL, NULL, NULL, NULL, NULL, NULL),
	(23, NULL, NULL, '보안엔지니어(취약점 분석) 채용', '인포가드', '채용중', '보안엔지니어', NULL, NULL, '2025-11-14 10:59:27', '2025-07-20 00:00:00', '배영우', '010-7878-7878', '취약점 분석 및 보안 솔루션 운영', NULL, NULL, NULL, NULL, NULL, NULL),
	(24, NULL, NULL, 'Unity 기반 모바일 게임개발자', '플레이하우스', '채용중', '게임개발자', NULL, NULL, '2025-11-14 10:59:27', '2025-05-25 00:00:00', '유시현', '010-6767-6767', '모바일 게임 신규 개발 및 유지보수', NULL, NULL, NULL, NULL, NULL, NULL),
	(25, NULL, NULL, '웹디자이너(UI/UX) 경력직 채용', '베이직디자인', '채용중', '웹디자이너', NULL, NULL, '2025-11-13 10:59:27', '2025-06-08 00:00:00', '서지민', '010-5656-5656', 'UI/UX 개선 및 서비스 리디자인 작업', NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 pager.qna:~22 rows (대략적) 내보내기
DELETE FROM `qna`;
INSERT INTO `qna` (`id`, `name`, `department`, `company`, `tel`, `email`, `category`, `content`, `regdate`) VALUES
	(2, '이재용', 'ceo', '삼성', '01023231212', 'asdasd@azsc.ocm', '제휴', '제휴 하고 싶어요', '2025-11-07 13:21:27'),
	(4, '김일동', '개발부', '연세아이티', '01023231212', 'asdasd@asd.com', '회원', '회원가입이 잘 안돼여!!', '2025-11-14 09:10:22'),
	(5, '김철수', '개발팀', '페이저픽', '010-1234-5678', 'kimcs@pagerpick.com', '서비스문의', '신규 기능 문의드립니다.', '2025-11-14 11:21:51'),
	(6, '이영희', '마케팅팀', '디지털웨이브', '010-2345-6789', 'yhlee@dwave.com', '견적문의', '서비스 견적 요청드립니다.', '2025-11-14 11:21:51'),
	(7, '박진우', '운영팀', '바이탈소프트', '010-1111-2222', 'pjw@vitalsf.com', '기술문의', 'API 사용 관련 문의.', '2025-11-14 11:21:51'),
	(8, '정미라', '총무팀', '제노텍', '010-2222-3333', 'mira@zenotech.com', '기술문의', '서버 연동 문제 상담 요청.', '2025-11-14 11:21:51'),
	(9, '오민수', '보안팀', '아이티세이프', '010-5555-6666', 'oms@itsafe.com', '보안문의', '보안 API 문의드립니다.', '2025-11-14 11:21:51'),
	(10, '김다혜', '데이터팀', '데이터랩스', '010-1313-1313', 'dhkim@datalabs.com', '서비스문의', '데이터 처리 관련 문의.', '2025-11-14 11:21:51'),
	(11, '최유진', '디자인팀', '크리에이티브웍스', '010-7777-8888', 'yjchoi@cwdesign.com', '기타문의', '디자인 템플릿 제공 가능한가요?', '2025-11-14 11:21:51'),
	(12, '조현우', '보안팀', '세이프가드', '010-9999-8888', 'hwcho@safeguard.com', '기술문의', '보안 검증 문서 요청드립니다.', '2025-11-14 11:21:51'),
	(13, '홍수연', '개발팀', '게임팩토리', '010-4444-9999', 'suhong@gfactory.com', '서비스문의', '서비스 도입 관련 상담.', '2025-11-14 11:21:51'),
	(14, '문희정', '디자인팀', '리얼디자인', '010-5555-1212', 'hjmoon@realdesign.com', '견적문의', '프로젝트 견적 요청합니다.', '2025-11-14 11:21:51'),
	(15, '유현서', '클라우드팀', '클라우드모션', '010-7777-2222', 'hsyu@cloudmotion.com', '기술문의', '클라우드 구성 문의.', '2025-11-14 11:21:51'),
	(16, '강태윤', '프론트팀', '프라이머랩', '010-3232-3232', 'tykang@primerlab.com', '서비스문의', 'React SDK 통합 관련 문의.', '2025-11-14 11:21:51'),
	(17, '박상민', '모바일팀', '모바일이노베이션', '010-4242-4242', 'smin@mobileinnov.com', '기술문의', 'Flutter 앱 연동 문의드립니다.', '2025-11-14 11:21:51'),
	(18, '정태준', '서버팀', '테크메이트', '010-2121-2121', 'tjjeong@techmate.com', '기술문의', '서버 성능 테스트 문의입니다.', '2025-11-14 11:21:51'),
	(19, '윤예진', '네트워크팀', '와이어넷', '010-9898-9898', 'yjyon@wirenet.com', '기술문의', 'VPN 구성 문의드립니다.', '2025-11-14 11:21:51'),
	(20, '유민지', 'DB팀', '넥서스데이터', '010-7070-4545', 'mjyu@nexusdata.com', '기술문의', 'DB 튜닝 관련 문의가 있습니다.', '2025-11-14 11:21:51'),
	(21, '정소영', '퍼블리싱팀', '스타일코드', '010-3434-3434', 'syjeong@stylecode.com', '서비스문의', '퍼블리싱 가이드 요청드립니다.', '2025-11-14 11:21:51'),
	(22, '배영우', '보안팀', '인포가드', '010-7878-7878', 'ywbae@infoguard.com', '보안문의', '보안 취약점 분석 문의.', '2025-11-14 11:21:51'),
	(23, '유시현', '게임팀', '플레이하우스', '010-6767-6767', 'shyun@playhouse.com', '기타문의', '게임 로그 분석 문의.', '2025-11-14 11:21:51'),
	(24, '서지민', '디자인팀', '베이직디자인', '010-5656-5656', 'jmseo@basicdesign.com', '견적문의', '웹 사이트 리뉴얼 견적 문의.', '2025-11-14 11:21:51');

-- 테이블 pager.quote_api_data 구조 내보내기
CREATE TABLE IF NOT EXISTS `quote_api_data` (
  `order_plan_unty_no` varchar(100) NOT NULL,
  `biz_nm` varchar(255) DEFAULT NULL,
  `order_instt_nm` varchar(255) DEFAULT NULL,
  `dept_nm` varchar(255) DEFAULT NULL,
  `tel_no` varchar(50) DEFAULT NULL,
  `ofcl_nm` varchar(100) DEFAULT NULL,
  `ntice_dt` varchar(20) DEFAULT NULL,
  `bsns_ty_nm` varchar(100) DEFAULT NULL,
  `cntrct_mthd_nm` varchar(100) DEFAULT NULL,
  `prcrmnt_methd` varchar(100) DEFAULT NULL,
  `ntce_ntice_yn` varchar(10) DEFAULT NULL,
  `sum_order_amt` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`order_plan_unty_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 pager.quote_api_data:~13 rows (대략적) 내보내기
DELETE FROM `quote_api_data`;
INSERT INTO `quote_api_data` (`order_plan_unty_no`, `biz_nm`, `order_instt_nm`, `dept_nm`, `tel_no`, `ofcl_nm`, `ntice_dt`, `bsns_ty_nm`, `cntrct_mthd_nm`, `prcrmnt_methd`, `ntce_ntice_yn`, `sum_order_amt`, `created_at`, `updated_at`) VALUES
	('R25DD20431694', '2026년~2027년 균형발전본부 홈페이지 통합 유지관리 용역(장기계속)', '서울특별시', '균형발전정책과', '02-2133-8625', '이정희', '2025-11-10 09:53:14', '신규', '제한경쟁', '자체조달', 'N', 342916000, '2025-11-10 10:23:47', '2025-11-10 10:23:47'),
	('R25DD20436938', '2026년 서울특별시평생교육진흥원 홈페이지 운영 및 유지관리', '(재)서울특별시평생교육진흥원', '인사총무팀', '02-719-6094', '유강열', '2025-11-13 10:11:35', '신규', '제한경쟁', '자체조달', 'N', 45243000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20436953', '2026년  광주문화관광홈페이지 유지보수 및 콘텐츠보완 용역', '광주광역시', '관광도시과', '062-613-3632', '이현주', '2025-11-13 10:17:42', '신규', '제한경쟁', '자체조달', 'N', 60000000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20437300', '2026년 금천구 홈페이지  유지관리 및 기능개선 용역', '서울특별시 금천구', '소통담당관', '02-2627-1115', '김도익', '2025-11-13 13:39:35', '신규', '제한경쟁', '자체조달', 'N', 215041000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20437475', '2026년 서울역사박물관 홈페이지 유지관리 용역', '서울특별시', '서울역사박물관 시설과', '02-724-0129', '강대승', '2025-11-13 14:23:26', '신규', '제한경쟁', '자체조달', 'N', 217732000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20437945', '2026년 포항시 웹시스템 개선 및 유지관리 용역', '경상북도 포항시', '정보통신과', '054-270-2324', '오유림', '2025-11-13 16:31:43', '신규', '제한경쟁', '중앙조달', 'N', 257187000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20438109', 'CHEC 자원공유플랫폼 및 홈페이지 유지관리 사업', '충북대학교', '충청권 국립대학 공동 교육혁신센터', '043-249-1322', '전은희', '2025-11-13 17:21:34', '신규', '제한경쟁', '자체조달', 'N', 68000000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20438216', '울산 관광 홈페이지 내 무장애 관광 기능 추가 및 개선 용역', '재단법인울산문화관광재단', '재무회계팀', '052-255-1882', '백상하', '2025-11-13 17:53:14', '신규', '제한경쟁', '자체조달', 'N', 85000000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20438305', '2026년 강서구 홈페이지 유지관리 용역', '서울특별시 강서구', '스마트정보과', '02-2600-6618', '이건희', '2025-11-13 18:28:45', '신규', '제한경쟁', '자체조달', 'N', 219255000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20438364', '2026년 동대문구 홈페이지 유지관리 용역', '서울특별시 동대문구', '재무과', '02-2127-4532', '이정화', '2025-11-13 19:47:42', '신규', '제한경쟁', '자체조달', 'N', 204743650, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20438476', '2026년 국립국제교육원 홈페이지 통합 유지관리 용역', '교육부 국립국제교육원', '교육부 국립국제교육원 기획조정부', '02-3668-1390', '이진영', '2025-11-13 22:47:45', '신규', '제한경쟁', '자체조달', 'N', 60000000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20438634', '[긴급] 2025년 과총 국제협력포털 사이트(Ultari) 추가 기능 개발 용역', '한국과학기술단체총연합회', '경영지원부', '02-553-2181', '박형주', '2025-11-14 09:12:49', '신규', '제한경쟁', '자체조달', 'N', 80000000, '2025-11-14 09:18:32', '2025-11-14 09:18:32'),
	('R25DD20438678', '경기도미래세대재단 홈페이지 유지관리 및 통합·고도화 용역', '재단법인 경기도미래세대재단', '재무회계팀', '032-886-0094', '목수진', '2025-11-14 09:35:47', '신규', '제한경쟁', '자체조달', 'N', 1274200000, '2025-11-14 12:49:10', '2025-11-14 12:49:10');

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
	(9, '잔망루피 피규어 6색볼펜 (핑크/퍼플 택1)', 5400, 0, 0, '문구', '사무실', '<p><img style="width: 1px;" src="https://proxy-smartstore.naver.net/img/cG9yb3JvbWFsbDAxLmltZ2hvc3QuY2FmZTI0LmNvbS9pY29uaXgvemFubWFuZ2xvb3B5L1BSVDEyNDA0OV92aXAuanBn?token=41b4d096f58cf3d8b51ab8ce2e915861"><img style="width: 780px;" src="/upload/editor/1762739143829_cG9yb3JvbWFsbDAxLmltZ2hvc3QuY2FmZTI0LmNvbS9pY29uaXgvemFubWFuZ2xvb3B5L1BSVDEyNDA0OV92aXAuanBn.jfif"><img style="width: 1px;" src="	https://proxy-smartstore.naver.net/img/cG9yb3JvbWF…92aXAuanBn?token=41b4d096f58cf3d8b51ab8ce2e915861"><br></p>', '8764bb1e-52f8-4583-b63b-cc1f63db49e7.jpg', '잔망루', '2025-11-07 11:21:34', '2025-11-10 10:45:57', NULL, 'https://brand.naver.com/zanmangloopy/products/10912943541');

-- 테이블 pager.tb_bid_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_bid_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid_ntce_no` varchar(100) DEFAULT NULL,
  `cntrct_mthd_nm` varchar(255) DEFAULT NULL,
  `rgst_dt` varchar(50) DEFAULT NULL,
  `ntce_nm` varchar(500) DEFAULT NULL,
  `ntce_div_nm` varchar(255) DEFAULT NULL,
  `bid_methd_nm` varchar(255) DEFAULT NULL,
  `sucsfbid_mthd_nm` varchar(255) DEFAULT NULL,
  `ntce_instt_nm` varchar(500) DEFAULT NULL,
  `ofcl_nm` varchar(100) DEFAULT NULL,
  `ofcl_tel_no` varchar(100) DEFAULT NULL,
  `ofcl_email` varchar(255) DEFAULT NULL,
  `ntce_spec_doc_url1` varchar(500) DEFAULT NULL,
  `ntce_spec_doc_nm1` varchar(255) DEFAULT NULL,
  `ntce_spec_doc_url2` varchar(500) DEFAULT NULL,
  `ntce_spec_doc_nm2` varchar(255) DEFAULT NULL,
  `ntce_spec_doc_url3` varchar(500) DEFAULT NULL,
  `ntce_spec_doc_nm3` varchar(255) DEFAULT NULL,
  `ntce_spec_doc_url4` varchar(500) DEFAULT NULL,
  `ntce_spec_doc_nm4` varchar(255) DEFAULT NULL,
  `ntce_spec_doc_url5` varchar(500) DEFAULT NULL,
  `ntce_spec_doc_nm5` varchar(255) DEFAULT NULL,
  `ntce_spec_doc_url6` varchar(500) DEFAULT NULL,
  `ntce_spec_doc_nm6` varchar(255) DEFAULT NULL,
  `ntce_spec_doc_url7` varchar(500) DEFAULT NULL,
  `ntce_spec_doc_nm7` varchar(255) DEFAULT NULL,
  `ntce_spec_doc_url8` varchar(500) DEFAULT NULL,
  `ntce_spec_doc_nm8` varchar(255) DEFAULT NULL,
  `ntce_spec_doc_url9` varchar(500) DEFAULT NULL,
  `ntce_spec_doc_nm9` varchar(255) DEFAULT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `bid_ntce_no` (`bid_ntce_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 pager.tb_bid_info:~31 rows (대략적) 내보내기
DELETE FROM `tb_bid_info`;
INSERT INTO `tb_bid_info` (`id`, `bid_ntce_no`, `cntrct_mthd_nm`, `rgst_dt`, `ntce_nm`, `ntce_div_nm`, `bid_methd_nm`, `sucsfbid_mthd_nm`, `ntce_instt_nm`, `ofcl_nm`, `ofcl_tel_no`, `ofcl_email`, `ntce_spec_doc_url1`, `ntce_spec_doc_nm1`, `ntce_spec_doc_url2`, `ntce_spec_doc_nm2`, `ntce_spec_doc_url3`, `ntce_spec_doc_nm3`, `ntce_spec_doc_url4`, `ntce_spec_doc_nm4`, `ntce_spec_doc_url5`, `ntce_spec_doc_nm5`, `ntce_spec_doc_url6`, `ntce_spec_doc_nm6`, `ntce_spec_doc_url7`, `ntce_spec_doc_nm7`, `ntce_spec_doc_url8`, `ntce_spec_doc_nm8`, `ntce_spec_doc_url9`, `ntce_spec_doc_nm9`, `reg_date`) VALUES
	(819, 'R25BK01046416', '일반경쟁', '2025-09-08 11:25:43', '블록체인 기반 식품유통이력 플랫폼 앱*웹 보안취약점 점검 용역', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '주식회사 블록오디세이', '황학선', '02-2088-6042', 'finance@blockodyssey.io', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01046416&bidPbancOrd=000&fileType=&fileSeq=1', '[공고문]2025년 블록체인 민간분야 확산사업_앱웹보안취약점 점검.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01046416&bidPbancOrd=000&fileType=&fileSeq=2', '[과업내용서]2025년 블록체인 공공분야 확산사업_앱웹취약점 점검.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:00'),
	(820, 'R25BK01038115', '일반경쟁', '2025-09-02 14:14:18', '블록체인 기반 가상병원  앱 웹 보안취약점 점검 용역', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '주식회사 레몬헬스케어', '김기영', '***********', 'kiyoung.kim@lemonhc.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01038115&bidPbancOrd=000&fileType=&fileSeq=1', '블록체인 기반 가상병원  앱 웹 보안취약점 점검 용역_공고문.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01038115&bidPbancOrd=000&fileType=&fileSeq=2', '블록체인 기반 가상병원  앱 웹 보안취약점 점검 용역_제안요청서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:00'),
	(821, 'R25BK00960887', '일반경쟁', '2025-07-15 15:56:10', '남성향 액션 판타지 웹툰 일본어 번역 및 로컬라이징 용역', '등록공고', '전자입찰', '적격심사제', '(주)스튜디오넘버제로', '김영호', '***********', 'ryan@numberzero.co.kr', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00960887&bidPbancOrd=000&fileType=&fileSeq=1', '웹툰_일본어_로컬라이징_과업지시서_및_제안요청서.pdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:00'),
	(822, 'R25BK00999683', '일반경쟁', '2025-08-07 17:12:54', '쉬운 정보 접근성 서비스 홍보용 웹페이지 제작', '등록공고', '전자입찰', '적격심사제', '주식회사 소소한소통', '황주란', '070-7708-0874', 'joorans@sosocomm.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00999683&bidPbancOrd=000&fileType=&fileSeq=1', '# 서류 안내.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00999683&bidPbancOrd=000&fileType=&fileSeq=2', '1 (계약예규) 용역계약일반조건(기획재정부계약예규)(제758호)(20241224).pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00999683&bidPbancOrd=000&fileType=&fileSeq=3', '2 (계약예규) 정부 입찰·계약 집행기준(기획재정부계약예규)(제784호)(20250501).pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00999683&bidPbancOrd=000&fileType=&fileSeq=4', '3 일반용역계약 특수조건(조달청지침)(제43호)(20220211).pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00999683&bidPbancOrd=000&fileType=&fileSeq=5', '4 공정계약서약서(소소한소통).pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00999683&bidPbancOrd=000&fileType=&fileSeq=6', '5 과업내용서_쉬운 정보 접근성 서비스 홍보용 웹페이지 제작.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00999683&bidPbancOrd=000&fileType=&fileSeq=7', '서류 양식.zip', '', '', '', '', '2025-11-10 10:28:00'),
	(823, 'R25BK01013453', '제한경쟁', '2025-08-18 11:51:49', '블록체인 기반 대구시민 맞춤형 행정서비스 플랫폼 개발지원 사업 웹앱 보안취약점 점검 용역', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '(주)루트랩', '김하연', '070-4887-3561', 'nangpunch@rootlab.xyz', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01013453&bidPbancOrd=000&fileType=&fileSeq=1', '[공고문]블록체인 기반 대구시민 맞춤형 행정서비스 플랫폼 개발지원 사업 웹앱 보안취약점 점검 용역.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01013453&bidPbancOrd=000&fileType=&fileSeq=2', '[과업지시서]블록체인 기반 대구시민 맞춤형 행정서비스 플랫폼 개발지원 사업 웹앱 보안취약점 점검 용역.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:00'),
	(824, 'R25BK00879472', '일반경쟁', '2025-05-30 17:08:47', '2026 로보컵 홈페이지 개발 용역', '등록공고', '직찰', '제안서평가에의한낙찰자결정', '(사)한국AI·로봇산업협회', '김지은', '***********', 'rlawldms115@naver.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00879472&bidPbancOrd=000&fileType=&fileSeq=1', '[공고문] 2026 로보컵 홈페이지 개발 용역.pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00879472&bidPbancOrd=000&fileType=&fileSeq=2', '1. (제안요청서) 2026 로보컵 홈페이지 개발 용역.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00879472&bidPbancOrd=000&fileType=&fileSeq=3', '2. (붙임) [양식] 2026 로보컵 홈페이지 개발 용역 붙임서류.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:00'),
	(825, 'R25BK00898976', '제한경쟁', '2025-06-11 17:47:22', '2025년 서울상상나라 홈페이지 및 전산시스템 운영지원 및 유지,개선-호스팅포함', '등록공고', '직찰', '제안서평가에의한낙찰자결정', '커넥팅더닷츠(주)서울상상나라', '한상훈', '02-6450-9543', 'sanghun.han@seoulcm.kr', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00898976&bidPbancOrd=000&fileType=&fileSeq=1', '(입찰공고문)25년 서울상상나라 홈페이지 및 전산시스팀 운영지원 및 유지, 개선(호스팅포함).pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00898976&bidPbancOrd=000&fileType=&fileSeq=2', '(제안요청서)25년 서울상상나라 홈페이지 및 전산시스템 운영지원 및 유지, 개선(호스팅포함).hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:00'),
	(826, 'R25BK00856902', '제한경쟁', '2025-05-20 15:15:42', '산업전환 공동훈련센터 홈페이지 유지관리(1년)', '등록공고', '전자입찰', '최저가낙찰제', '(주)명신', '김정훈', '063-910-2703', 'kimjeonghoon@ms-global.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00856902&bidPbancOrd=000&fileType=&fileSeq=2', '3. 제안요청서(산업전환 홈페이지 유지보수 (1년).hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00856902&bidPbancOrd=000&fileType=&fileSeq=3', '3. 입찰공고 산업전환 홈페이지 유지보수 (1년).hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:00'),
	(827, 'R25BK00968274', '제한경쟁', '2025-07-29 13:26:21', '한국폐기물협회 홈페이지 구축', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '사단법인한국폐기물협회', '황은진', '02-2680-7021', 'ethdell@naver.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00968274&bidPbancOrd=000&fileType=&fileSeq=1', '입찰공고문(한국폐기물협회 홈페이지 구축).pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00968274&bidPbancOrd=000&fileType=&fileSeq=2', '(제안요청서)한국폐기물협회 홈페이지 구축 사업.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:00'),
	(828, 'R25BK00868976', '일반경쟁', '2025-05-26 17:53:06', '2025년 서울 이랜드 FC 홈페이지 및 APP 유지보수 서버 통합 운영', '등록공고', '직찰', '제안서평가에의한낙찰자결정', '주식회사 이랜드스포츠', '김상오', '02-3431-5470', 'kim_sangoh01@eland.co.kr', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00868976&bidPbancOrd=000&fileType=&fileSeq=1', '250526_(입찰공고서)2025년 서울 이랜드 FC 홈페이지 및 APP 유지보수 서버 통합 운영.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00868976&bidPbancOrd=000&fileType=&fileSeq=2', '250526_(제안요청서)2025년 서울 이랜드 FC 홈페이지 및 APP 유지보수 서버 통합 운영.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:00'),
	(831, 'R25BK00848965', '제한경쟁', '2025-05-15 17:28:35', '대한주택관리사협회 앱개발 입찰공고', '등록공고', '직찰', '적격심사제', '대한주택관리사협회', '전해석', '***********', 'jhs850829@khma.org', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00848965&bidPbancOrd=000&fileType=&fileSeq=1', '대한주택관리사협회_웹사이트 앱개발_입찰공고문.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00848965&bidPbancOrd=000&fileType=&fileSeq=2', '대한주택관리사협회_웹사이트 앱개발_과업지시서.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00848965&bidPbancOrd=000&fileType=&fileSeq=3', '대한주택관리사협회_웹사이트 앱개발_제안요청서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:01'),
	(833, 'R25BK00947014', '일반경쟁', '2025-07-08 09:13:24', '2025년 외국인 근로자 가이드앱 제작', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '인천외국인종합지원센터', '변성웅', '070-8209-4659', '98shoot@naver.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00947014&bidPbancOrd=001&fileType=&fileSeq=1', '인천외국인종합지원센터 누리장터 입찰공고문.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:01'),
	(834, 'R25BK00867484', '제한경쟁', '2025-05-26 13:34:10', '대한주택관리사협회 앱개발 입찰공고(재공고)', '등록공고', '전자입찰', '적격심사제', '대한주택관리사협회', '전해석', '***********', 'jhs850829@khma.org', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00867484&bidPbancOrd=000&fileType=&fileSeq=1', '대한주택관리사협회_웹사이트앱개발_입찰재공고문.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00867484&bidPbancOrd=000&fileType=&fileSeq=2', '대한주택관리사협회_웹사이트 앱개발_제안요청서.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00867484&bidPbancOrd=000&fileType=&fileSeq=3', '대한주택관리사협회_웹사이트 앱개발_과업지시서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:01'),
	(835, 'R25BK00963664', '일반경쟁', '2025-07-16 17:17:47', '2025년 외국인 근로자 가이드앱 제작', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '인천외국인종합지원센터', '변성웅', '070-8209-4659', '98shoot@naver.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00963664&bidPbancOrd=000&fileType=&fileSeq=1', '인천외국인종합지원센터 누리장터 입찰공고문.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:01'),
	(837, 'R25BK01115399', '일반경쟁', '2025-10-27 14:14:04', '글로벌 서비스 플랫폼 구축을 위한 앱 UI/UX 및 다국가 언어·데이터 연계 기술', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '주식회사 왓콘', '한영수', '', 'yshan@whatconn.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01115399&bidPbancOrd=000&fileType=&fileSeq=1', '2025-1027-입찰공고문.pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01115399&bidPbancOrd=000&fileType=&fileSeq=2', '2025-1027-제안요청서 글로벌 서비스 플랫폼 구축을 위한 앱 uiux및 다국가 언어데이터연계 기술-F.pdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:01'),
	(839, 'R25BK00933355', '제한경쟁', '2025-06-30 14:03:42', '‘WEB 3.0 공공서비스 생태계를 위한 상호연동 가능한 디지털 지갑 공동플랫폼 개발’ CSAP 인증 통합 컨설팅 용역', '등록공고', '직찰', '제안서평가에의한낙찰자결정', '주식회사 블로코', '강지혜', '031-714-6253', 'kang_jh@blocko.io', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00933355&bidPbancOrd=000&fileType=&fileSeq=1', '입찰공고_CSAP통합컨설팅용역_250630.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00933355&bidPbancOrd=000&fileType=&fileSeq=2', '제안요청서_CSAP통합컨설팅용역_250630.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:02'),
	(840, 'R25BK00959161', '일반경쟁', '2025-07-24 09:21:19', 'KAI_WEBLOGIC 시스템 유지보수 계약의 건', '변경공고', '직찰', '최저가낙찰제', '한국항공우주산업주식회사', '정창식', '***********', 'f1ab@naver.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00959161&bidPbancOrd=000&fileType=&fileSeq=1', '공고문 - Web logic 유지.docx', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00959161&bidPbancOrd=000&fileType=&fileSeq=2', '공고문_첨부1.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00959161&bidPbancOrd=000&fileType=&fileSeq=3', '공고문_첨부2_계약서.docx', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00959161&bidPbancOrd=000&fileType=&fileSeq=4', '첨부2_웹로직 유지보수 업무기술서(SOW)_1.docx', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:02'),
	(842, 'R25BK01043413', '제한경쟁', '2025-09-04 18:36:49', '항공권, 렌터카, 액티비티 온라인 부킹 툴 Web 프론트엔드 개발', '등록공고', '직찰', '제안서평가에의한낙찰자결정', '주식회사 누아', '곽재희', '***********', 'jay@nuua.ai', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01043413&bidPbancOrd=000&fileType=&fileSeq=1', '1. 입찰공고문(항공권 연계 온라인 부킹 툴 Web 프론트엔드 개발).pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01043413&bidPbancOrd=000&fileType=&fileSeq=2', '2. 제안요청서(항공권 연계 온라인 부킹 툴 Web 프론트엔드 개발).pdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:02'),
	(843, 'R25BK00878081', '제한경쟁', '2025-05-30 09:37:47', '2025년 체육진흥투표권 인터넷 발매사이트 경품운영 용역', '등록공고', '전자입찰', '적격심사제', '한국스포츠레저 주식회사', '변승리', '02-410-1216', 'victory@kspo.or.kr', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00878081&bidPbancOrd=000&fileType=&fileSeq=1', '입찰공고문(경품운영).hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00878081&bidPbancOrd=000&fileType=&fileSeq=2', '과업설명서(경품운영).hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00878081&bidPbancOrd=000&fileType=&fileSeq=3', '계약특수조건(경품운영).hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00878081&bidPbancOrd=000&fileType=&fileSeq=4', '청렴계약관련제서류(입찰유의서, 이행서약서, 이행특수조건).hwp', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:02'),
	(844, 'R25BK00940010', '제한경쟁', '2025-07-03 10:56:15', '대한주택관리사협회   교육∙안전 포털사이트 재구축 사업', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '대한주택관리사협회', '전해석', '***********', 'jhs850829@khma.org', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00940010&bidPbancOrd=000&fileType=&fileSeq=1', '교육안전포털시스템구축_입찰공고문.pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00940010&bidPbancOrd=000&fileType=&fileSeq=2', '대한주택관리사협회_제안요청서.pdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:02'),
	(845, 'R25BK00847074', '제한경쟁', '2025-05-15 10:28:27', '[사전규격공개] 2025년 체육진흥투표권 인터넷 발매사이트 경품운영 대행 용역', '등록공고', '전자입찰', '적격심사제', '한국스포츠레저 주식회사', '변승리', '02-410-1216', 'victory@kspo.or.kr', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00847074&bidPbancOrd=000&fileType=&fileSeq=1', '과업설명서(경품운영)_사전규격공개.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:02'),
	(847, 'R25BK00821908', '일반경쟁', '2025-05-14 18:02:49', '(재공고)지스타 국제게임컨퍼런스 G-CON 2025 위탁용역', '변경공고', '직찰', '제안서평가에의한낙찰자결정', '사단법인 한국게임산업협회', '김지석', '02-3477-2785', 'jiseok@gamek.or.kr', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00821908&bidPbancOrd=001&fileType=&fileSeq=1', '(재공고) 지스타 국제게임컨퍼런스 G-CON 2025 위탁용역_입찰 공고문.pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00821908&bidPbancOrd=001&fileType=&fileSeq=2', '(재공고) 지스타 국제게임컨퍼런스 G-CON 2025 위탁용역_제안요청서.pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00821908&bidPbancOrd=001&fileType=&fileSeq=3', '(재공고) 지스타 국제게임컨퍼런스 G-CON 2025 위탁용역_별지 서식.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:04'),
	(848, 'R25BK01000330', '일반경쟁', '2025-08-07 17:47:41', '솔라테리아 인게임 컷신 일러스트 제작', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '주식회사 스튜디오두달', '이규원', '', 'eq1@studiodoodal.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01000330&bidPbancOrd=000&fileType=&fileSeq=1', '[스튜디오 두달] 인게임 컷신 일러스트 누리장터 공고서.pdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:04'),
	(849, 'R25BK01029731', '일반경쟁', '2025-08-27 15:23:10', '후추게임스튜디오 BGM 제작 용역', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '(주)후추게임스튜디오', '민세희', '', 'sehee@hoochoogamestudios.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01029731&bidPbancOrd=000&fileType=&fileSeq=1', '입찰공고문.docx', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01029731&bidPbancOrd=000&fileType=&fileSeq=2', '과업지시서.pdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:04'),
	(850, 'R25BK01093873', '제한경쟁', '2025-10-15 18:01:01', '프로스토리 게임 음악 제작 용역', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '주식회사 팀오파츠', '서병기', '***********', 'seobyeongky@naver.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01093873&bidPbancOrd=000&fileType=&fileSeq=1', '[006] 과업내용서.docx', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01093873&bidPbancOrd=000&fileType=&fileSeq=2', '팀 오파츠 사운드 제작 용역 계약서.pdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:04'),
	(851, 'R25BK00901041', '일반경쟁', '2025-06-12 15:13:59', '국제게임전시회 지스타 2025 개최 위탁 용역', '등록공고', '직찰', '제안서평가에의한낙찰자결정', '사단법인 한국게임산업협회', '이현지', '', 'hj@gamek.or.kr', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00901041&bidPbancOrd=000&fileType=&fileSeq=1', '국제게임전시회 지스타 2025 개최 위탁 용역_입찰공고문.pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00901041&bidPbancOrd=000&fileType=&fileSeq=2', '국제게임전시회 지스타 2025 개최 위탁 용역_제안요청서.pdf', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00901041&bidPbancOrd=000&fileType=&fileSeq=3', '국제게임전시회 지스타 2025 개최 위탁 용역_별지서식.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:04'),
	(852, 'R25BK00950020', '일반경쟁', '2025-07-09 10:44:53', '2025 K리그 팬 참여 이벤트_K리그 보드게임 대회 기획 및 운영', '등록공고', '직찰', '제안서평가에의한낙찰자결정', '(사)한국프로축구연맹', '이창훈', '', 'leech@kleague.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00950020&bidPbancOrd=000&fileType=&fileSeq=1', '(공고) 2025 K리그 팬 참여 이벤트_\'K리그 보드게임 대회(가칭)\' 기획 및 운영 제안요청서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:04'),
	(853, 'R25BK01110752', '일반경쟁', '2025-10-29 14:32:41', '솔라테리아 인게임 사운드 제작', '취소공고', '전자입찰', '제안서평가에의한낙찰자결정', '주식회사 스튜디오두달', '이규원', '', 'eq1@studiodoodal.com', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK01110752&bidPbancOrd=000&fileType=&fileSeq=1', '[스튜디오 두달] 인게임 사운드 제작 누리장터 공고서.pdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-10 10:28:04'),
	(869, 'R25BK00848869', '일반경쟁', '2025-05-15 17:00:34', '2025년 서울 이랜드 FC 홈페이지 및 APP 유지보수 서버 통합 운영', '등록공고', '직찰', '제안서평가에의한낙찰자결정', '주식회사 이랜드스포츠', '김상오', '02-3431-5470', 'kim_sangoh01@eland.co.kr', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00848869&bidPbancOrd=000&fileType=&fileSeq=1', '250513_(입찰공고서)2025년 서울 이랜드 FC 홈페이지 및 APP 유지보수 서버 통합 운영.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00848869&bidPbancOrd=000&fileType=&fileSeq=2', '250513_(제안요청서)2025년 서울 이랜드 FC 홈페이지 및 APP 유지보수 서버 통합 운영.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-14 09:16:48'),
	(886, 'R25BK00854912', '제한경쟁', '2025-05-20 09:44:50', '[사전규격공개] 2025년 체육진흥투표권 인터넷 발매사이트 경품 운영 대행 용역', '등록공고', '전자입찰', '적격심사제', '한국스포츠레저 주식회사', '변승리', '02-410-1216', 'victory@kspo.or.kr', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00854912&bidPbancOrd=000&fileType=&fileSeq=1', '1. 과업설명서(경품운영)_사전규격.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00854912&bidPbancOrd=000&fileType=&fileSeq=2', '2. 계약특수조건(경품운영)_사전규격.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-14 09:16:50'),
	(1067, 'R25BK00890431', '일반경쟁', '2025-06-09 10:44:53', 'NEXT.js 기반 프론트엔드 퍼블리싱 개발 위탁 용역', '등록공고', '전자입찰', '제안서평가에의한낙찰자결정', '(주)인사이트베슬', '남지원', '', 'ceo@insightvessel.io', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00890431&bidPbancOrd=000&fileType=&fileSeq=1', '1. NEXT.JS 기반 프론엔드 퍼블리싱_공고문.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00890431&bidPbancOrd=000&fileType=&fileSeq=2', '2. NEXT.JS 기반 프론엔드 퍼블리싱_제안요청서.hwp', 'https://www.g2b.go.kr/pn/pnp/pnpe/UntyAtchFile/downloadFile.do?bidPbancNo=R25BK00890431&bidPbancOrd=000&fileType=&fileSeq=3', '입찰유의서(일반용역)_NEXT.JS 기반 프론엔드 퍼블리싱.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '2025-11-14 12:49:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 pager.user:~6 rows (대략적) 내보내기
DELETE FROM `user`;
INSERT INTO `user` (`id`, `mbId`, `mbPassword`, `mbName`, `joinDate`, `recentDate`, `hashYN`) VALUES
	(1, 'admin@naver.com', '$2a$10$WQovPA3.MTYS5sXgTmsnMuvPg4apPfhvb5hqnK/l.FTI02x0IHEDy', '관리자', '2025-11-04 16:14:14', '2025-11-14 12:33:30', 'N'),
	(3, 'user@naver.com', '$2a$10$sd1W8VdRbhkG/hWjbUFTsOnSTrXnUJ7CfzHfry4YLARPIpdjztKwi', '홍길동', '2025-11-07 08:45:52', '2025-11-07 09:12:28', 'Y'),
	(4, 'user@naver.com', '$2a$10$URUCHwqive690QGEos.0juQOrcea.QcThzsIXVY2BQH7w0Xf9HDIi', '홍길동', '2025-11-07 09:13:39', '2025-11-07 09:13:39', 'N'),
	(5, 'user2@naver.com', '$2a$10$iUeJYv5GeITkHrg37cOEpeSyWI6.ZiKPjyL3ygfcliIZCvLkxv19m', '김철수', '2025-11-07 15:37:45', '2025-11-10 11:28:21', 'Y'),
	(6, 'user2@naver.com', '$2a$10$iUeJYv5GeITkHrg37cOEpeSyWI6.ZiKPjyL3ygfcliIZCvLkxv19m', '김철수', '2025-11-07 16:11:17', '2025-11-10 11:28:21', 'N'),
	(7, 'user3@naver.com', '$2a$10$Z8tBROmSjlUXZjEs0amPxO46pNkujJqWRpZ5yMDF/v3ZuEJ7kmTv6', '테스트', '2025-11-14 11:35:28', '2025-11-14 11:35:28', 'N');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
