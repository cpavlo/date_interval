DatedResource.delete_all
7.times do |i|
  DatedResource.create(date: Date.today - i.days, name: 'last days')
end
4.times do |i|
  DatedResource.create(date: Date.today - (i*7).days, name: 'last weeks')
end
12.times do |i|
  DatedResource.create(date: Date.today - i.months, name: 'last months')
end