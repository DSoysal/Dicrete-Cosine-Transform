function [x , Fs ] = recorder ( audioDuration )
    recObj = audiorecorder ;
    disp (" Begin speaking .")
    recordblocking ( recObj , audioDuration ) ;
    disp (" End of recording .")
    x = getaudiodata ( recObj ) ;
    Fs = recObj . SampleRate ;
end