import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ContatoComponent } from './contato/contato.component';
import { ErroComponent } from './erro/erro.component';
import { InicioComponent } from './inicio/inicio.component';
import { SobreComponent } from './sobre/sobre.component';

const routes: Routes = [
  //path é o nome da página e o component é o nome criado do componente
{path:'inicio', component: InicioComponent},
{path: 'sobre', component: SobreComponent},
{path:'contato', component: ContatoComponent},
//Quando não possui rota vamos mandar um redirect para o início, o patchMatch é uma proteção para não
//dar problema em nenhum navegador
{path:'', redirectTo:'/inicio', pathMatch:'full'},
//O ** significa que é uma rota que não existe
{path:'**', component: ErroComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
