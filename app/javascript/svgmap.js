
  let array = [...Array(47).keys()].map(i => i + 1)
  let result1 = array.splice(gon.visited_prefectures)

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
      prefs: result1,
      color: "#FFFFFF",
      active: "#FFFFFF",
    },
  ],
  })


document.addEventListener('svgmap.click', function(e) {
 let prefName = e.target.getAttribute('data-name')
 if (prefName == "北海道")
   window.location.href =("/groups/1/trips/1")
 else if (prefName == "青森県")
 window.location.href =("/groups/1/trips/2")
 else if (prefName == "岩手県")
 window.location.href =("/groups/1/trips/3")
 else if (prefName == "宮城県")
 window.location.href =("/groups/1/trips/4")
 else if (prefName == "秋田県")
 window.location.href =("/groups/1/trips/5")
 else if (prefName == "山形県")
 window.location.href =("/groups/1/trips/6")
 else if (prefName == "福島県")
 window.location.href =("/groups/1/trips/7")
 else if (prefName == "茨城県")
 window.location.href =("/groups/1/trips/8")
 else if (prefName == "栃木県")
 window.location.href =("/groups/1/trips/9")
 else if (prefName == "群馬県")
 window.location.href =("/groups/1/trips/10")
 else if (prefName == "埼玉県")
 window.location.href =("/groups/1/trips/11")
 else if (prefName == "千葉県")
 window.location.href =("/groups/1/trips/12")
 else if (prefName == "東京都")
 window.location.href =("/groups/1/trips/13")
 else if (prefName == "神奈川県")
 window.location.href =("/groups/1/trips/14")
 else if (prefName == "新潟県")
 window.location.href =("/groups/1/trips/15")
 else if (prefName == "富山県")
 window.location.href =("/groups/1/trips/16")
 else if (prefName == "石川県")
 window.location.href =("/groups/1/trips/17")
 else if (prefName == "福井県")
 window.location.href =("/groups/1/trips/18")
 else if (prefName == "山梨県")
 window.location.href =("/groups/1/trips/19")
 else if (prefName == "長野県")
 window.location.href =("/groups/1/trips/20")
 else if (prefName == "岐阜県")
 window.location.href =("/groups/1/trips/21")
 else if (prefName == "静岡県")
 window.location.href =("/groups/1/trips/22")
 else if (prefName == "愛知県")
 window.location.href =("/groups/1/trips/23")
 else if (prefName == "三重県")
 window.location.href =("/groups/1/trips/24")
 else if (prefName == "滋賀県")
 window.location.href =("/groups/1/trips/25")
 else if (prefName == "京都府")
 window.location.href =("/groups/1/trips/26")
 else if (prefName == "大阪府")
 window.location.href =("/groups/1/trips/27")
 else if (prefName == "兵庫県")
 window.location.href =("/groups/1/trips/28")
 else if (prefName == "奈良県")
 window.location.href =("/groups/1/trips/29")
 else if (prefName == "和歌山県")
 window.location.href =("/groups/1/trips/30")
 else if (prefName == "鳥取県")
 window.location.href =("/groups/1/trips/31")
 else if (prefName == "島根県")
 window.location.href =("/groups/1/trips/32")
 else if (prefName == "岡山県")
 window.location.href =("/groups/1/trips/33")
 else if (prefName == "広島県")
 window.location.href =("/groups/1/trips/34")
 else if (prefName == "山口県")
 window.location.href =("/groups/1/trips/35")
 else if (prefName == "徳島県")
 window.location.href =("/groups/1/trips/36")
 else if (prefName == "香川県")
 window.location.href =("/groups/1/trips/37")
 else if (prefName == "愛媛県")
 window.location.href =("/groups/1/trips/38")
 else if (prefName == "高知県")
 window.location.href =("/groups/1/trips/39")
 else if (prefName == "福岡県")
 window.location.href =("/groups/1/trips/40")
 else if (prefName == "佐賀県")
 window.location.href =("/groups/1/trips/41")
 else if (prefName == "長崎県")
 window.location.href =("/groups/1/trips/42")
 else if (prefName == "熊本県")
 window.location.href =("/groups/1/trips/43")
 else if (prefName == "大分県")
 window.location.href =("/groups/1/trips/44")
 else if (prefName == "宮崎県")
 window.location.href =("/groups/1/trips/45")
 else if (prefName == "鹿児島県")
 window.location.href =("/groups/1/trips/46")
 else if (prefName == "沖縄県")
 window.location.href =("/groups/1/trips/47")
 


}, false)


