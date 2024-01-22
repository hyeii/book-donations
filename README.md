# 책도네

<img src="img/logo.png">

## 목차

1. [**서비스 소개**](#1)
2. [**프로젝트 일정**](#2)
3. [**팀원 소개**](#3)
4. [**기술 스택**](#4)
5. [**시스템 아키텍처**](#5)
6. [**주요 기능**](#6)

<div id="1"></div>

## 💡 서비스 소개

### 책도네

> 중고 도서를 주고받으며 <br/>
> 지속적인 선순환을 유도하는 서비스 <br/>

<br />

<div id="2"></div>

## 📆 프로젝트 일정

### 23.10.10 ~ 23.11.17

- 기획 및 설계 : 23.10.10 ~ 23.10.18
- 프로젝트 구현 : 23.10.19 ~ 23.11.15
- 버그 수정 및 산출물 정리 : 23.11.16 ~ 17

<br/>

<div id="3"></div>

## 👪 팀원 소개

<table>
    <tr>
        <td height="140px" align="center"> <a href="https://github.com/chakunyoung">
            <img src="https://avatars.githubusercontent.com/chakunyoung" width="140px" /> <br><br> 👑 차건영 <br>(Back-End) </a> <br></td>
        <td height="140px" align="center"> <a href="https://github.com/DeadBBall">
            <img src="https://avatars.githubusercontent.com/DeadBBall" width="140px" /> <br><br> 😁 김용균 <br>(Back-End) </a> <br></td>
        <td height="140px" align="center"> <a href="https://github.com/sangilji">
            <img src="https://avatars.githubusercontent.com/sangilji" width="140px" /> <br><br> 🙂 지상일 <br>(Back-End) </a> <br></td>
        <td height="140px" align="center"> <a href="https://github.com/eastsage">
            <img src="https://avatars.githubusercontent.com/eastsage" width="140px" /> <br><br> 😆 이동현 <br>(Back-End) </a> <br></td>
        <td height="140px" align="center"> <a href="https://github.com/hyeii">
            <img src="https://avatars.githubusercontent.com/hyeii" width="140px" /> <br><br> 🙄 윤혜민 <br>(Front-End) </a> <br></td>
    </tr>
</table>

<br>

<div id="4"></div>

## 🛠️ 기술 스택

|                 Flutter                 |                 Dart                 |                 Riverpod                 |                 Firebase                 |                Spring Boot                 |                 Jenkins                 |                 Docker                 |                 Redis                 |                 Kafka                 |                 MySQL                 |                 EC2                 |                 Elastic Search                 |
| :-------------------------------------: | :----------------------------------: | :--------------------------------------: | :--------------------------------------: | :----------------------------------------: | :-------------------------------------: | :------------------------------------: | :-----------------------------------: | :-----------------------------------: | :-----------------------------------: | :---------------------------------: | :--------------------------------------------: |
| <img src="img/flutter.png" width="110"> | <img src="img/dart.png" width="110"> | <img src="img/riverpod.png" width="110"> | <img src="img/firebase.png" width="110"> | <img src="img/springboot.png" width="110"> | <img src="img/jenkins.png" width="110"> | <img src="img/docker.png" width="110"> | <img src="img/redis.png" width="110"> | <img src="img/kafka.png" width="110"> | <img src="img/mysql.png" width="110"> | <img src="img/ec2.png" width="110"> | <img src="img/elastic-search.png" width="110"> |

<br />

<div id="5"></div>

## 🗂️ 시스템 아키텍처

<img src="img/architecture-diagram.png">

<br />

<div id="6"></div>

## 💻 주요 기능

### 온보딩 & 카카오 로그인

<img src="img/intro.gif" width = "300px" style="margin-right: 15px">

<br>

### 메인 화면 및 랭킹

<img src="img/main-update.png" width = "300px"  style="margin-right: 15px">

### 도서 검색 및 자동완성

<img src="img/auto_gif.gif" width = "300px"  style="margin-right: 15px">

<br>

### 책 정보 상세 및 관심도서 설정

<img src="img/book-detail.png" width = "300px"  style="margin-right: 15px">
<img src="img/wish-book.png" width = "300px"  style="margin-right: 15px">

<br>

### 도서 당 지역별 현재 기부 글 내역 및 보유중인 지역 안내

<img src="img/region_select.gif" width = "300px"  style="margin-right: 15px">
<img src="img/keeping.png" width = "300px"  style="margin-right: 15px">

<br>

### 나눔 신청 및 채팅 시작, 푸시 알림

- 나눔 신청
  <br>

<img src="img/donation-check.png" width = "300px"  style="margin-right: 15px">

<br>

- 새로운 채팅 알림 및 채팅 확인

<img src="img/push-notification.png" width = "300px"  style="margin-right: 15px">
<img src="img/chats.png" width = "300px"  style="margin-right: 15px">

<br>    
  
- 채팅 및 기부 상태 변경 알림  
<br>

<img src="img/chat_notification.gif" width = "300px"  style="margin-right: 15px">
<img src="img/push2.png" width = "300px"  style="margin-right: 15px">

<br>

### 거래 완료 후 보유중인 책 히스토리 작성

<img src="img/write-history.png" width = "300px"  style="margin-right: 15px">
<img src="img/my_history.gif" width = "300px"  style="margin-right: 15px">

<br>

### 거래 후 책갈피 변경(피기부자, 기부자)

- 피기부자는 1 감소, 기부자는 1 증가

<br>
<img src="img/donate-person-update.png" width = "300px"  style="margin-right: 15px">
<img src="img/donated-person.png" width = "300px"  style="margin-right: 15px">

<br>

### 새로운 책 기부하기 및 책도네로 기부 받은 책 기부하기

- ISBN 바코드 조회 => 책 정보 자동 업로드 및 나눔 희망 지역, 내용, 사진 업로드

<br>
<img src="img/new_register.gif" width = "300px"  style="margin-right: 15px">
<img src="img/exist_register.gif" width = "300px"  style="margin-right: 15px">

<br>
