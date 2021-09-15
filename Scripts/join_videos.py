from moviepy.editor import *
import click

@click.command()
@click.option('--src', type=str)
@click.option('--target', type=str)
def main(src, target):
    
    clip_src_list =['bifold_start_v2.mp4',
                    src,
                   'bifold_end_v1.mp4']


    clips = [ VideoFileClip(x) for x in clip_src_list]

    padding = 0.7
    video_clips = clips
    video_fx_list = [video_clips[0]]
    # set padding to initial video

    idx = video_clips[0].duration - padding
    for video in video_clips[1:]:
        video_fx_list.append(video.set_start(idx).crossfadein(padding))
        idx += video.duration - padding


    final_video = CompositeVideoClip(video_fx_list)
    final_video.write_videofile(target, bitrate="5000k")
    
    return None


if __name__ == '__main__':
    main()
