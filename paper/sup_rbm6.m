n = 8;
m = 9;
A = randn(n, m);
nset = dec2bin(0:(2^(n) - 1));
mset = dec2bin(0:(2^(m) - 1));
original = 0;
for i = 1:size(nset, 1)
  for j = 1:size(mset, 1)
    v = logical(nset(i, :) - '0');
    h = logical(mset(j, :) - '0');
    original = original + (v * A * h') ^ 6;
  end
end

optimized = 2^(n+m)*(((sum(sum((( A .* A)  .* (( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1])))), 2), 1)  .* 360) ...
  + (sum(sum((( A .* repmat(sum(A, 2), [1, m]))  .* ( ( A .* repmat(sum(A, 2), [1, m])) .* repmat(sum(( A .* A), 1), [n, 1]))), 2), 1)  .* 360) ...
  + (sum((( sum(A, 1) .* sum(A, 1))  .* ( ( sum(A, 1) .* sum(A, 1)) .* ( sum(A, 1) .* sum(A, 1)))), 2)  .* 16) ...
  + ((sum(( sum(A, 1) .* sum(A, 1)), 2)  .* sum(( ( sum(A, 1) .* sum(A, 1)) .* ( sum(A, 1) .* sum(A, 1))), 2))  .* -30) ...
  + ( ( ( sum(A, 1) * ( (A') * sum(A, 2))) * ( sum(A, 1) * ( (A') * sum(A, 2)))) .* 360) ...
  + ( ( ( sum(A, 1) * (A')) * ( ( A .* ( A .* A)) * (sum(A, 1)'))) .* 480) ...
  + (sum((( sum(A, 2) .* sum(A, 2))  .* ( ( sum(A, 2) .* sum(A, 2)) .* ( sum(A, 2) .* sum(A, 2)))), 1)  .* 16) ...
  + (sum(sum((( A .* repmat(sum(A, 1), [n, 1]))  .* ( ( A .* repmat(sum(A, 1), [n, 1])) .* repmat(sum(( A .* A), 2), [1, m]))), 2), 1)  .* 360) ...
  + ((sum(( sum(A, 1) .* sum(A, 1)), 2)  .* sum(( ( sum(A, 1) .* sum(A, 1)) .* sum(( A .* A), 1)), 2))  .* -180) ...
  + (sum((repmat(sum(sum(A, 2), 1), [n, 1])  .* sum(( ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1])) .* ( A .* ( A .* A))), 2)), 1)  .* 480) ...
  + (sum((repmat(sum(sum(A, 2), 1), [n, 1])  .* (sum(A, 2)  .* (sum(A, 2)  .* sum(( ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1])) .* A), 2)))), 1)  .* -240) ...
  + (sum((sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* (sum(A, 2)  .* sum(repmat(sum((repmat(sum(A, 2), [1, m])  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))), 1), [n, 1]), 2))), 1)  .* 360) ...
  + ( ( ( sum(sum(A, 2), 1) * ( sum(A, 1) * (A'))) * ( ( A * (A')) * sum(A, 2))) .* 720) ...
  + ((( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* (( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* ( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))))  .* 1) ...
  + ((sum(( sum(A, 1) .* sum(A, 1)), 2)  .* (( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* ( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))))  .* 15) ...
  + (sum((sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* (sum(A, 2)  .* repmat(( sum(sum(A, 2), 1) .* ( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))), [n, 1]))), 1)  .* 120) ...
  + ((sum(( sum(A, 2) .* sum(A, 2)), 1)  .* (( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* ( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))))  .* 15) ...
  + ((sum(sum(( A .* A), 2), 1)  .* (( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* ( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))))  .* 15) ...
  + (sum(sum((repmat(( sum(A, 2) .* sum(A, 2)), [1, m])  .* (( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1])))), 1), 2)  .* -30) ...
  + (sum((sum((repmat(sum(A, 2), [1, m])  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))), 1)  .* sum((repmat(sum(A, 2), [1, m])  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))), 1)), 2)  .* 45) ...
  + (sum((sum(( A .* repmat(sum(A, 2), [1, m])), 1)  .* (sum(( A .* repmat(sum(A, 2), [1, m])), 1)  .* repmat(sum(( sum(A, 1) .* sum(A, 1)), 2), [1, m]))), 2)  .* 180) ...
  + (sum((sum(( A .* repmat(sum(A, 2), [1, m])), 1)  .* (sum(A, 1)  .* sum(( ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1])) .* A), 1))), 2)  .* -360) ...
  + ((sum(( sum(A, 1) .* sum(A, 1)), 2)  .* ( sum(( sum(A, 1) .* sum(A, 1)), 2) .* sum(( sum(A, 1) .* sum(A, 1)), 2)))  .* 15) ...
  + (sum((sum((repmat(sum(A, 1), [n, 1])  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))), 1)  .* sum((repmat(sum(A, 1), [n, 1])  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))), 1)), 2)  .* -30) ...
  + ((sum(sum(A, 2), 1)  .* (sum(sum(A, 2), 1)  .* ( sum(( sum(A, 1) .* sum(A, 1)), 2) .* sum(( sum(A, 1) .* sum(A, 1)), 2))))  .* 45) ...
  + ((( sum(A, 1) .* sum(A, 1))  * ( ( repmat(sum(A, 1), [m, 1]) * (A')) * ( A * (sum(A, 1)'))))  .* 180) ...
  + (sum((sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* (( sum(A, 2) .* repmat(sum(sum(A, 2), 1), [n, 1]))  .* sum(repmat(( sum(A, 1) .* sum(A, 1)), [n, 1]), 2))), 1)  .* 360) ...
  + ( ( sum(( A .* A), 1) * ( ( (A') * sum(A, 2)) .* ( (A') * sum(A, 2)))) .* -360) ...
  + (sum(( sum(( A .* A), 1) .* ( ( sum(A, 1) .* sum(A, 1)) .* ( sum(A, 1) .* sum(A, 1)))), 2)  .* 240) ...
  + ((sum(sum(( A .* A), 2), 1)  .* sum(( ( sum(A, 1) .* sum(A, 1)) .* ( sum(A, 1) .* sum(A, 1))), 2))  .* -30) ...
  + ((sum(( sum(A, 1) .* sum(A, 1)), 2)  .* ( sum(( sum(A, 1) .* sum(A, 1)), 2) .* sum(sum(( A .* A), 2), 1)))  .* 45) ...
  + ((sum(sum(A, 2), 1)  .* ( sum(sum(A, 2), 1) .* sum(( ( sum(A, 1) .* sum(A, 1)) .* sum(( A .* A), 1)), 2)))  .* -180) ...
  + ((( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* ( sum(( sum(A, 1) .* sum(A, 1)), 2) .* sum(sum(( A .* A), 2), 1)))  .* 90) ...
  + (sum(sum((( repmat(sum(( A .* A), 2), [1, m]) .* repmat(sum(( A .* A), 1), [n, 1]))  .* ( A .* A)), 2), 1)  .* 360) ...
  + (sum((sum(( A .* A), 1)  .* ( sum(( A .* A), 1) .* repmat(sum(( sum(A, 1) .* sum(A, 1)), 2), [1, m]))), 2)  .* -90) ...
  + ((sum(sum(( A .* A), 2), 1)  .* sum(( ( sum(A, 2) .* sum(A, 2)) .* ( sum(A, 2) .* sum(A, 2))), 1))  .* -30) ...
  + ((sum(( sum(A, 2) .* sum(A, 2)), 1)  .* ( sum(( sum(A, 2) .* sum(A, 2)), 1) .* sum(sum(( A .* A), 2), 1)))  .* 45) ...
  + (sum((sum(( A .* repmat(sum(A, 2), [1, m])), 1)  .* (sum(( A .* repmat(sum(A, 2), [1, m])), 1)  .* repmat(sum(sum(( A .* A), 2), 1), [1, m]))), 2)  .* 180) ...
  + (sum((sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* (sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* repmat(sum(sum(( A .* A), 2), 1), [n, 1]))), 1)  .* 180) ...
  + (sum((( sum(A, 2) .* repmat(sum(sum(A, 2), 1), [n, 1]))  .* (sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* repmat(sum(sum(( A .* A), 2), 1), [n, 1]))), 1)  .* 360) ...
  + (sum((sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* sum(( repmat(( sum(A, 1) .* sum(A, 1)), [n, 1]) .* ( A .* repmat(sum(A, 1), [n, 1]))), 2)), 1)  .* -240) ...
  + (sum(sum((A  .* repmat((repmat(sum(sum(A, 2), 1), [1, m])  .* (sum(A, 1)  .* sum(( ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1])) .* A), 1))), [n, 1])), 2), 1)  .* -240) ...
  + ((sum(( sum(A, 2) .* sum(A, 2)), 1)  .* sum(( ( sum(A, 1) .* sum(A, 1)) .* ( sum(A, 1) .* sum(A, 1))), 2))  .* -30) ...
  + ((( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* sum(( ( sum(A, 2) .* sum(A, 2)) .* sum(( A .* A), 2)), 1))  .* -180) ...
  + ((( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* sum(sum(( ( A .* A) .* ( A .* A)), 2), 1))  .* 60) ...
  + (sum((sum((repmat(sum(A, 2), [1, m])  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))), 2)  .* sum((repmat(sum(A, 2), [1, m])  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))), 2)), 1)  .* -30) ...
  + ((sum(sum(A, 2), 1)  .* sum((sum(repmat(( sum(A, 2) .* sum(A, 2)), [1, m]), 1)  .* sum((repmat(sum(A, 2), [1, m])  .* ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1]))), 1)), 2))  .* 45) ...
  + (sum((sum(( A .* repmat(sum(A, 2), [1, m])), 1)  .* (sum(( A .* repmat(sum(A, 2), [1, m])), 1)  .* repmat(( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1)), [1, m]))), 2)  .* 180) ...
  + ((( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* ( sum(( sum(A, 1) .* sum(A, 1)), 2) .* sum(( sum(A, 2) .* sum(A, 2)), 1)))  .* 90) ...
  + (sum((sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* (sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* repmat(( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1)), [n, 1]))), 1)  .* 180) ...
  + ( ( ( sum(A, 1) * ( (A') * A)) * ( ( (A') * A) * (sum(A, 1)'))) .* 360) ...
  + (sum((sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* (sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* repmat(sum(( sum(A, 2) .* sum(A, 2)), 1), [n, 1]))), 1)  .* 180) ...
  + ((sum(( sum(A, 1) .* sum(A, 1)), 2)  .* ( sum(( sum(A, 1) .* sum(A, 1)), 2) .* sum(( sum(A, 2) .* sum(A, 2)), 1)))  .* 45) ...
  + ( ( ( (sum(A, 2)') * A) * ( ( (A') * A) * ( (A') * sum(A, 2)))) .* 360) ...
  + (sum((sum(( A .* repmat(sum(A, 2), [1, m])), 1)  .* sum(( repmat(( sum(A, 2) .* sum(A, 2)), [1, m]) .* ( A .* repmat(sum(A, 2), [1, m]))), 1)), 2)  .* -240) ...
  + ((( (sum(A, 2)') * A)  * ( (A') * ( repmat(sum(A, 2), [1, n]) * ( sum(A, 2) .* sum(A, 2)))))  .* 180) ...
  + ( ( ( (sum(A, 2)') * A) * ( (( A .* ( A .* A))') * sum(A, 2))) .* 480) ...
  + ((sum(( sum(A, 2) .* sum(A, 2)), 1)  .* sum(( ( sum(A, 2) .* sum(A, 2)) .* ( sum(A, 2) .* sum(A, 2))), 1))  .* -30) ...
  + ((sum(( sum(A, 2) .* sum(A, 2)), 1)  .* ( sum(( sum(A, 2) .* sum(A, 2)), 1) .* sum(( sum(A, 2) .* sum(A, 2)), 1)))  .* 15) ...
  + ((sum(( sum(A, 2) .* sum(A, 2)), 1)  .* sum(( ( sum(A, 2) .* sum(A, 2)) .* sum(( A .* A), 2)), 1))  .* -180) ...
  + (sum((( sum(( A .* A), 2) .* sum(( A .* A), 2))  .* repmat(sum(( sum(A, 2) .* sum(A, 2)), 1), [n, 1])), 1)  .* -90) ...
  + ((sum(( sum(A, 1) .* sum(A, 1)), 2)  .* ( sum(( sum(A, 2) .* sum(A, 2)), 1) .* sum(sum(( A .* A), 2), 1)))  .* 90) ...
  + ( sum(( ( sum(A, 1) .* sum(A, 1)) .* sum(( ( A .* A) .* ( A .* A)), 1)), 2) .* -480) ...
  + (( sum(( sum(A, 1) .* sum(A, 1)), 2) .* sum(sum(( ( A .* A) .* ( A .* A)), 2), 1))  .* 60) ...
  + ( sum(( sum(( A .* A), 1) .* sum(( ( A .* A) .* ( A .* A)), 1)), 2) .* -480) ...
  + (sum((sum(repmat(( sum(A, 2) .* sum(A, 2)), [1, m]), 1)  .* sum(( ( A .* A) .* ( A .* A)), 1)), 2)  .* 60) ...
  + ( ( ( sum(A, 1) .* sum(( A .* A), 1)) * ( ( (A') * A) * (sum(A, 1)'))) .* -720) ...
  + ((sum(sum(A, 2), 1)  .* sum(sum((( ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1])) .* A)  .* repmat(sum(( A .* A), 1), [n, 1])), 2), 1))  .* -720) ...
  + ((sum(( sum(A, 2) .* sum(A, 2)), 1)  .* sum(( ( sum(A, 1) .* sum(A, 1)) .* sum(( A .* A), 1)), 2))  .* -180) ...
  + ((sum(sum(( A .* A), 2), 1)  .* sum(( ( sum(A, 1) .* sum(A, 1)) .* sum(( A .* A), 1)), 2))  .* -180) ...
  + (sum(( ( sum(A, 1) .* sum(A, 1)) .* ( sum(( A .* A), 1) .* sum(( A .* A), 1))), 2)  .* 720) ...
  + ( sum(( sum(( A .* A), 1) .* ( sum(( A .* A), 1) .* sum(( A .* A), 1))), 2) .* 240) ...
  + (sum(sum((repmat(sum(( A .* A), 1), [n, 1])  .* (repmat(( sum(A, 2) .* repmat(sum(sum(A, 2), 1), [n, 1])), [1, m])  .* repmat(sum(( A .* A), 1), [n, 1]))), 2), 1)  .* -90) ...
  + (sum((sum(repmat(( sum(A, 2) .* sum(A, 2)), [1, m]), 1)  .* ( sum(( A .* A), 1) .* sum(( A .* A), 1))), 2)  .* -90) ...
  + (sum((sum(( A .* A), 2)  .* ( sum(( A .* A), 2) .* repmat(( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1)), [n, 1]))), 1)  .* -90) ...
  + ((sum(( sum(A, 1) .* sum(A, 1)), 2)  .* ( sum(sum(( A .* A), 2), 1) .* sum(sum(( A .* A), 2), 1)))  .* 45) ...
  + ((( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* ( sum(sum(( A .* A), 2), 1) .* sum(sum(( A .* A), 2), 1)))  .* 45) ...
  + ((( sum(sum(A, 2), 1) .* sum(sum(A, 2), 1))  .* ( sum(( sum(A, 2) .* sum(A, 2)), 1) .* sum(sum(( A .* A), 2), 1)))  .* 90) ...
  + (sum(( sum(( A .* A), 2) .* ( ( sum(A, 2) .* sum(A, 2)) .* ( sum(A, 2) .* sum(A, 2)))), 1)  .* 240) ...
  + ( sum(( ( sum(A, 2) .* sum(A, 2)) .* sum(( ( A .* A) .* ( A .* A)), 2)), 1) .* -480) ...
  + (sum(( ( sum(A, 2) .* sum(A, 2)) .* ( sum(( A .* A), 2) .* sum(( A .* A), 2))), 1)  .* 720) ...
  + ((sum(sum(A, 2), 1)  .* sum((sum(( A .* A), 2)  .* sum(( ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1])) .* A), 2)), 1))  .* -720) ...
  + ( ( ( (sum(A, 2)') * ( A * (A'))) * ( sum(A, 2) .* sum(( A .* A), 2))) .* -720) ...
  + ( sum(( sum(( A .* A), 2) .* sum(( ( A .* A) .* ( A .* A)), 2)), 1) .* -480) ...
  + ( sum(( sum(( A .* A), 2) .* ( sum(( A .* A), 2) .* sum(( A .* A), 2))), 1) .* 240) ...
  + ((sum(( sum(A, 1) .* sum(A, 1)), 2)  .* sum(( ( sum(A, 2) .* sum(A, 2)) .* sum(( A .* A), 2)), 1))  .* -180) ...
  + ((sum(sum(( A .* A), 2), 1)  .* sum(( ( sum(A, 2) .* sum(A, 2)) .* sum(( A .* A), 2)), 1))  .* -180) ...
  + (sum((sum(( A .* repmat(sum(A, 1), [n, 1])), 2)  .* (sum(A, 2)  .* sum(( ( repmat(sum(A, 2), [1, m]) .* repmat(sum(A, 1), [n, 1])) .* A), 2))), 1)  .* -360) ...
  + ( ( ( ( sum(A, 1) * (A')) .* ( sum(A, 1) * (A'))) * sum(( A .* A), 2)) .* -360) ...
  + (sum((sum(repmat(( sum(A, 1) .* sum(A, 1)), [n, 1]), 2)  .* ( sum(( A .* A), 2) .* sum(( A .* A), 2))), 1)  .* -90) ...
  + ((sum(( sum(A, 2) .* sum(A, 2)), 1)  .* ( sum(sum(( A .* A), 2), 1) .* sum(sum(( A .* A), 2), 1)))  .* 45) ...
  + ( sum(sum(( ( A .* A) .* ( ( A .* A) .* ( A .* A))), 2), 1) .* 256) ...
  + ( ( sum(sum(( A .* A), 2), 1) .* sum(sum(( ( A .* A) .* ( A .* A)), 2), 1)) .* 60) ...
  + ((sum(sum(( A .* A), 2), 1)  .* ( sum(sum(( A .* A), 2), 1) .* sum(sum(( A .* A), 2), 1)))  .* 15) ...
  + (sum(sum((repmat(sum(( A .* A), 1), [n, 1])  .* ( repmat(sum(( A .* A), 2), [1, m]) .* repmat(sum(( A .* A), 1), [n, 1]))), 1), 2)  .* -90) ...
  + ((repmat(sum(sum(A, 2), 1), [1, m])  * ( ( ( (A') * A) .* ( (A') * A)) * repmat(sum(sum(A, 2), 1), [m, 1])))  .* 90) ...
  + (sum(sum((repmat(sum(( A .* A), 2), [1, m])  .* ( repmat(sum(( A .* A), 2), [1, m]) .* repmat(sum(( A .* A), 1), [n, 1]))), 2), 1)  .* -90) ...
  + ( sum(( ( ( A * (A')) .* ( A * (A'))) * ( sum(A, 2) .* sum(A, 2))), 1) .* -360) ...
  + ( sum(( ( ( A * (A')) .* ( A * (A'))) * sum(( A .* A), 2)), 1) .* -360) ...
  + (sum(( ( ( A * (A')) .* ( A * (A'))) * sum(repmat(( sum(A, 1) .* sum(A, 1)), [n, 1]), 2)), 1)  .* 90) ...
  + (sum(( ( ( A * (A')) .* ( A * (A'))) * repmat(sum(( sum(A, 2) .* sum(A, 2)), 1), [n, 1])), 1)  .* 90) ...
  + ( sum(( ( sum(A, 1) .* sum(A, 1)) * ( ( (A') * A) .* ( (A') * A))), 2) .* -360) ...
  + ( sum(( sum(( A .* A), 1) * ( ( (A') * A) .* ( (A') * A))), 2) .* -360) ...
  + (( repmat(sum(sum(( A .* A), 2), 1), [1, m]) * sum(( ( (A') * A) .* ( (A') * A)), 2))  .* 90) ...
  + ( sum(sum(( A .* ( ( A * (A')) * ( A .* ( A .* A)))), 2), 1) .* 480)  + ( sum(sum(( ( ( A * (A')) * A) .* ( ( A * (A')) * A)), 2), 1) .* 120))) / 4096;         
normalization = sum(abs(original(:)));
assert(sum(abs(original(:) - optimized(:))) / normalization < 1e-10);
