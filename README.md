# BongDeoGee -> DoDeoGee

- [앱스토어 출시](https://apps.apple.com/kr/app/%EB%8F%84%EB%8D%94%EC%A7%80-%EB%91%90%EB%8D%94%EC%A7%80-%EC%9E%A1%EA%B8%B0-%EA%B2%8C%EC%9E%84/id1516156098)

- 해커톤 당시 "BongDeoGee"라는 이름으로 발표했으나, 앱스토어 출시를 위해 이름을 "DoDeeGee"로 변경하였습니다.

- 강사님과 매니저님의 이미지를 도깨비와 보너스 이미지로 교체하였습니다.

## Description

- 낯 익은 캐릭터들(패캠 iOS 강사님, 매니저님)이 나와 유저들(패캠 기수들)에게 흥미를 주며 즐거움을 선사 

- 언제 어디서 튀어나올지 모르는 두더지와, 0점 악마, 보너업스로 긴장감 유발

- 개발 기간: 2020.02.06 ~ 02.07 

- 참여 인원: iOS 2명
  - [you kyung](https://github.com/wydryd125)
  - [JISNG](https://github.com/jisng)
  
## Using Skills

- Language: Swift

- Framework: UIKit, UIView Animation
  
## Implementation

UI를 제외한 나머지 기능을 구현

  - UICollectionView를 사용하여 두더지가 나타날 수 있도록 판을 만듬 (3 x 3)
  - `randomElement()` 메소드를 사용하여 두더지가 랜덤하게 나올 수 있도록 코드 작성
  - 두 개의 `Timer()` 를 사용하여 다음 두 가지 시간을 관리함
      - 게임 시간 30초
      - 두더지가 나타나는 속도 (레벨 별로 두더지가 나타는 속도가 다르다)
  - UserDefaults에 사용자의 이름, 레벨 별 점수를 나타나도록 함
        - 레벨 별 점수는 
  - AVAudioPlayer 으로 배경 음악 삽입

## Clips

<p>
  <img src="Video/2Rec.gif" width="30%>
</p>

// ![BongDeoGee 오후 7 07 10](https://user-images.githubusercontent.com/57229970/81282494-319ba700-9096-11ea-8949-ea200f48983a.gif)



