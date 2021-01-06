class Genre < ActiveHash::Base
self.data = [

{ id: 1, name: '--' },
{ id: 2, name: '通信費' },
{ id: 3, name: '水道光熱費' },
{ id: 4, name: '税・社会保障' },
{ id: 5, name: '保険' },
{ id: 6, name: '資産運用' },
{ id: 7, name: 'その他' },

]

include ActiveHash::Associations
has_many :articles

end
