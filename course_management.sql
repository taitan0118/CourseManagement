USE [master]
GO
/****** Object:  Database [CourseManagement]    Script Date: 22-06-2024 9:53:01 AM ******/
CREATE DATABASE [CourseManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourseManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CourseManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CourseManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CourseManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CourseManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourseManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourseManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourseManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourseManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourseManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourseManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourseManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CourseManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourseManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourseManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourseManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourseManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourseManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourseManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourseManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourseManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CourseManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourseManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourseManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourseManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourseManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourseManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourseManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourseManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [CourseManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CourseManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourseManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourseManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourseManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CourseManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CourseManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CourseManagement', N'ON'
GO
ALTER DATABASE [CourseManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [CourseManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CourseManagement]
GO
/****** Object:  Table [dbo].[cm_course]    Script Date: 22-06-2024 9:53:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cm_course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[about] [nvarchar](1000) NULL,
	[course_image] [varchar](255) NULL,
	[course_name] [nvarchar](255) NULL,
	[creation_date] [date] NULL,
	[video_duration] [nvarchar](255) NULL,
	[video_url] [varchar](255) NULL,
	[topic_id] [int] NULL,
 CONSTRAINT [PK__cm_cours__8F1EF7AE07B50F52] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cm_course_detail]    Script Date: 22-06-2024 9:53:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cm_course_detail](
	[course_dtl_id] [int] IDENTITY(1,1) NOT NULL,
	[viewed_time] [time](7) NULL,
	[course_id] [int] NULL,
	[enroll_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cm_enroll]    Script Date: 22-06-2024 9:53:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cm_enroll](
	[enroll_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[enroll_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cm_rate]    Script Date: 22-06-2024 9:53:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cm_rate](
	[rate_id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [nvarchar](255) NULL,
	[date_comment] [nvarchar](255) NULL,
	[is_comment] [bit] NULL,
	[stars] [int] NULL,
	[course_id] [int] NULL,
	[enroll_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cm_role]    Script Date: 22-06-2024 9:53:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cm_role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_desc] [varchar](255) NULL,
	[role_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cm_topic]    Script Date: 22-06-2024 9:53:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cm_topic](
	[topic_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](255) NULL,
	[topic_image] [varchar](255) NULL,
	[topic_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cm_user]    Script Date: 22-06-2024 9:53:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cm_user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[avatar] [varchar](255) NULL,
	[birthday] [date] NULL,
	[email] [varchar](255) NULL,
	[full_name] [nvarchar](512) NULL,
	[gender] [bit] NULL,
	[is_active] [bit] NULL,
	[password] [varchar](255) NULL,
	[phone_number] [varchar](255) NULL,
	[registration_date] [date] NULL,
	[user_name] [varchar](255) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cm_course] ON 

INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (1, N'Khóa học Angular 4 (Angular 2+) toàn diện nhất. Xây dựng ứng dụng thương mại điện tử thực sự với Angular, Firebase và Bootstrap 4', N'angular.jpg', N'Angular: Từ cơ bản đến nâng cao', CAST(N'2024-01-01' AS Date), N'2 giờ 30 phút', N'https://example.com/angular', 1)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (2, N'Thành thạo React hiện đại từ người mới bắt đầu đến nâng cao! Next.js, Context API, React Query, Redux, Tailwind, các mẫu nâng cao', N'react-next.jpg', N'React, Next.js, Redux cho người mới', CAST(N'2024-02-01' AS Date), N'1 giờ 43 phút', N'https://example.com/react-next', 1)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (3, N'Khóa học giúp bạn hiểu rõ về Spring Boot và Hibernate', N'springboot.jpg', N'Spring Boot & Hibernate', CAST(N'2024-03-01' AS Date), N'5 giờ 10 phút', N'https://example.com/spring-boot', 1)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (4, N'Flutter là một nền tảng phát triển ứng dụng di động của Google. Sau khóa học này, bạn sẽ học được cách phát triển ứng dụng di động đa nền tảng với Flutter, sử dụng Dart và xây dựng các giao diện người dùng đẹp mắt và năng động.', N'flutter.jpg', N'Flutter & Dart - 2024', CAST(N'2024-04-01' AS Date), N'2 giờ 45 phút', N'https://example.com/flutter', 3)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (5, N'VueJS là một framework JavaScript linh hoạt và dễ sử dụng cho việc xây dựng giao diện người dùng. Sau khi hoàn thành khóa học này, bạn sẽ có khả năng xây dựng các ứng dụng web linh hoạt và hiệu quả với VueJS, làm quen với các khái niệm quan trọng như component, directive và state management.', N'vue.jpg', N'VueJS 3 & Firebase', CAST(N'2024-05-01' AS Date), N'3 giờ 02 phút', N'https://example.com/vuejs', 1)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (6, N'NextJS là một framework React cho phép bạn xây dựng các ứng dụng web tĩnh và động dễ dàng. Sau khi tham gia khóa học này, bạn sẽ biết cách sử dụng NextJS để phát triển các ứng dụng web tĩnh và động một cách hiệu quả, cùng với các tính năng SSR (Server-Side Rendering) và SSG (Static Site Generation).', N'nextjs.jpg', N'NextJS 14 & React - 2024', CAST(N'2024-06-01' AS Date), N'2 giờ', N'https://example.com/nextjs', 1)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (7, N'PostgreSQL là một hệ quản trị cơ sở dữ liệu mạnh mẽ và phổ biến, tuân thủ các tiêu chuẩn SQL. Sau khi hoàn thành khóa học này, bạn sẽ có kiến thức sâu rộng về PostgreSQL, bao gồm thiết kế cơ sở dữ liệu, các câu lệnh SQL phổ biến và các kỹ thuật tối ưu hóa truy vấn.', N'postgre.jpg', N'PostgreSQL cho người mới', CAST(N'2024-07-01' AS Date), N'3 giờ 55 phút', N'https://example.com/postgresql', 2)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (8, N'Oracle Database là một trong những hệ quản trị cơ sở dữ liệu quan trọng nhất trên thế giới. Sau khi kết thúc khóa học này, bạn sẽ nắm được cách triển khai, quản lý và tối ưu hóa hệ thống cơ sở dữ liệu Oracle, từ thiết kế đến quản lý hiệu suất.', N'oracle.jpg', N'Oracle SQL - 2024', CAST(N'2024-08-01' AS Date), N'6 giờ 34 phút', N'https://example.com/oracle', 2)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (9, N'Khóa học Kotlin căn bản dành cho người mới bắt đầu. Học Kotlin từ cơ bản đến nâng cao, bao gồm cú pháp, lập trình hàm, lập trình hướng đối tượng và các tính năng nâng cao.', N'kotlin.jpg', N'Kotlin & Spring Boot', CAST(N'2024-09-01' AS Date), N'4 giờ 22 phút', N'https://example.com/kotlin', 3)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (10, N'Học Ruby on Rails từ cơ bản đến nâng cao. Xây dựng các ứng dụng web mạnh mẽ và hiệu quả với Rails, bao gồm thiết kế cơ sở dữ liệu, tương tác với front-end và triển khai sản phẩm.', N'rails.jpg', N'Ruby on Rails - 2024', CAST(N'2024-10-01' AS Date), N'5 giờ 56 phút', N'https://example.com/ruby-on-rails', 3)
INSERT [dbo].[cm_course] ([course_id], [about], [course_image], [course_name], [creation_date], [video_duration], [video_url], [topic_id]) VALUES (11, N'Học React Native từ cơ bản đến nâng cao. Xây dựng ứng dụng di động đa nền tảng với React Native, sử dụng JavaScript/TypeScript và các thành phần native, bao gồm quản lý trạng thái, điều hướng và tối ưu hóa hiệu suất.', N'react-native.jpg', N'React Native - Zero to Hero', CAST(N'2024-11-01' AS Date), N'3 giờ 30 phút', N'https://example.com/react-native', 3)
SET IDENTITY_INSERT [dbo].[cm_course] OFF
GO
SET IDENTITY_INSERT [dbo].[cm_course_detail] ON 

INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (1, CAST(N'00:10:00' AS Time), 1, 1, 1)
INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (2, CAST(N'00:15:00' AS Time), 2, 2, 2)
INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (3, CAST(N'00:20:00' AS Time), 3, 3, 3)
INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (4, CAST(N'00:25:00' AS Time), 4, 4, 4)
INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (5, CAST(N'00:30:00' AS Time), 5, 5, 5)
INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (6, CAST(N'00:35:00' AS Time), 6, 6, 6)
INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (7, CAST(N'00:40:00' AS Time), 7, 7, 7)
INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (8, CAST(N'00:45:00' AS Time), 8, 8, 8)
INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (9, CAST(N'00:50:00' AS Time), 9, 9, 9)
INSERT [dbo].[cm_course_detail] ([course_dtl_id], [viewed_time], [course_id], [enroll_id], [user_id]) VALUES (10, CAST(N'00:55:00' AS Time), 10, 10, 10)
SET IDENTITY_INSERT [dbo].[cm_course_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[cm_enroll] ON 

INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (1, 1, 1)
INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (2, 6, 1)
INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (3, 9, 1)
INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (4, 10, 1)
INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (5, 2, 2)
INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (6, 5, 2)
INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (7, 7, 2)
INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (8, 10, 2)
INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (9, 3, 3)
INSERT [dbo].[cm_enroll] ([enroll_id], [course_id], [user_id]) VALUES (10, 4, 3)
SET IDENTITY_INSERT [dbo].[cm_enroll] OFF
GO
SET IDENTITY_INSERT [dbo].[cm_rate] ON 

INSERT [dbo].[cm_rate] ([rate_id], [comment], [date_comment], [is_comment], [stars], [course_id], [enroll_id], [user_id]) VALUES (1, N'Thua VueJS', N'22/06/2024. 07:28:07', 0, 1, 1, NULL, 2)
INSERT [dbo].[cm_rate] ([rate_id], [comment], [date_comment], [is_comment], [stars], [course_id], [enroll_id], [user_id]) VALUES (2, N'Khóa học rất hay và chất lượng', N'22/06/2024. 07:28:26', 0, 5, 1, NULL, 3)
INSERT [dbo].[cm_rate] ([rate_id], [comment], [date_comment], [is_comment], [stars], [course_id], [enroll_id], [user_id]) VALUES (3, N'Rất hay', N'22/06/2024. 07:29:39', 0, 4, 1, NULL, 6)
INSERT [dbo].[cm_rate] ([rate_id], [comment], [date_comment], [is_comment], [stars], [course_id], [enroll_id], [user_id]) VALUES (4, N'Hay', N'22/06/2024. 07:30:08', 0, 5, 3, NULL, 6)
INSERT [dbo].[cm_rate] ([rate_id], [comment], [date_comment], [is_comment], [stars], [course_id], [enroll_id], [user_id]) VALUES (5, N'Quá hay', N'22/06/2024. 07:30:20', 0, 5, 3, NULL, 2)
INSERT [dbo].[cm_rate] ([rate_id], [comment], [date_comment], [is_comment], [stars], [course_id], [enroll_id], [user_id]) VALUES (6, N'quá dở', N'22/06/2024. 08:23:35', 0, 1, 2, NULL, 1)
INSERT [dbo].[cm_rate] ([rate_id], [comment], [date_comment], [is_comment], [stars], [course_id], [enroll_id], [user_id]) VALUES (7, N'quá đỉnh', N'22/06/2024. 09:18:16', 0, 5, 1, NULL, 6)
SET IDENTITY_INSERT [dbo].[cm_rate] OFF
GO
SET IDENTITY_INSERT [dbo].[cm_role] ON 

INSERT [dbo].[cm_role] ([role_id], [role_desc], [role_name]) VALUES (1, N'ROLE_ADMIN', N'Admin')
INSERT [dbo].[cm_role] ([role_id], [role_desc], [role_name]) VALUES (2, N'ROLE_USER', N'User')
SET IDENTITY_INSERT [dbo].[cm_role] OFF
GO
SET IDENTITY_INSERT [dbo].[cm_topic] ON 

INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (1, N'Tìm hiểu và phát triển ứng dụng web', N'uxui.jpg', N'Lập trình web')
INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (2, N'Thiết kế và quản lý cơ sở dữ liệu', N'database.jpg', N'Cơ sở dữ liệu')
INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (3, N'Phát triển ứng dụng di động cho iOS và Android', N'mobile.jpg', N'Lập trình mobile')
INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (4, N'Quản lý và triển khai dịch vụ trên đám mây', N'cloud.jpg', N'Điện toán đám mây')
INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (5, N'Các cấu trúc dữ liệu và thuật toán cơ bản và nâng cao', N'dsa.jpg', N'Cấu trúc dữ liệu và giải thuật')
INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (6, N'Tìm hiểu và ứng dụng trí tuệ nhân tạo', N'ai.jpg', N'Trí tuệ nhân tạo')
INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (7, N'Phân tích dữ liệu và khoa học máy tính', N'data_science.jpg', N'Khoa học máy tính')
INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (8, N'Phát triển và lập trình game', N'game_dev.jpg', N'Lập trình game')
INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (9, N'Bảo mật thông tin và an ninh mạng', N'security.jpg', N'An ninh mạng')
INSERT [dbo].[cm_topic] ([topic_id], [description], [topic_image], [topic_name]) VALUES (10, N'Phát triển ứng dụng và công nghệ thực tế ảo', N'vr.jpg', N'Thực tế ảo')
SET IDENTITY_INSERT [dbo].[cm_topic] OFF
GO
SET IDENTITY_INSERT [dbo].[cm_user] ON 

INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (1, N'1.jpg', CAST(N'2004-01-01' AS Date), N'hoangph.dev@gmail.com', N'Phan Huy Hoàng', 1, 1, N'123', N'0909123456', CAST(N'2024-01-01' AS Date), N'phh235', 1)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (2, N'2.jpg', CAST(N'2004-02-02' AS Date), N'taint.dev@gmail.com', N'Nguyễn Tấn Tài', 0, 1, N'123', N'0912123456', CAST(N'2024-01-02' AS Date), N'taint', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (3, N'3.jpg', CAST(N'2004-03-03' AS Date), N'nhandt.dev@gmail.com', N'Dư Trọng Nhân', 1, 1, N'123', N'0913123456', CAST(N'2024-01-03' AS Date), N'nhandt', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (4, N'4.jpg', CAST(N'2004-04-04' AS Date), N'mynt.dev@gmail.com', N'Nguyễn Thị Trà My', 0, 1, N'123', N'0914123456', CAST(N'2024-01-04' AS Date), N'mynt', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (5, N'5.jpg', CAST(N'2004-05-05' AS Date), N'linhnt.dev@gmail.com', N'Nguyễn Thị Thùy Linh', 1, 1, N'123', N'0915123456', CAST(N'2024-01-05' AS Date), N'linhnt', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (6, N'6.jpg', CAST(N'2004-06-06' AS Date), N'longpd.dev@gmail.com', N'Phạm Đức Long', 1, 1, N'123', N'0916123456', CAST(N'2024-01-06' AS Date), N'longpd', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (7, N'7.jpg', CAST(N'2004-07-07' AS Date), N'khanhlt.dev@gmail.com', N'Lê Thị Khánh', 0, 1, N'123', N'0917123456', CAST(N'2024-01-07' AS Date), N'khanhlt', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (8, N'8.jpg', CAST(N'2004-08-08' AS Date), N'hoanganh.dev@gmail.com', N'Trần Hoàng Anh', 1, 1, N'123', N'0918123456', CAST(N'2024-01-08' AS Date), N'hoanganh', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (9, N'9.jpg', CAST(N'2004-09-09' AS Date), N'thuyltt.dev@gmail.com', N'Lê Thị Thùy', 0, 1, N'123', N'0919123456', CAST(N'2024-01-09' AS Date), N'thuyltt', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (10, N'10.jpg', CAST(N'2004-10-10' AS Date), N'vantoan.dev@gmail.com', N'Nguyễn Văn Toàn', 1, 1, N'123', N'0920123456', CAST(N'2024-01-10' AS Date), N'vantoan', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (11, N'11.jpg', CAST(N'2004-11-11' AS Date), N'hanhtp.dev@gmail.com', N'Phan Thị Hạnh', 0, 1, N'123', N'0921123456', CAST(N'2024-01-11' AS Date), N'hanhtp', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (12, N'12.jpg', CAST(N'2004-12-12' AS Date), N'tuanlt.dev@gmail.com', N'Lê Trọng Tuấn', 1, 1, N'123', N'0922123456', CAST(N'2024-01-12' AS Date), N'tuanlt', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (13, N'13.jpg', CAST(N'2004-01-13' AS Date), N'thuyendm.dev@gmail.com', N'Doãn Mỹ Thuyền', 0, 1, N'123', N'0923123456', CAST(N'2024-01-13' AS Date), N'thuyendm', 2)
INSERT [dbo].[cm_user] ([user_id], [avatar], [birthday], [email], [full_name], [gender], [is_active], [password], [phone_number], [registration_date], [user_name], [role_id]) VALUES (14, N'14.jpg', CAST(N'2004-02-14' AS Date), N'tamnt.dev@gmail.com', N'Nguyễn Thanh Tâm', 1, 1, N'123', N'0924123456', CAST(N'2024-01-14' AS Date), N'tamnt', 2)
SET IDENTITY_INSERT [dbo].[cm_user] OFF
GO
ALTER TABLE [dbo].[cm_course]  WITH CHECK ADD  CONSTRAINT [FK7fdq4j7kgeskskk3u5ji9x80y] FOREIGN KEY([topic_id])
REFERENCES [dbo].[cm_topic] ([topic_id])
GO
ALTER TABLE [dbo].[cm_course] CHECK CONSTRAINT [FK7fdq4j7kgeskskk3u5ji9x80y]
GO
ALTER TABLE [dbo].[cm_course_detail]  WITH CHECK ADD  CONSTRAINT [FK41wp4loq1cm0v8siell7q6s4m] FOREIGN KEY([enroll_id])
REFERENCES [dbo].[cm_enroll] ([enroll_id])
GO
ALTER TABLE [dbo].[cm_course_detail] CHECK CONSTRAINT [FK41wp4loq1cm0v8siell7q6s4m]
GO
ALTER TABLE [dbo].[cm_course_detail]  WITH CHECK ADD  CONSTRAINT [FKnqbn96r34t7b2mtqo9sru6guh] FOREIGN KEY([user_id])
REFERENCES [dbo].[cm_user] ([user_id])
GO
ALTER TABLE [dbo].[cm_course_detail] CHECK CONSTRAINT [FKnqbn96r34t7b2mtqo9sru6guh]
GO
ALTER TABLE [dbo].[cm_course_detail]  WITH CHECK ADD  CONSTRAINT [FKroj806d4tyf6vxxegji3ygjjt] FOREIGN KEY([course_id])
REFERENCES [dbo].[cm_course] ([course_id])
GO
ALTER TABLE [dbo].[cm_course_detail] CHECK CONSTRAINT [FKroj806d4tyf6vxxegji3ygjjt]
GO
ALTER TABLE [dbo].[cm_enroll]  WITH CHECK ADD  CONSTRAINT [FK5y1i1lqxv93nr7aavhif97t0n] FOREIGN KEY([course_id])
REFERENCES [dbo].[cm_course] ([course_id])
GO
ALTER TABLE [dbo].[cm_enroll] CHECK CONSTRAINT [FK5y1i1lqxv93nr7aavhif97t0n]
GO
ALTER TABLE [dbo].[cm_enroll]  WITH CHECK ADD  CONSTRAINT [FK6sj9u9xxf094snlc799t8ril5] FOREIGN KEY([user_id])
REFERENCES [dbo].[cm_user] ([user_id])
GO
ALTER TABLE [dbo].[cm_enroll] CHECK CONSTRAINT [FK6sj9u9xxf094snlc799t8ril5]
GO
ALTER TABLE [dbo].[cm_rate]  WITH CHECK ADD  CONSTRAINT [FKb8ssl8j61wuiaepev8q8asjyp] FOREIGN KEY([enroll_id])
REFERENCES [dbo].[cm_enroll] ([enroll_id])
GO
ALTER TABLE [dbo].[cm_rate] CHECK CONSTRAINT [FKb8ssl8j61wuiaepev8q8asjyp]
GO
ALTER TABLE [dbo].[cm_rate]  WITH CHECK ADD  CONSTRAINT [FKdb9ul34mdrck01yj4en5c2qii] FOREIGN KEY([course_id])
REFERENCES [dbo].[cm_course] ([course_id])
GO
ALTER TABLE [dbo].[cm_rate] CHECK CONSTRAINT [FKdb9ul34mdrck01yj4en5c2qii]
GO
ALTER TABLE [dbo].[cm_rate]  WITH CHECK ADD  CONSTRAINT [FKl4li2c0a5n09onasj75pedoxo] FOREIGN KEY([user_id])
REFERENCES [dbo].[cm_user] ([user_id])
GO
ALTER TABLE [dbo].[cm_rate] CHECK CONSTRAINT [FKl4li2c0a5n09onasj75pedoxo]
GO
ALTER TABLE [dbo].[cm_user]  WITH CHECK ADD  CONSTRAINT [FKij8co7est1qc4om7le9r8yb82] FOREIGN KEY([role_id])
REFERENCES [dbo].[cm_role] ([role_id])
GO
ALTER TABLE [dbo].[cm_user] CHECK CONSTRAINT [FKij8co7est1qc4om7le9r8yb82]
GO
USE [master]
GO
ALTER DATABASE [CourseManagement] SET  READ_WRITE 
GO
