function F = ifft2shift(f)


F = fftshift( ifft2 (fftshift (f) ) );
