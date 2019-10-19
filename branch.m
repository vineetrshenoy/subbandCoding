function output = branch(signal, H, F, r)

	X = filter(H, [1], signal);
	v = decim(X, r);
	z = interpolat(v, 2);
	Y = filter(F, [1], z);
	output = Y;

