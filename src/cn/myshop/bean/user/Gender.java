package cn.myshop.bean.user;

public enum Gender {
    MAN {
        public String getName() {
            return "��";
        }
    },
    WOMEN {
        public String getName() {
            return "Ů";
        }
    };
    public abstract String getName();
}