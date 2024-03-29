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
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/1")
  else if (prefName == "青森県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/2")
  else if (prefName == "岩手県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/3")
  else if (prefName == "宮城県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/4")
  else if (prefName == "秋田県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/5")
  else if (prefName == "山形県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/6")
  else if (prefName == "福島県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/7")
  else if (prefName == "茨城県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/8")
  else if (prefName == "栃木県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/9")
  else if (prefName == "群馬県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/10")
  else if (prefName == "埼玉県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/11")
  else if (prefName == "千葉県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/12")
  else if (prefName == "東京都")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/13")
  else if (prefName == "神奈川県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/14")
  else if (prefName == "新潟県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/15")
  else if (prefName == "富山県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/16")
  else if (prefName == "石川県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/17")
  else if (prefName == "福井県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/18")
  else if (prefName == "山梨県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/19")
  else if (prefName == "長野県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/20")
  else if (prefName == "岐阜県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/21")
  else if (prefName == "静岡県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/22")
  else if (prefName == "愛知県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/23")
  else if (prefName == "三重県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/24")
  else if (prefName == "滋賀県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/25")
  else if (prefName == "京都府")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/26")
  else if (prefName == "大阪府")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/27")
  else if (prefName == "兵庫県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/28")
  else if (prefName == "奈良県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/29")
  else if (prefName == "和歌山県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/30")
  else if (prefName == "鳥取県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/31")
  else if (prefName == "島根県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/32")
  else if (prefName == "岡山県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/33")
  else if (prefName == "広島県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/34")
  else if (prefName == "山口県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/35")
  else if (prefName == "徳島県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/36")
  else if (prefName == "香川県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/37")
  else if (prefName == "愛媛県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/38")
  else if (prefName == "高知県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/39")
  else if (prefName == "福岡県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/40")
  else if (prefName == "佐賀県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/41")
  else if (prefName == "長崎県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/42")
  else if (prefName == "熊本県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/43")
  else if (prefName == "大分県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/44")
  else if (prefName == "宮崎県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/45")
  else if (prefName == "鹿児島県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/46")
  else if (prefName == "沖縄県")
    window.location.href = ("/groups/"+`${gon.group_id}`+"/prefectures/47")
}, false)
