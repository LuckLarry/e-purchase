# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{
                      username: 'willy',
                      password: '123456',
                      admin: true
                     },
                     {
                      provider_id: '1',
                      username: 'willy2',
                      password: '123456',
                      admin: false
                     },
                     {
                      username: '0200564',
                      password: 'lola123',
                      admin: 'true'
                     },
                     {
                      username: '0200565',
                      password: 'lola123',
                      admin: 'true'
                     },
                     {
                      username: '0200546',
                      password: 'lola123',
                      admin: 'true'
                     },
                     {
                      username: '0100274',
                      password: 'lola123',
                      admin: 'true'
                     },
                     {
                      username: '0100273',
                      password: 'lola123',
                      admin: 'true'
                     },
                     {
                      username: '0200361',
                      password: 'lola123',
                      admin: 'true'
                     },
                     {
                      username: '0100014',
                      password: 'lola123',
                      admin: 'true'
                     },
                     {
                      username: '0100067',
                      password: 'lola123',
                      admin: 'true'
                     },
                      username: '0200001',
                      password: 'lola123',
                      admin: 'true'
                    ])
providers = Provider.create([{
                      company_name: '佛山恒希陶瓷有限公司',
		                  category: '瓷砖',
                      area: '北京',
		                  address: '广东省佛山市禅城区江湾一路19号',
		                  contact_name: '张三',
		                  contact_title: '经理',
		                  mobile: '15627284288',
                      telephone: '293423479',
                      fax: '021-32497890',
                      status: '未审核',
                      created_at: '2016-09-27'
                     },
                     {
                      company_name: '佛山市金满堂建材有限公司',
                      category: '瓷砖',
                      area: '北京',
                      address: '广东省佛山市禅城区江湾一路19号',
		                  contact_name: '张三',
		                  contact_title: '经理',
                      mobile: '15627284288',
                      telephone: '293423479',
                      fax: '021-32497890',
                      status: '未审核',
                      created_at: '2016-09-27'
                     },
		                 {
                      company_name: '佛山盛世名嘉陶瓷有限公司',
 		                  category:'马赛克',
                      area: '北京',
		                  address:'广东省佛山市南海区城市广场19号',
		                  contact_name:'李四',
		                  contact_title:'销售经理',
		                  mobile:'131475474588',
                      telephone: '293423479',
                      fax: '021-32497890',
                      status: '未审核',
                      created_at: '2016-09-26'
                     },
		                 {
                      company_name: '佛山市来利达建材有限公司',
 		                  category: '五金',
                      area: '北京',
		                  address: '广东省佛山市禅城区普澜二路19号',
		                  contact_name: '王五',
		                  contact_title: '采购部经理',
		                  mobile: '132894765846',
                      telephone: '293423479',
                      fax: '021-32497890',  
                      status: '未审核',
                      created_at: '2016-09-24'
                     },
		                 {
                      company_name: '广东昊晟陶瓷有限公司',
		                  category: '卫浴',
                      area: '北京',
		                  address: '广东省佛山市禅城区汾江中路19号',
		                  contact_name: '张三',
		                  contact_title: '经理',
		                  mobile: '15627284289',
                      telephone: '293423479',
                      fax: '021-32497890',
                      status: '未审核',
                      created_at: '2016-09-24'
                     },
		                 {
                      company_name: '佛山市新润丰贸易有限公司',
  		                category: '瓷砖',
                      area: '北京',
		                  address: '广东省佛山市禅城区祖庙路19号',
		                  contact_name: '张中国',
		                  contact_title: '董事长',
		                  mobile: '15627284131',
                      telephone: '293423479',
                      fax: '021-32497890',
                      status: '未审核',
                      created_at: '2016-09-28'
                     }
                    ])

