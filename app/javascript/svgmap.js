let array = []
for (let i = 0; i < 48; i++) {
  array.push(i)
}
let not_visited = array.splice(gon.visited_prefectures)

svgJapan({ 
  element: "#my-map-container",
  type: "dense",
  regionality: "true",
 
  regions: [
    { id: 1,
      name: "行ったことある",
      prefs: gon.visited_prefectures,
      color: "#008000",
      active: "#008000",
    },

    { id: 2,
      name: "",
      prefs: not_visited,
      color: "#FFFFFF",
      active: "#FFFFFF",
    },
  ],
})

document.addEventListener('svgmap.click', function(e) {
  let prefName = e.target.getAttribute('data-name')
  if (prefName == "北海道")
    window.location.href =("/prefectures/1")
  else if (prefName == "青森県")
    window.location.href =("/prefectures/2")
  else if (prefName == "岩手県")
    window.location.href =("/prefectures/3")
  else if (prefName == "宮城県")
    window.location.href =("/prefectures/4")
  else if (prefName == "秋田県")
    window.location.href =("/prefectures/5")
  else if (prefName == "山形県")
    window.location.href =("/prefectures/6")
  else if (prefName == "福島県")
    window.location.href =("/prefectures/7")
  else if (prefName == "茨城県")
    window.location.href =("/prefectures/8")
  else if (prefName == "栃木県")
    window.location.href =("/prefectures/9")
  else if (prefName == "群馬県")
    window.location.href =("/prefectures/10")
  else if (prefName == "埼玉県")
    window.location.href =("/prefectures/11")
  else if (prefName == "千葉県")
    window.location.href =("/prefectures/12")
  else if (prefName == "東京都")
    window.location.href =("/prefectures/13")
  else if (prefName == "神奈川県")
    window.location.href =("/prefectures/14")
  else if (prefName == "新潟県")
    window.location.href =("/prefectures/15")
  else if (prefName == "富山県")
    window.location.href =("/prefectures/16")
  else if (prefName == "石川県")
    window.location.href =("/prefectures/17")
  else if (prefName == "福井県")
    window.location.href =("/prefectures/18")
  else if (prefName == "山梨県")
    window.location.href =("/prefectures/19")
  else if (prefName == "長野県")
    window.location.href =("/prefectures/20")
  else if (prefName == "岐阜県")
    window.location.href =("/prefectures/21")
  else if (prefName == "静岡県")
    window.location.href =("/prefectures/22")
  else if (prefName == "愛知県")
    window.location.href =("/prefectures/23")
  else if (prefName == "三重県")
    window.location.href =("/prefectures/24")
  else if (prefName == "滋賀県")
    window.location.href =("/prefectures/25")
  else if (prefName == "京都府")
    window.location.href =("/prefectures/26")
  else if (prefName == "大阪府")
    window.location.href =("/prefectures/27")
  else if (prefName == "兵庫県")
    window.location.href =("/prefectures/28")
  else if (prefName == "奈良県")
    window.location.href =("/prefectures/29")
  else if (prefName == "和歌山県")
    window.location.href =("/prefectures/30")
  else if (prefName == "鳥取県")
    window.location.href =("/prefectures/31")
  else if (prefName == "島根県")
    window.location.href =("/prefectures/32")
  else if (prefName == "岡山県")
    window.location.href =("/prefectures/33")
  else if (prefName == "広島県")
    window.location.href =("/prefectures/34")
  else if (prefName == "山口県")
    window.location.href =("/prefectures/35")
  else if (prefName == "徳島県")
    window.location.href =("/prefectures/36")
  else if (prefName == "香川県")
    window.location.href =("/prefectures/37")
  else if (prefName == "愛媛県")
    window.location.href =("/prefectures/38")
  else if (prefName == "高知県")
    window.location.href =("/prefectures/39")
  else if (prefName == "福岡県")
    window.location.href =("/prefectures/40")
  else if (prefName == "佐賀県")
    window.location.href =("/prefectures/41")
  else if (prefName == "長崎県")
    window.location.href =("/prefectures/42")
  else if (prefName == "熊本県")
    window.location.href =("/prefectures/43")
  else if (prefName == "大分県")
    window.location.href =("/prefectures/44")
  else if (prefName == "宮崎県")
    window.location.href =("/prefectures/45")
  else if (prefName == "鹿児島県")
    window.location.href =("/prefectures/46")
  else if (prefName == "沖縄県")
    window.location.href =("/prefectures/47")
}, false)
