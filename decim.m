function y = decim(A, r)
	y = zeros(size(A,1), ceil(size(A,2)/r));

	for i = 1:size(A,1)
		x = A(i, :);
		y(i, :) = decimate(x, r);
	end