products = Product.create([{
                      provider_id: '1',
                      category: '木纹砖',
                      product_status: '常规',
                      name: '通体大理石',
                      number: 'LXD123456789',
		                  unit: '800*800',
		                  price: '33',
                      start_volume: '30',
                      volume: '2000片',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/15'
                     },
		                 {
                      provider_id: '1',
                      category: '木纹砖',
                      product_status: '常规',
                      name: '金刚石',
                      number: 'LXD123456789',
		                  unit: '800*800',
		                  price: '21',
                      start_volume: '30',
                      volume: '1000片',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/15'
                     },
		                 {
                      provider_id: '2',
                      category: '木纹砖',
                      product_status: '常规',
                      name: '大理石',
                      number: 'LXD123456789',
		                  unit: '600*900',
		                  price: '25',
                      start_volume: '30',
                      volume: '1000片',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/15'
                     },
		                 {
                      provider_id: '2',
                      category: '木纹砖',
                      product_status: '常规',
                      name: '异形瓷片',
                      number: 'LXD123456789',
		                  unit: '300*600',
		                  price: '25',
                      start_volume: '30',
                      volume: '1000片',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/14'
                     },
		                 {
                      provider_id: '3',
                      category: '木纹砖',
                      product_status: '新品',
                      name: '大理石',
                      number: 'LXD123456789',
		                  unit: '800*800',
		                  price: '29',
                      start_volume: '30',
                      volume: '1000塊',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/11'
                     },
		                 {
                      provider_id: '3',
                      category: '木纹砖',
                      product_status: '新品',
                      name: '3D高清喷墨抛光砖',
                      number: 'LXD123456789',
		                  unit: '800*800',
		                  price: '29',
                      start_volume: '30',
                      volume: '1000塊',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/9'
                     },
		                 {
                      provider_id: '4',
                      category: '仿古砖',
                      product_status: '新品',
                      name: '厚砖',
                      number: 'LXD123456789',
		                  unit: '600*600',
		                  price: '32',
                      start_volume: '30',
                      volume: '1000塊',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/6'
                     },
		                 {
                      provider_id: '4',
                      category: '仿古砖',
                      product_status: '新品',
                      name: '全抛釉',
                      number: 'LXD123456789',
		                  unit: '800*800',
		                  price: '32',
                      start_volume: '30',
                      volume: '1000塊',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/6'
                     },
		                 {
                      provider_id: '5',
                      category: '仿古砖',
                      product_status: '新品',
                      name: '马赛克',
                      number: 'LXD123456789',
		                  unit: '320*320',
		                  price: '21',
                      start_volume: '30',
                      volume: '1000箱',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/5'
                     },
                     {
                      provider_id: '5',
                      category: '仿古砖',
                      product_status: '新品',
		                  name: '马赛克',
                      number: 'LXD123456789',
		                  unit: '300*300',
		                  price: '21',
                      start_volume: '30',
                      volume: '1000箱',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/3'
                     },
                     {
                      provider_id: '6',
                      category: '仿古砖',
                      product_status: '尾货',
		                  name: '组合拼图挪威深林',
                      number: 'LXD123456789',
		                  unit: '450*450',
		                  price: '51',
                      start_volume: '30',
                      volume: '1000片',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/9/3'
                     },
		                 {
                      provider_id: '6',
                      category: '仿古砖',
                      product_status: '尾货',
		                  name: '组合拼图同心圆',
                      number: 'LXD123456789',
		                  unit: '450*450',
		                  price: '51',
                      start_volume: '30',
                      volume: '1000片',
                      brand: '潘朵拉',
		                  status: '未审核',
		                  created_at: '2016/8/29'
                     },
		                 {
                      provider_id: '2',
                      category: '基础建材',
                      product_status: '尾货',
		                  name: '抛光砖水立方',
                      number: 'LXD123456789',
		                  unit: '800*800',
		                  price: '49',
                      start_volume: '30',
                      volume: '1000片',
                      brand: '潘朵拉',
	      	            status: '未审核',
		                  created_at: '2016/8/26'
                     },
		                 {
                      provider_id: '3',
                      category: '基础建材',
                      product_status: '尾货',
		                  name: '微晶石',
                      number: 'LXD123456789',
		                  unit: '800*800',
		                  price: '49',
                      start_volume: '30',
                      volume: '1000箱',
                      brand: '潘朵拉',
	      	            status: '未审核',
		                  created_at: '2016/8/26'
                     }
                    ])
