<#import "parts/common.ftlh" as c>
<@c.page>
<#include "parts/navbar.ftlh">

<!--хедер-->
<div class="mt-3 container-fluid bg-black shadow">
        <div class="row justify-content-center">
                <div class="pt-3 pb-3 col-lg-5 col-md-5 col-sm-12 col-12">
                        <h1 class="mt-5 brand-style">#news</h1>
                        <p class="second-brand-style">Сайт ИСИТа в процессе создания, функции будут дополняться, а дизайн сайта возможно поменятеся. Зато сейчас вы можете оставлять анонимные отзывы преподавателям.</p>
                </div>


                <div class="pt-3 pb-3 col-lg-5 col-md-5 col-sm-12 col-12">
                        <img src="../../static/imgs/firstmessage.jpg" width="100%">
                </div>
        </div>
</div>
<br>
<br>
<br>
<br>
<br>




<!--центр-->
<div class="container">
        <div class="row justify-content-center">
                <div class="col-12">
                        <h3 class="mt-3 mb-3">Если ты увлекаешься технологиями прилашаю к нам в беседу</h3>

                        <div class="code-light-theme">
                                <p><span class="imports">import</span><span class="paths"> javax.persistence.*;</span></p>
                                <p><span class="entitys">@Entity</span></p>
                                <p><span class="imports">public class </span><span class="paths">User {</span></p>
                                <p><span class="entitys">@Id</span></p>
                                <p><span class="entitys">@GeneratedValue</span><span class="paths">(strategy=GenerationType.</span><span class="collects">AUTO</span><span class="paths">)</span> </p>
                                <p><span class="imports">private </span><span class="paths">Integer </span><span class="collects"> id</span><span class="paths">;</span> </p>
                                <p><span class="imports">private </span><span class="paths">String </span><span class="collects"> username</span><span class="paths">;</span> </p>
                                <p><span class="imports">private </span><span class="paths">String </span><span class="collects"> email</span><span class="paths">;</span> </p>
                                <p><span class="imports">private </span><span class="paths">String </span><span class="collects"> passwd</span><span class="paths">;</span> </p>
                                <p><span class="imports">private </span><span class="paths">String </span><span class="collects"> status</span><span class="paths">;</span> </p>
                                <p><span class="imports">private </span><span class="paths">boolean </span><span class="collects"> active</span><span class="paths">;</span> </p>
                                <p><span class="entitys">@ElementCollection</span><span class="paths">(targetClass = Role.</span><span class="imports">class</span><span class="paths">, fetch = FetchType.</span><span class="collects">EAGER</span><span class="paths">)</span> </p>
                                <p><span class="entitys">@CollectionTable</span><span class="paths">(name = </span><span class="strings">"user_role"</span><span class="paths">, joinColumns = </span><span class="entitys">@JoinColumn</span><span class="paths">(name = </span><span class="strings">"user_id"</span><span class="paths">))</span> </p>
                                <p><span class="entitys">@Enumerated</span><span class="paths">(EnumType.</span><span class="collects">STRING</span><span class="paths">)</span> </p>
                                <p><span class="imports">private </span><span class="paths">Set&#60;Role&#62; </span><span class="collects"> roles</span><span class="paths">;</span> </p>
                                <p><span class="imports">public </span><span class="paths">Long </span><span class="imports">getId </span><span class="paths">() { </span><span class="imports">return </span><span class="collects">id</span><span class="paths">; }</span> </p>
                                <p><span class="imports">public void setId</span><span class="paths"> (Long id) { </span><span class="imports">this.</span><span class="collects">id</span><span class="paths"> = id; }</span> </p>

                                <p><span class="entitys texted-will-be"></span></p>

                                <p><span class="imports texted-will-be-second"></span> </p>

                                <br>
                                <br>
                                <br>
                                <p><span class="paths">}</span> </p>
                        </div>
                </div>
        </div>
</div>


<br>
<br>
<br>
<br>

<div class="popub-block">
        <a href="https://www.instagram.com/blrmyfc/">backend/frontend: Айзат Ашрафуллин</a>
        <br>
        <a href="https://www.instagram.com/almaz.khadiev/">designer: Алмаз Хадиев</a>
</div>


<!--футер-->
<div class="container-fluid bg-black shadow" style="height: 150px">
        <br>
        <br>
        <br>
        <br>

        <center><p>	&#169;Команда разработчиков в количестве двух <a class="authorities">человек</a></p></center>
</div>
<script>
        var vissibl = false;

        $(".authorities").on("click", function(){
            $(".popub-block").css("display", "block");
            vissibl=true;
        });
        $(".popub-block").on("click", function(){
            $(".popub-block").css("display", "none");
            vissibl=false;
        });
</script>
<script>
        $(document).ready(function(){

            var typed = new Typed('.texted-will-be', {
                strings: ["@^1000", "@Ovettdr", "Override", "<a class='entitys molor' href='#'>@Override</a>"],
                typeSpeed: 90,
                backSpeed: 50,
                callback: function(){
                        $(".typed-cursor").css("display", "none");
                }
            });


            var typed2 = new Typed('.texted-will-be-second', {
                strings: ["^8000public boolean^1000 isAccountNonLocked^1000<span class='paths'> () {</span>  return true^800<span class='paths'>; }</span>",
                "public boolean^1000 isCredentialsNonExpired^1000<span class='paths'> () {</span>  return^800 true^800<span class='paths'>; }</span>",
                "public boolean^1000 isEnabled^1000<span class='paths'> () {</span>  return^900<span class='paths'>isActive(); }</span>"],
                typeSpeed: 90,
                backSpeed: 50
            });





        });
</script>


<style>
        .code-light-theme p{
                margin-top: 5px;
                margin-bottom: 5px;
        }

        .imports{
                color: #0F3DBA
        }
        .paths{
                color: #000;
        }
        .entitys{
                color: #CB981B;
        }
        .strings{
                color: #067D17;
        }
        .collects{
                color: #871094;
        }
        .molor:hover{
                background: #A6D2FF;
                transition-duration: 0.6s;
                padding: 3px;
                color: #CB981B;
                text-decoration: none;
        }
</style>

</@c.page>
