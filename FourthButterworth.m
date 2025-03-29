function [v_PTR, v_BGR] = FourthButterworth(v_series, dt, Tp, alpha_1)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Created by Haopeng Duan, 2025/03/29, https://www.hpduan.cn
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fc = 1/(alpha_1*Tp-dt);       % truncation frequency
    fs = 1/dt;
    wn = 2*fc/fs;
    [b, a] = butter(4, wn, 'low');   % design 4th-order butterworth
    v_PTR = filter(b, a, v_series);  % pulse-type record-PTR
    v_BGR = v_series-v_PTR;        % high-frequency background record-BGR
end



