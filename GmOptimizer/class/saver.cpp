#include "saver.h"

Saver::Saver(QObject *parent) : QObject(parent){

}

void Saver::setVar(QString value, bool value2){
    qDebug() << value << " = "<<value2;
    if(value == "Sprays")
        sprays = value2;
    if(value == "3D Sky")
        sky3d = value2;
    if(value == "Shadows")
        shadows = value2;
    if(value == "Facial features")
        facials = value2;
    if(value == "Ragdolls")
        ragdolls = value2;
    if(value == "Gibs")
        gibs = value2;
    if(value == "Force preload")
        preload = value2;
    if(value == "Rope")
        rope = value2;
}

QString Saver::returnCode(){
    QString finalCode;
    QString sprays_code = "cl_playerspraydisable \"1\"\n";
    QString sky3d_code = "r_3dsky \"0\"\n";
    QString shadows_code = "mat_shadowstate \"0\"\nr_shadowmaxrendered \"0\"\nr_shadowrendertotexture \"0\"\nr_shadows \"0\"\n";
    QString facial_code = "r_eyes \"0\"\nr_flex \"0\"\nr_lod \"2\"\nr_rootlod \"2\"\nr_teeth \"0\"\n";
    QString ragdolls_code = "cl_ragdoll_fade_time \"0\"\ncl_ragdoll_forcefade 1\ncl_ragdoll_physics_enable \"0\"\ng_ragdoll_fadespeed \"0\"\ng_ragdoll_lvfadespeed \"0\"\nragdoll_sleepaftertime \"0\"\n";
    QString gibs_code = "cl_phys_props_enable \"0\"\ncl_phys_props_max \"0\"\nprops_break_max_pieces \"0\"\nr_propsmaxdist \"1\"\nviolence_agibs \"0\"\nviolence_hgibs \"0\"\n";
    QString rope_code = "r_drawropes 0\n";
    QString preload_code = "cl_forcepreload \"1\"\n";
    if(!sprays)
        finalCode += sprays_code;
    if(!sky3d)
        finalCode += sky3d_code;
    if(!shadows)
        finalCode += shadows_code;
    if(!facials)
        finalCode += facial_code;
    if(!ragdolls)
        finalCode += ragdolls_code;
    if(!gibs)
        finalCode += gibs_code;
    if(!rope)
        finalCode += rope_code;
    if(!preload)
        finalCode += preload_code;
    qDebug() << finalCode;
    return finalCode;
}
