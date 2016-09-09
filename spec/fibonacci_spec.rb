describe 'fibonacci' do
  let(:fib) { Fibonacci.new }
  let(:fibonacci) { # from: OEIS - http://oeis.org/A000045/list
    [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,
     1597,2584,4181,6765,10946,17711,28657,46368,75025,
     121393,196418,317811,514229,832040,1346269,
     2178309,3524578,5702887,9227465,14930352,24157817,39088169]
  }

  it 'slow implementation' do
    expect(fib.num(0)).to eq(fibonacci[0])
    expect(fib.num(1)).to eq(fibonacci[1])
    expect(fib.num(2)).to eq(fibonacci[2])
    expect(fib.num(10)).to eq(fibonacci[10])
  end

  it 'apply dynamic programming' do
    last = fibonacci.count - 1

    cold_time = time_this { raise unless fib.num_dyn(last) == fibonacci[last] }
    hot_time = time_this { raise unless fib.num_dyn(last) == fibonacci[last] }

    expect(cold_time / hot_time).to be > 10
  end
end

def time_this
  start_time = Time.now
  yield
  end_time = Time.now

  end_time - start_time
end
