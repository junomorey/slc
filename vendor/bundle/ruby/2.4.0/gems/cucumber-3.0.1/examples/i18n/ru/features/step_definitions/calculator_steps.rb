# encoding: utf-8

Допустим(/ввожу число (\d+)/) do |число|
  calc.push число.to_i
end

Если(/нажимаю "(.*)"/) do |операция|
  calc.send операция
end

То(/результатом должно быть число (\d+)/) do |результат|
  calc.result.should == результат.to_f
end

Допустим(/я сложил (\d+) и (\d+)/) do |слагаемое1, слагаемое2|
  Допустим %{я ввожу число #{слагаемое1}}
  Допустим %{затем ввожу число #{слагаемое2}}
  Допустим %{я нажимаю "+"}
end