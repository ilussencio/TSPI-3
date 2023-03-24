package org.example;

public class EquipamentoSonoro extends Equipamento {
    public int volume;
    public boolean stereo;

    public EquipamentoSonoro(Boolean ligado, int volume, boolean stereo) {
        super(ligado);
        this.volume = volume;
        this.stereo = stereo;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }

    public boolean isStereo() {
        return stereo;
    }

    public void setStereo(boolean stereo) {
        this.stereo = stereo;
    }
    public void mono(){
        this.stereo = false;
    }
    public void stereo(){
        this.stereo = true;
    }

    @Override
    public void Liga() {
        super.Liga();
        this.volume = 5;
    }
}
