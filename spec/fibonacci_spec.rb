describe 'fibonacci' do
  let(:fib) { Fibonacci.new }
  let(:fibonacci) { # from: OEIS - http://oeis.org/A000045/list
    [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,
     1597,2584,4181,6765,10946,17711,28657,46368,75025,
     121393,196418,317811,514229,832040,1346269,
     2178309,3524578,5702887,9227465,14930352,24157817,39088169]
  }
  let(:last_entry) { fibonacci.count - 1 }

  it 'slow implementation' do
    expect(fib.num(0)).to eq(fibonacci[0])
    expect(fib.num(1)).to eq(fibonacci[1])
    expect(fib.num(2)).to eq(fibonacci[2])
    expect(fib.num(10)).to eq(fibonacci[10])
  end

  it 'with dynamic programming' do
    cold_time = time_this { raise unless fib.num_dyn(last_entry) == fibonacci[last_entry] }
    hot_time = time_this { raise unless fib.num_dyn(last_entry) == fibonacci[last_entry] }

    expect(cold_time / hot_time).to be > 10**5
  end

  it 'generates timing report', slow: true, type: 'timing' do
    fib = Fibonacci.new # do not want the previous instance's cache

    puts "\n"
    puts "=" * 80
    puts "first run without dynamic programming: \t" + time_this { raise unless fib.num(last_entry) == fibonacci[last_entry] }.to_s
    puts "second run without dynamic programming: " + time_this { raise unless fib.num(last_entry) == fibonacci[last_entry] }.to_s
    puts "first run with dynamic programming: \t" + time_this { raise unless fib.num_dyn(last_entry) == fibonacci[last_entry] }.to_s
    puts "second run with dynamic programming: \t" + time_this { raise unless fib.num_dyn(last_entry) == fibonacci[last_entry] }.to_s
    puts "=" * 80
    puts "\n"
  end
end

def time_this
  start_time = Time.now
  yield
  end_time = Time.now

  end_time - start_time
end
