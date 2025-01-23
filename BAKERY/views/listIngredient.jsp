<%@ page import="java.util.List" %>
<%@ page import="material.Ingredient" %>
<%

    List<Ingredient> ingredients = (List<Ingredient>) request.getAttribute("ingredients");
    String error = (String) request.getAttribute("error");
%>
<!-- 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste Ingredient</title>
</head>
<body>
    <%
    if (null!=error && !error.isEmpty()){
    out.print(error);
    }
    %>
    <h1>Liste Ingredient</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Stock</th>
            <th>Unit</th>
            <th>Last update</th>
            <th>price</th>
            <th>action</th>
        </tr>
        <%
            for (Ingredient ingredient : ingredients){
                out.print(ingredient.line());
            }
        %>
    </table>
    
</body>
</html> -->




<%@ include file="sideBar.jsp" %>




<div class="main-panel">
    <div class="content">
        <div class="page-inner">
            <div class="page-header">
                <h4 class="page-title">Liste Ingredient</h4>
                <ul class="breadcrumbs">
                    <li class="nav-home">
                        <a href="#">
                            <i class="flaticon-home"></i>
                        </a>
                    </li>
                    <li class="separator">
                        <i class="flaticon-right-arrow"></i>
                    </li>
                    <li class="nav-item">
                        <a href="#multi-filter-select">Multi filter</a>
                    </li>
                    <li class="separator">
                        <i class="flaticon-right-arrow"></i>
                    </li>
                    <li class="nav-item">
                        <a href="#add-row">Update Delete</a>
                    </li>
                    
                    <li class="separator">
                        <i class="flaticon-right-arrow"></i>
                    </li>
                    <li class="nav-item">
                        <a href="Ingredient?action=pageInsert">Insertion</a>
                    </li>
                </ul>
            </div>
            <div class="row">
            
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Multi Filter Select</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="multi-filter-select" class="display table table-striped table-hover" >
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Stock</th>
                                            <th>Unit</th>
                                            <th>Last update</th>
                                            <th>price</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Stock</th>
                                            <th>Unit</th>
                                            <th>Last update</th>
                                            <th>price</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>

                                        <%
                                        for (Ingredient ingredient : ingredients){
                                        %>
                                        <tr>
                                        <%
                                        out.print(ingredient.line());
                                        %>
                                        </tr>
                                        <%
                                        }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex align-items-center">
                                <h4 class="card-title">Update Delete</h4>
                                <a class="btn btn-primary btn-round ml-auto" href="Product?action=pageInsert">
                                    <i class="fa fa-plus"></i>
                                    Add Row
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            
                            <div class="table-responsive">
                                <table id="add-row" class="display table table-striped table-hover" >
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Stock</th>
                                            <th>Unit</th>
                                            <th>Last update</th>
                                            <th>price</th>
                                            <th style="width: 10%">Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Stock</th>
                                            <th>Unit</th>
                                            <th>Last update</th>
                                            <th>price</th>
                                            <th>action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%
                                        for (Ingredient ingredient : ingredients){
                                        %>
                                        <tr>
                                        <%
                                            out.print(ingredient.line());
                                        %>
                                            <td>
                                                <div class="form-button-action">
                                                    <a href="Ingredient?action=update&id_ingredient=<% out.print(ingredient.getIdIngredient()); %>" type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                    <a href="Ingredient?action=delete&id_ingredient=<% out.print(ingredient.getIdIngredient()); %>"type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove">
                                                        <i class="fa fa-times"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                        }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>
<%@ include file="custom.jsp" %>
