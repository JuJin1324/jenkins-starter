# jenkins-starter
## 설치
### macOS
> 설치: `brew install jenkins`  
> 서비스 등록: `brew services start jenkins`  
> 
> 초기 패스워드  
> ```bash
> cat /usr/local/var/log/jenkins/error.log
> 
> Please use the following password to proceed to installation:
> 
> 481c1e5295ef46eXXXXXXXXXXXXXXXXX
> :q!
> ```
>
> 접속: `http://127.0.0.1:8080`  
> `Install suggested plugins` 로 설치  
> 계정 생성 

## Maven build
### Plugin 설치
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`플러그인 관리` 클릭  
> 3.`설치 가능` 탭 클릭 후 필터에 `Maven Integration` 입력    
> 4.`Maven Integration plugin` 옆에 install 체크 박스 체크 후 `install without restart` 클릭   

### Global Tool Configuration
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`Global Tool Configuration` 클릭  
> 3.Maven 탭에서 `Add Maven` 버튼 클릭  
> 4.Name: Maven 3.8.6, `Install automatically` 체크, version 선택 후 `Save`

### 프로젝트 생성
> 1.Dashboard 화면에서 좌측 `새로운 Item` 클릭  
> 2.프로젝트 이름 작성 후 `Maven project` 클릭 후 `OK` 버튼 클릭  

## Gradle build
### Plugin 설치
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`플러그인 관리` 클릭  
> 3.`설치 가능` 탭 클릭 후 필터에 `post build task` 입력     
> 4.`Post build task` 옆에 install 체크 박스 체크 후 `install without restart` 클릭  
> 5.`설치된 플러그인 목록` 탭 클릭 후 필터에 `gradle plugin` 입력    
> 6.`Gradle Plugin` 의 경우 Jenkins 초기 설정 시 `Install suggested plugins` 으로 설정했으면 자동 설치되어 있음.
> 없으면 설치  

### Global Tool Configuration
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`Global Tool Configuration` 클릭  
> 3.Gradle 탭에서 `Add Gradle` 버튼 클릭  
> 4.Name: Gradle 7.5, `Install automatically` 체크, version 선택 후 `Save`

### 프로젝트 생성
> 1.Dashboard 화면에서 좌측 `새로운 Item` 클릭   
> 2.프로젝트 이름 작성 후 `Freestyle project` 클릭 후 `OK` 버튼 클릭  

## SSH Deploy

## Github Trigger

## CodeCommit Trigger
### Plugin 설치
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`플러그인 관리` 클릭  
> 3.`설치 가능` 탭 클릭 후 필터에 `aws codecommit` 입력
> 4.`AWS CodeCommit Trigger Plugin` 옆에 install 체크 박스 체크 후 `install without restart` 클릭  
