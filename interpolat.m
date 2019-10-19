function z = interpolat(y, r)
	z = zeros(size(y, 1), size(y,2) * r);

	for i = 1:size(y, 1)
		x = y(i, :);
		z(i, :) = interp(x, r);
	end