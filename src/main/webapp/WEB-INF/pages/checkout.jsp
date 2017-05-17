<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<h2>Summary:</h2>

<h2>Total : "${total}" Lei</h2>
<h2>Numer of items : "${cartItems.size()}"</h2>


<div class="row">
    <form id="newAddressForm" action="<c:url value='/checkout.do' />" method="POST">
        <h4 class="modal-title">New delivery address</h4>
        <div class="modal-body">
            <div class="form-group">
                <label for="inputEmail">Street</label>
                <input type="text" name="street" class="form-control" placeholder="Street" required="true" autofocus="true">
            </div>
            <div class="form-group">
                <label for="inputEmail">Street number</label>
                <input type="text" name="number" class="form-control" placeholder="Street number" required="false">
            </div>
            <div class="form-group">
                <label for="inputEmail">City</label>
                <input type="text" name="city" class="form-control" placeholder="City" required="true">
            </div>
            <div class="form-group">
                <label for="inputEmail">Country</label>
                <input type="text" name="country" class="form-control" placeholder="Country" required="true">
            </div>
            <div class="form-group">
                <label for="inputEmail">Zip code</label>
                <input type="text" name="zip" class="form-control" placeholder="Zip code" required="true">
            </div>
        </div>
        <div class="modal-footer">
            <button id="submit" type="button" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>


<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
<c:forEach var="address" items="${addresses}" varStatus="loop">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_${loop.index}">
                    Address #${loop.index}
                </a>
            </h4>
        </div>
        <div id="collapse_${loop.index}" class="panel-collapse collapse ${loop.index == 0 ? 'in' : ''}">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <form class="addressForm" action="<c:url value='/users/saveAddress.do' />" method="POST">
                            <input type="hidden" name="id" value="${address.id}"/>
                            <div class="form-group">
                                <label for="inputEmail">Street</label>
                                <input type="text" name="street" class="form-control" placeholder="Street" value="${address.street}" required="true">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">Number</label>
                                <input type="text" name="number" class="form-control" placeholder="Street Number" value="${address.number}" required="true">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">City</label>
                                <input type="text" name="city" class="form-control" placeholder="City" value="${address.city}" required="true">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">Country</label>
                                <input type="text" name="country" class="form-control" placeholder="Country" value="${address.country}" required="true">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">Zip code</label>
                                <input type="text" name="zip" class="form-control" placeholder="Zip code" value="${address.zip}" required="true">
                            </div>
                            <div class="row">
                                <div class="col-md-12 align-right ">
                                    <button type="button" class="update-address">Update Address</button>
                                    <button type="button" class="delete-address">Delete Address</button>
                                    <button id="submit" type="button" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</div>