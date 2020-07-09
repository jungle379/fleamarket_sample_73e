# おもちゃ・ホビー・グッズの子カテゴリー配列
toys_child_array = 
[
  'おもちゃ',
  'タレントグッズ',
  'コミック/アニメグッズ',
  'トレーディングカード',
  'フィギュア',
  '楽器/器材',
  'コレクション',
  'ミリタリー',
  '美術品',
  'アート用品',
  'その他'
]

# おもちゃの孫カテゴリー
toys_grandchild_array = 
[
  # 0:おもちゃ
  [
    'キャラクターグッズ',
    'ぬいぐるみ',
    '小物/アクセサリー',
    '模型/プラモデル',
    'ミニカー',
    'トイラジコン',
    'プラモデル',
    'ホビーラジコン',
    '鉄道模型',
    'その他'
  ],
  # 1:タレントグッズ
  [
    'アイドル',
    'ミュージシャン',
    'タレント/お笑い芸人',
    'スポーツ選手',
    'その他'
  ],
  # 2:コミック/アニメグッズ
  [
    'ストラップ',
    'キーホルダー',
    'バッジ',
    'カード',
    'クリアファイル',
    'ポスター',
    'タオル',
    'その他'
  ],
  # 3:トレーディングカード
  [
    '遊戯王',
    'マジック:ザ・ギャザリング',
    'ポケモンカードゲーム',
    'デュエルマスターズ',
    'バトルスピリッツ',
    'プリパラ',
    'アイカツ',
    'カードファイト!!ヴァンガード',
    'ヴァイスシュヴァルツ',
    'プロ野球オーナーズリーグ',
    'ベースボールヒーローズ',
    'ドラゴンボール',
    'スリーブ',
    'その他'
  ],
  # 4:フィギュア
  [
    'コミック/アニメ',
    '特撮',
    'ゲームキャラクター',
    'SF/ファンタジー/ホラー',
    'アメコミ',
    'スポーツ',
    'ミリタリー',
    'その他'
  ],
  # 5:楽器/器材
  [
    'エレキギター',
    'アコースティックギター',
    'ベース',
    'エフェクター',
    'アンプ',
    '弦楽器',
    '管楽器',
    '鍵盤楽器',
    '打楽器',
    '和楽器',
    '楽譜/スコア',
    'レコーディング/PA機器',
    'DJ機器',
    'DTM/DAW',
    'その他'
  ],
  # 6:コレクション
  [
    '武具',
    '使用済切手/官製はがき',
    '旧貨幣/金貨/銀貨/記念硬貨',
    '印刷物',
    'ノベルティグッズ',
    'その他',
  ],
  # 7:ミリタリー
  [
    'トイガン',
    '個人装備',
    'その他'
  ],
  # 8:美術品
  [
    '陶芸',
    'ガラス',
    '漆芸',
    '金属工芸',
    '絵画/タペストリ',
    '版画',
    '彫刻/オブジェクト',
    '書',
    '写真',
    'その他'
  ],
  # 9:アート用品
  [
    '画材',
    '額縁',
    'その他'
  ],
  # 10:その他
  [
    'トランプ/UNO',
    'カルタ/百人一首',
    'ダーツ',
    'ビリヤード',
    '麻雀',
    'パズル/ジグソーパズル',
    '囲碁/将棋',
    'オセロ/チェス',
    '人生ゲーム',
    '野球/サッカーゲーム',
    'スポーツ',
    '三輪車/乗り物',
    'ヨーヨー',
    '模型製作用品',
    '鉄道',
    '航空機',
    'アマチュア無線',
    'パチンコ/パチスロ',
    'その他'
  ]
]


parent = Category.create(name: 'おもちゃ・ホビー・グッズ')
toys_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  toys_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end